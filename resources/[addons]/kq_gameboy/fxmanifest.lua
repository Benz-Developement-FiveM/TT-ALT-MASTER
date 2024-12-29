fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

author 'KuzQuality | Kuzkay'
description 'Gameboy by KuzQuality'
version '1.2.0'

ui_page 'html/index.html'

--
-- Files
--

files {
    'html/js/jquery.js',
    'html/fonts/nunito.ttf',
    'html/thumbnails/*.png',
    
    'html/img/*.png',
    'html/img/*.jpg',
    'html/style.css',
    'html/index.html',
    'html/games/*.html',

    'html/images/*.png',
    'html/images/*.gif',

    'html/sounds/*.wav',
    'html/sounds/*.mp3',
    'html/sounds/*.mid',

    'html/audio/*.wav',

    'html/games/flappy_bird/main.js',
    'html/games/flappy_bird/index.html',

    'html/games/2048/main.js',
    'html/games/2048/index.html',


    'html/games/mario/Enjine/core.js',
    'html/games/mario/Enjine/gameCanvas.js',
    'html/games/mario/Enjine/keyboardInput.js',
    'html/games/mario/Enjine/resources.js',
    'html/games/mario/Enjine/drawable.js',
    'html/games/mario/Enjine/state.js',
    'html/games/mario/Enjine/gameTimer.js',
    'html/games/mario/Enjine/camera.js',
    'html/games/mario/Enjine/drawableManager.js',
    'html/games/mario/Enjine/sprite.js',
    'html/games/mario/Enjine/spriteFont.js',
    'html/games/mario/Enjine/frameSprite.js',
    'html/games/mario/Enjine/animatedSprite.js',
    'html/games/mario/Enjine/collideable.js',
    'html/games/mario/Enjine/application.js',

    'html/games/mario/code/setup.js',
    'html/games/mario/code/spriteCuts.js',
    'html/games/mario/code/level.js',
    'html/games/mario/code/backgroundGenerator.js',
    'html/games/mario/code/backgroundRenderer.js',
    'html/games/mario/code/improvedNoise.js',
    'html/games/mario/code/notchSprite.js',
    'html/games/mario/code/character.js',
    'html/games/mario/code/levelRenderer.js',
    'html/games/mario/code/levelGenerator.js',
    'html/games/mario/code/spriteTemplate.js',
    'html/games/mario/code/enemy.js',
    'html/games/mario/code/fireball.js',
    'html/games/mario/code/sparkle.js',
    'html/games/mario/code/coinAnim.js',
    'html/games/mario/code/mushroom.js',
    'html/games/mario/code/particle.js',
    'html/games/mario/code/fireFlower.js',
    'html/games/mario/code/bulletBill.js',
    'html/games/mario/code/flowerEnemy.js',
    'html/games/mario/code/shell.js',
    'html/games/mario/code/titleState.js',
    'html/games/mario/code/loadingState.js',
    'html/games/mario/code/loseState.js',
    'html/games/mario/code/winState.js',
    'html/games/mario/code/mapState.js',
    'html/games/mario/code/levelState.js',
    'html/games/mario/code/music.js',


    'html/games/mario/main.html',
}

--
-- Client
--

client_scripts {
    'config.lua',
    'client/head.lua',
    'client/client.lua',
}
--
-- Server
--

server_scripts {
    'config.lua',
    'server/server.lua',
}

escrow_ignore {
    'config.lua',
    'server/server.lua',
    'client/head.lua',
}

dependency '/assetpacks'