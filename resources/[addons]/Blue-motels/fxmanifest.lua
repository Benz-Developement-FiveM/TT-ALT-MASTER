fx_version 'cerulean'
games {'gta5'}

lua54 'on'
author 'Bluebenji#0957'

escrow_ignore {
    'config.lua',
    'fxmanifest.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'server/main.lua',
}

client_scripts {
    'config.lua',
    'client/main.lua',
}

dependency '/assetpacks'