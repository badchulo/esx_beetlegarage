fx_version 'adamant'

game 'gta5'

author 'FedeArre'
description 'ESX garage system with vehicle preview'
version '1.3.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/*.lua',

	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/*.lua',
	
	'config.lua',
    'client/main.lua'
}

dependencies {
	'mysql-async'
}