Config = Config or {}

-------             CONFIGURATION          --------           
---------------------------------------------------

Config.Framework                            = "qbcore"                    -- "qbcore" or "qbox" or "esx"
Config.FrameworkResourceName                = "qb-core"                 -- "qb-core" for QBCore/QBox or "es_extended" for ESX

-- For QBCore & ESX ONLY
Config.IsUsingOverextendedInventory         = false                     -- Whether or not you are using the overextended inventory system. 
                                                                        -- If you are using the default QBCore inventory or one that hooks default QB functions, or the default ESX inventory then leave this as false.
                                                                        -- QBox only supports ox_inventory, so this does not apply for QBox.

-- For ESX ONLY - not required for QBCore / QBox
Config.IsUsingIlleniumAppearance            = false                      -- Whether or not you are using illenium appearance. This toggle works on ESX only, since QBCore and Qbox versions of illenium work with default triggers.

-- For QBox ONLY OR QBCore with Overextended Inventory (above set to true)
-- If your ox_inventory resource name is different, change it here
Config.OxInventoryResourceName              = "ox_inventory"            -- The name of the ox_inventory resource if you are using QBox framework. Ignore if not.

Config.DefaultDarkMode                      = 1                         -- Whether dark mode should be enabled by default. 1 is on by default, 0 is off

Config.ServerName                           = ""
Config.ServerDiscord                        = ""                        -- For kick/ban messages

Config.NoClipKey                            = "INSERT"                  -- The default key to start noclip
Config.AdminPanelKey                        = "PAGEDOWN"                -- The default key to open the admin panel
Config.ShowNamesKey                         = "F7"                      -- The default key to toggle player names

Config.EnableAdminPanelCommand              = true                      -- Whether to enable the admin panel command (/a by default)
Config.AdminPanelCommand                    = "a"

Config.NoClipType                           = 1                         -- 1 (default) NEW txAdmin-like NoClip system, or 2 for old style 919Admin NoClip system, or 3 for default qbcore NoClip system

Config.ShowIPInIdentifiers                  = true                     -- Whether to show player's IPs in the identifiers box in player info view

Config.EnableReportCommand                  = true                      -- Enable or disable the report command if you use another report system (reports tab will still show)
Config.ReportCommand                        = "report"                  -- The command to use for reports (default /report)
Config.MaxReportsPerPlayer                  = 2                         -- The maximum amount of reports a player can place
Config.SaveTOJSON                           = true                      -- Whether to save reports, adminchat, and logs to JSON onResourceStopped (server restarts etc) and load from JSON on resource start

Config.LeaderboardCacheTimer                = 60000 * 60                -- How often the leaderboard cache should be updated (in milliseconds, default = 60 minutes)

Config.AnnounceBan                          = false                     -- Whether to announce bans in chat or not
Config.TagEveryone                          = false                     -- Enable to tag everyone in the discord log on ban

Config.EnableNames                          = true                      -- Whether or not to enable the names overhead feature (permissioned only as of 919ADMIN 1.8)

Config.ShowWarningScreen                    = true                      -- Whether or not to show the red warning screen when a player is warned.

Config.PlayerGraphFrequency                 = 300000                    -- How often the player graph should update (in milliseconds, default = 5 mins)

Config.TeleportLocations                    = {                         -- The locations that are listed in the "send to" menu, and on the dashboard for yourself to go to.
    { id = "pillbox", label = "Pillbox", coords = vector3(299.01, -577.48, 43.26) },
    { id = "legion", label = "Legion Square", coords = vector3(215.75, -804.26, 30.81) },
    { id = "lsc", label = "LS Customs", coords = vector3(-366.58, -126.01, 38.69) },
    { id = "mrpd", label = "MRPD", coords = vector3(415.41, -993.4, 29.38) },
    { id = "sandy", label = "Sandy Shores", coords = vector3(1963.56, 3735.19, 32.2) },
    { id = "grapeseed", label = "Grapeseed", coords = vector3(1692.89, 4942.49, 42.32) },
    { id = "paleto", label = "Paleto Bay", coords = vector3(125.64, 6611.6, 31.86) },
    { id = "lsia", label = "LS International Airport", coords = vector3(-1021.81, -2701.25, 13.76) },
}

Config.RoleColors = {                                                   -- The colors for the different roles in the admin panel's player list. You can use hex codes or predefined css colors.
    ["god"] = "red",
    ["admin"] = "orange",
    ["mod"] = "blue",
}

-- ADVANCED CONFIGURATION
Config.LargeEventDataBitrate                = 200000                    -- The bitrate for large events (like the player list, default = 0.2mbps / 200kbps / 200,000bps)
Config.CharactersCacheExpiry                = 300000                    -- How long the main characters cache should last (in milliseconds, default = 5 minutes)
Config.ServerMetricsCacheExpiry             = 300000                    -- How long the server metrics cache should last (in milliseconds, default = 5 minutes)
Config.EnableDebug                          = false                     -- Whether to enable debug prints or not

-- QBCore:
--[[

Config.ClientFillVehicleFuel = function(vehicle)
    exports['LegacyFuel']:SetFuel(vehicle, 100)
end

]]

Config.ClientFillVehicleFuel = function(vehicle)
    Entity(vehicle).state.fuel = 100
end

Config.RoleOrder = { -- The order of the roles to check for player list. The first role in the list will be the first to be checked so you don't show up as the wrong role due to ace perms.
    [1] = "god",
    [2] = "admin",
    [3] = "mod",
}

Config.Permissions = {
    ["god"] = {
        AllowedActions = {
            "adminmenu", -- Open the admin menu

            -- Page Permissions
            "characterspage", -- Access the All Characters page
            "resourcepage", -- Access the Resource control page
            "serverlogs", -- Access the server logs page
            "servermetrics", -- Access the server metrics page
            "jobpage", -- Access the jobs page
            "gangpage", -- Access the gangs page
            "banspage", -- Access the bans page
            "vehiclesinfo", -- Access the vehicle spawn code list page
            "itemsinfo", -- Access the item spawn code list page
            "adminchat", -- Access the admin chat page
            "leaderboardinfo", -- Access the leaderboard page
            "mapinfo", -- Access the map page

            -- Misc Permissions
            "deletecharacter", -- Delete a character
            "viewreports", -- Access the reports list
            "claimreport", -- Claim a report
            "deletereport", -- Delete a report

            --------------------------------- Self Actions Group ---------------------------------
            "revives", -- Revive yourself
            "feeds", -- Feed yourself
            "uncuffSelf", -- Uncuff yourself
            "goback", -- Teleport back
            "tpm", -- Teleport to marker
            "sclothing", -- Give yourself the skin menu
            "invisibility", -- Toggle invisibility
            "playerblips", -- Toggles player blips on the map
            "playernames", -- Toggle player names
            "fastrun", -- Toggles fast run
            "noclip", -- Noclip
            "godmode", -- Toggles godmode
            "forceradar", -- Force minimap on
            "superjump", -- Toggles super jump
            "noragdoll", -- Toggles ragdoll
            "infinitestam", -- Toggles infinite stamina
            "clearblood", -- Clears your ped of blood and visual damage
            "wetclothes", -- Makes your clothes wet
            "dryclothes", -- Dries off your clothes

            --------------------------------- Server Actions Group ---------------------------------
            "reviveall", -- Revive all players
            "messageall", -- Message all players
            "setweather", -- Change the server weather
            "settime", -- Change the server time

            --------------------------------- Vehicle Actions Group ---------------------------------
            "repairvehicle", -- Repair a vehicle
            "fillgastank", -- Fills the gas tank of the vehicle you're in
            "washvehicle", -- Washes the vehicle you're in
            "maxperformanceupgrades", -- Max performance upgrades (vehicle)
            "randomvisualparts", -- Random visual parts (vehicle)
            "setcolor", -- Set color (vehicle)
            "setlivery", -- Set liver (vehicle)
            "setmedriver", -- Teleport into nearest vehicle as driver
            "setmepassenger", -- Teleport into nearest vehicle as passenger
            "lockvehicle", -- Lock a vehicle
            "unlockvehicle", -- Unlock a vehicle


            --------------------------------- Developer Actions Group ---------------------------------
            "vec3", -- Get vector3 position
            "vec4", -- Get vector4 position
            "heading", -- Get your heading
            "loadipl", -- Load an IPL (map section)
            "unloadipl", -- Unload an IPL (map section)
            "setViewDistance", -- Set view distance
            "copyEntityInfo", -- Copy entity information
            "freeaimMode", -- Enable free aim mode
            "displayVehicles", -- Display vehicle dev mode
            "displayPeds", -- Display peds dev mode
            "displayObjects", -- Display objects dev mode

            --------------------------------- Entity Actions Group ---------------------------------
            "spawncar", -- Spawn a vehicle
            "deleteclosestvehicle", -- Delete closest vehicle
            "deleteclosestped", -- Delete closest ped
            "deleteclosestobject", -- Delete closest ped
            "massdv", -- Delete all spawned vehicles, even population ones
            "massdp", -- Delete all peds, even population ones

            --------------------------------- Management Actions Group ---------------------------------
            "clearreports", -- Clear reports
            "clearadminchat", -- Clear adminchat
            "clearlogs", -- Clear logslist

            --------------------------------- Player Actions Group ---------------------------------
            "revive", -- Revive a player
            "foodandwater", -- Feed a player
            "relievestress", -- Relieve stress of a player
            "repairplayervehicle", -- Repair a player's vehicle
            "setpedmodel", -- Set a player's ped model
            "clothing", -- Give a player the skin menu
            "savecar", -- Add a player's current vehicle to their garage
            "savedata", -- Save player data
            "teleport", -- Teleport yourself, others, to location
            "bring", -- Bring a player to you (requires teleport permission)
            "sendback", -- Send a player back to their location (requires teleport permission)
            "sendto", -- Send a player to a location (requires teleport permission)
            "screenshot", -- Screenshot a player
            "spectate", -- Spectate a player
            "givetakemoney", -- Give or take money from a player
            "givecash", -- Give cash to a player (requires givetakemoney permission)
            "removecash", -- Remove cash from a player (requires givetakemoney permission)
            "givebank", -- Give bank money to a player (requires givetakemoney permission)
            "removebank", -- Remove bank money from a player (requires givetakemoney permission)
            "setjob", -- Set job of a player
            "firejob", -- Fire a player from their job
            "setgang", -- Set gang of a player
            "firegang", -- Fire a player from their gang
            "giveitem", -- Give a player an item, or several thousand
            "openinventory", -- Open a player's inventory
            "clearinventory", -- Clear inventory
            "cuff", -- Cuff/uncuff a player
            "freeze", -- Freeze a player
            "kill", -- Kill yourself, others
            "kick", -- Kick a player from the server
            "checkwarns", -- Check the warnings of a player
            "warn", -- Warn a player
            "ban", -- Ban a player from the server
            "unban", -- Unban a player
        },
    },
    ["admin"] = {
        AllowedActions = {
            "adminmenu", -- Open the admin menu

            -- Page Permissions
            "characterspage", -- Access the All Characters page
            "resourcepage", -- Access the Resource control page
            "serverlogs", -- Access the server logs page
            "servermetrics", -- Access the server metrics page
            "jobpage", -- Access the jobs page
            "gangpage", -- Access the gangs page
            "banspage", -- Access the bans page
            "vehiclesinfo", -- Access the vehicle spawn code list page
            "itemsinfo", -- Access the item spawn code list page
            "adminchat", -- Access the admin chat page
            "leaderboardinfo", --Check the leaderboards

            -- Misc Permissions
            "deletecharacter", -- Delete a character
            "viewreports", -- Access the reports list
            "claimreport", -- Claim a report
            "deletereport", -- Delete a report

            --------------------------------- Self Actions Group ---------------------------------
            "revives", -- Revive yourself
            "feeds", -- Feed yourself
            "uncuffSelf", -- Uncuff yourself
            "goback", -- Teleport back
            "tpm", -- Teleport to marker
            "sclothing", -- Give yourself the skin menu
            "invisibility", -- Toggle invisibility
            "playerblips", -- Toggles player blips on the map
            "playernames", -- Toggle player names
            "fastrun", -- Toggles fast run
            "noclip", -- Noclip
            "godmode", -- Toggles godmode
            "forceradar", -- Force minimap on
            "superjump", -- Toggles super jump
            "noragdoll", -- Toggles ragdoll
            "infinitestam", -- Toggles infinite stamina
            "clearblood", -- Clears your ped of blood and visual damage
            "wetclothes", -- Makes your clothes wet
            "dryclothes", -- Dries off your clothes

            --------------------------------- Server Actions Group ---------------------------------
            "reviveall", -- Revive all players
            "messageall", -- Message all players
            "setweather", -- Change the server weather
            "settime", -- Change the server time

            --------------------------------- Vehicle Actions Group ---------------------------------
            "repairvehicle", -- Repair a vehicle
            "fillgastank", -- Fills the gas tank of the vehicle you're in
            "washvehicle", -- Washes the vehicle you're in
            "maxperformanceupgrades", -- Max performance upgrades (vehicle)
            "randomvisualparts", -- Random visual parts (vehicle)
            "setcolor", -- Set color (vehicle)
            "setlivery", -- Set liver (vehicle)
            "setmedriver", -- Teleport into nearest vehicle as driver
            "setmepassenger", -- Teleport into nearest vehicle as passenger
            "lockvehicle", -- Lock a vehicle
            "unlockvehicle", -- Unlock a vehicle


            --------------------------------- Developer Actions Group ---------------------------------
            "vec3", -- Get vector3 position
            "vec4", -- Get vector4 position
            "heading", -- Get your heading
            "loadipl", -- Load an IPL (map section)
            "unloadipl", -- Unload an IPL (map section)
            "setViewDistance", -- Set view distance
            "copyEntityInfo", -- Copy entity information
            "freeaimMode", -- Enable free aim mode
            "displayVehicles", -- Display vehicle dev mode
            "displayPeds", -- Display peds dev mode
            "displayObjects", -- Display objects dev mode

            --------------------------------- Entity Actions Group ---------------------------------
            "spawncar", -- Spawn a vehicle
            "deleteclosestvehicle", -- Delete closest vehicle
            "deleteclosestped", -- Delete closest ped
            "deleteclosestobject", -- Delete closest ped
            "massdv", -- Delete all spawned vehicles, even population ones
            "massdp", -- Delete all peds, even population ones

            --------------------------------- Management Actions Group ---------------------------------
            "clearreports", -- Clear reports
            "clearadminchat", -- Clear adminchat
            "clearlogs", -- Clear logslist

            --------------------------------- Player Actions Group ---------------------------------
            "revive", -- Revive a player
            "foodandwater", -- Feed a player
            "relievestress", -- Relieve stress of a player
            "repairplayervehicle", -- Repair a player's vehicle
            "setpedmodel", -- Set a player's ped model
            "clothing", -- Give a player the skin menu
            "savecar", -- Add a player's current vehicle to their garage
            "savedata", -- Save player data
            "teleport", -- Teleport yourself, others, to location
            "bring", -- Bring a player to you (requires teleport permission)
            "sendback", -- Send a player back to their location (requires teleport permission)
            "sendto", -- Send a player to a location (requires teleport permission)
            "screenshot", -- Screenshot a player
            "spectate", -- Spectate a player
            "givetakemoney", -- Give or take money from a player
            "givecash", -- Give cash to a player (requires givetakemoney permission)
            "removecash", -- Remove cash from a player (requires givetakemoney permission)
            "givebank", -- Give bank money to a player (requires givetakemoney permission)
            "removebank", -- Remove bank money from a player (requires givetakemoney permission)
            "setjob", -- Set job of a player
            "firejob", -- Fire a player from their job
            "setgang", -- Set gang of a player
            "firegang", -- Fire a player from their gang
            "giveitem", -- Give a player an item, or several thousand
            "openinventory", -- Open a player's inventory
            "clearinventory", -- Clear inventory
            "cuff", -- Cuff/uncuff a player
            "freeze", -- Freeze a player
            "kill", -- Kill yourself, others
            "kick", -- Kick a player from the server
            "checkwarns", -- Check the warnings of a player
            "warn", -- Warn a player
            "ban", -- Ban a player from the server
            "unban", -- Unban a player
        },
    },
    ["mod"] = {
        AllowedActions = {
            "adminmenu", -- Open the admin menu

            "viewreports", -- Access the reports list
            "claimreport", -- Claim a report
            "deletereport", -- Delete a report
            "adminchat", -- Access the admin chat

            "itemsinfo", -- Access the item spawn code list page
            "noclip", -- Noclip
            "spectate", -- Spectate a player
            "teleport", -- Teleport yourself, others, to location
            "giveitem", -- Give a player an item, or several thousand

            "goback",
            "tpm",
            "playernames",
        },
    }
}


-------               FUNCTIONS            --------           
---------------------------------------------------

function DebugTrace(message)
    if Config.EnableDebug then
        print("^3[919DESIGN Admin ("..GetCurrentResourceName()..")]^7 "..message)
    end
end