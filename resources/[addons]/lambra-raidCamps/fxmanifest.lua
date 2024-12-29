fx_version 'cerulean'
game 'gta5'
version '1.1.0'

shared_scripts {
    'config.lua'
}

client_script 'client/main.lua'
client_script 'client/functions.lua'

server_script 'server/main.lua'

lua54 'yes'

escrow_ignore {
    'config.lua',
    'client/functions.lua'
}
dependency '/assetpacks'