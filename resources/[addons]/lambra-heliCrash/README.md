INSTALLATION


Add the following to qb-core/config.lua below line 62 at metadata:
    lambrahelicrash = 0,


If your running old QB go instead to (qb-core/server/player.lua) below: 
   PlayerData.metadata = PlayerData.metadata or {}

Paste this:
    PlayerData.metadata['lambrahelicrash'] = PlayerData.metadata['lambrahelicrash'] or 0