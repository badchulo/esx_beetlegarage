ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_vehiclelock:requestPlayerCars', function(source, cb, plate)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE (owner = @owner OR segundallave = @owner) AND plate = @plate', {
		['@owner'] = xPlayer.identifier,
		['@plate'] = plate
	}, function(result)
		cb(result[1] ~= nil)
	end)
end)

RegisterNetEvent('esx_vehiclelock:darllaves')
AddEventHandler('esx_vehiclelock:darllaves', function(idrecibe, plate)
    -- Get the buyer and seller
    local buyer = ESX.GetPlayerFromId(source)
    local recibidor = ESX.GetPlayerFromId(idrecibe)
	
	MySQL.Async.execute('UPDATE owned_vehicles SET segundallave = @recibidor WHERE owner = @owner AND plate = @plate',
		{ ['@owner'] = buyer.identifier,
		['@plate'] = plate,
		['@recibidor'] = recibidor.identifier },
	function(affectedRows)
		TriggerClientEvent('mythic_notify:client:SendAlert', idrecibe, { type = 'inform', text = 'Has recibido las llaves de un coche', length = 2500, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
	end)
end)