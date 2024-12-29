INSTALLATION


Add the following to qb-core/config.lua below line 62 at metadata:
    lambraraidcamps = 0,


If your running old QB go instead to (qb-core/server/player.lua) below: 
   PlayerData.metadata = PlayerData.metadata or {}

Paste this:
    PlayerData.metadata['lambraraidcamps'] = PlayerData.metadata['lambraraidcamps'] or 0