-- Resource Metadata
fx_version 'cerulean'
game 'gta5'

files {
  'data/**/**/*.meta',
  --'data/**/**/*.xml',
  --'data/**/**/*.dat',
  --'data/**/**/*.ytyp',
 'audioconfig/lamavgineng_amp.dat10.rel',
 'audioconfig/lamavgineng_game.dat151.rel',
 'audioconfig/lamavgineng_sounds.dat54.rel',
 'sfx/dlc_lamavgineng/lamavgineng.awc',
 'sfx/dlc_lamavgineng/lamavgineng_npc.awc',
}

data_file 'HANDLING_FILE'            'data/**/**/handling*.meta'
data_file 'VEHICLE_LAYOUTS_FILE'    'data/**/**/vehiclelayouts*.meta'
data_file 'VEHICLE_METADATA_FILE'    'data/**/**/vehicles*.meta'
data_file 'CARCOLS_FILE'            'data/**/**/carcols*.meta'
data_file 'VEHICLE_VARIATION_FILE'    'data/**/**/carvariations*.meta'
data_file 'CONTENT_UNLOCKING_META_FILE' 'data/**/**/*unlocks.meta'
data_file 'PTFXASSETINFO_FILE' 'data/**/**/ptfxassetinfo.meta'
data_file 'AUDIO_SYNTHDATA' 'audioconfig/lamavgineng_amp.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/lamavgineng_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/lamavgineng_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_lamavgineng'

--client_script 'vehicle_names.lua'

--server_script 'server.lua'