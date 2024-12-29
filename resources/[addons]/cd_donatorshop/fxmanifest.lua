fx_version 'cerulean'
game 'gta5'
author 'discord.gg/codesign'
description 'Donator Shop'
version '4.0.5'
lua54 'yes'

shared_scripts {
    'configs/locales.lua',
    'configs/config.lua'
}

client_scripts {
    'configs/client_customise_me.lua',
    'client/*.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua', --⚠️PLEASE READ⚠️; Remove this line if you don't use 'mysql-async'.⚠️
    --'@oxmysql/lib/MySQL.lua', --⚠️PLEASE READ⚠️; Uncomment this line if you use 'oxmysql'.⚠️
    'configs/server_customise_me.lua',
    'configs/server_webhooks.lua',
    'configs/server_reward_players.lua',
    'server/*.lua'
}

ui_page {
    'html/index.html'
}

files {
    'configs/locales_ui.js',
    'configs/config_ui.js',
    'configs/config_ui.js',
    'html/css/*.css',
    'html/js/*.js',
    'html/index.html',
    'html/images/products/*.png',
    'html/images/logos/*.png'
}

server_exports {
    'GetBalance',
    'AddBalance',
    'RemoveBalance',
    'CanPurchaseCheck'
}

dependencies {
    '/server:4960', --⚠️PLEASE READ⚠️; Requires at least server build 4960.
    'cd_drawtextui' --⚠️PLEASE READ⚠️; Remove this line if you don't use 'cd_drawtextui'.⚠️
}

escrow_ignore {
    'client/functions.lua',
    'configs/*.lua',
    'server/version_check.lua'
}
dependency '/assetpacks'