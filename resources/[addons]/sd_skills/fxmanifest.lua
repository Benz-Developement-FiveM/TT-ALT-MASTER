fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Samuel#0008'
description 'Skills UI for FiveM'
Version '1.0.2'

client_script 'client/*.lua'

server_scripts { '@oxmysql/lib/MySQL.lua', 'server/*.lua' }

shared_scripts { '@sd_lib/init.lua', '@ox_lib/init.lua' }

ui_page 'html/ui.html'

files {
    'skills.lua',
    'html/ui.html',
    'html/style.css',
    'html/app.js'
}