----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

fx_version 'cerulean'

game 'gta5'

author 'CASE#1993'

description 'BOII | Development - Drugs; Weed'

version '1.3.9'

lua54 'yes'

shared_scripts {
    'shared/*'
}
client_scripts {
    'client/**/*',
    'escrow/locked_cl.lua'
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*',
    'escrow/locked_sv.lua'
}
escrow_ignore {
    'shared/*',
    'client/**/*',
    'server/*'
}
dependency '/assetpacks'