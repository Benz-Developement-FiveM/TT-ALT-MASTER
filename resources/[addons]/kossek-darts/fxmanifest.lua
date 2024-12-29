fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'k0sseK'

client_scripts {
	'config.lua',
	'client/*.lua'
}

server_scripts {
	'config.lua',
	'server/*.lua'
}

files {
    -- 'html/*.html',
    -- 'html/*.js',
    -- 'html/*.css',
    -- 'html/img/*.png',
    -- 'html/img/*.jpg',
	'html/**'
}

dependencies {
	'kossek-darts-assets'
}

escrow_ignore {
	'config.lua',
	'client/*.lua',
	'server/*.lua'
}
dependency '/assetpacks'