fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Sky-Systems'
description 'Dailyrewards'

client_scripts {"client/main.lua", "config/custom/client.lua"}

server_scripts {"server/main.lua", "config/garage.lua", "config/custom/server.lua", "@mysql-async/lib/MySQL.lua"}

escrow_ignore {"config/garage.lua", "config/custom/client.lua", "config/custom/server.lua"}

ui_page 'html/index.html'

files {'html/index.html', 'html/img/**', 'html/css/*', 'html/js/*'}

exports {"open"}

dependency '/assetpacks'