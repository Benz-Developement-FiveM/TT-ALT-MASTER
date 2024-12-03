----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

fx_version 'cerulean'

game 'gta5'

author 'CASE#1993'

description 'BOII | Development - Drug System'

version '1.0.1'

lua54 'yes'

shared_scripts {
    'shared/*'
}
client_scripts {
    'client/**/*',
}
server_scripts {
    'server/*',
}
escrow_ignore {
    'shared/*',
    'client/**/*',
    'server/*'
}
dependency '/assetpacks'