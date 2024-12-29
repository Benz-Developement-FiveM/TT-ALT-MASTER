Config = {}

Config.CoreName = "qb-core"

Config.resetDelay = math.random(600000, 700000) -- time in ms (time that the server will verify if it should create another) if there is already a zone running or the max multipleZones has been reached it wont create and will wait again the timer
Config.chance = 50 -- chance to create the heli crash
Config.timeToLoot = 8000-- time in ms that the player will take to loot one position
Config.timeDeleteHeli = 10000 -- the time that will take for the heli to be deleted after the heli is looted
Config.weaponRequired = "weapon_flashlight" -- set this to "none" so player wont need the weapon, i recommend using a flashlight but you can use a crowbar or whatever....
Config.multipleZones = 1 -- The amount of zones that can be active at the same time (YOU MUST ADD NEW CRASHZONES IF YOU INCREASE THIS VALUE)

Config.Blip = {
    enableBlip = true, --This will show the exact position of the Heli crash
    sprite = 759,
    scale = 1.0,
    color = 4,

    enableRadius = false, --This will randomly create a circle blip around the heli so players know a certain area to scavenge
    radiusRange = 300.0,
    radiusColor = 1,
    radiusAlpha = 155
}

Config.LevelRewards = {
    -- Levels are from 0 to 100 exp scale, so imagine if a player have 500exp he is level 5 etc...
    -- It will choose one random item considering the level of the player

    -- You can add more levels and items for each level as you wish
    [0] = {
        [1] = {item = "steel", amount = 1},
        [2] = {item = "iron", amount = 1},
        [3] = {item = "metalscrap", amount = 1}
    },
    [1] = {
        [1] = {item = "steel", amount = 10},
        [2] = {item = "iron", amount = 10},
        [3] = {item = "metalscrap", amount = 10}
    },
    [2] = {
        [1] = {item = "steel", amount = 20},
        [2] = {item = "iron", amount = 20},
        [3] = {item = "metalscrap", amount = 20}
    },
}

Config.crashZones = {
    --You can add more crash zones as you wish
    [1] = {
        crashPos = vector4(-198.82, 4425.22, 45.5, 96.38), --Location that heli will crash
        expGiving = 15, -- The amount of EXP that the guy receives for each loot pos (Setting this to 0 wont give EXP to the player)
        lootPos = {--You can add more loot offset positions of the heli
            {x = -1.0, y = 1.7, z = 1.0}, --front left door
            {x = 1.0, y = 1.7, z = 1.0}, --front right door
            {x = -1.0, y = -0.1, z = 1.0}, --back left door
            {x = 1.0, y = -0.1, z = 1.0}, --back right door
        },
        rareDrop = {
            enabled = true, --If it should spawn the rare drop for this heliCrash
            chanceToSpawn = 30, --The chance for the rare drop to be created
            propModel = "prop_mb_crate_01a", --you can change this to another model, for example a dead corpse etc
            coords = vector4(-204.26, 4417.71, 45.84, 289.35), -- spawn position of the rareDrop
            possibleRewards = {--List of items, one of them will be randomly picked
                --You can add more items to the pool
                [1] = {item = "steel", amount = 50}
            }
            
        }
    },
}

Locales = {
    ["bliptext"] = "Heli Crash",
    ["searchloot"] = "Press [~r~E~w~] to search",
    ["looting"] = "Searching for loot",
    ["alreadyLooted"] = "Someone already searched in here",
    ["earnedEXP"] = "You earned ",
    ["exp"] = "EXP",
    ["yourLevel"] = "Your Level: ",
    ["yourEXP"] = "Your EXP: "
}