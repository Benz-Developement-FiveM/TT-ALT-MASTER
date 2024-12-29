Config = {}
-- Debug mode. Should not be enabled on a live server!
Config.debug = false

-- Whether or not to use animations
Config.useAnimations = true


-- Gameboy command settings
Config.command = {
    enabled = false,
    command = 'gameboy',
    shortCommand = 'gb'
}

-- ESX settings
Config.esx = {
    enabled = false,
    itemName = 'gameboy',
    
    -- Whether or not to use the new ESX export method
    useNewESXExport = true,
}

-- QB settings
Config.qb = {
    enabled = true,
    useNewQBExport = true, -- If you're still using the old QB export method set this to false and add old impor to the fxmanifest
    itemName = 'gameboy',
}
