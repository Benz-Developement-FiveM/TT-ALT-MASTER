Config = {}
Config.CoreName = "qb-core"

Config.Target = "none" --"none" if you don't want to use target otherwise set this to "qb-target"
Config.Webhook = "" --If you want to receive a log of who opened the crate

Config.maxWeight = 520000 --Set your max weight according to your inventory

Config.resetDelay = 30000 -- time in ms (time that the server will verify if there is a slot for a zone to be created)
Config.delaySetup = true -- Enabling this will skip the first time for creating a zone once the resource starts
Config.forceAllDead = false -- This will only let players loot the box once all the peds are dead
Config.multipleZones = 1 -- The amount of zones/available slots that can be active at the same time (you must add more Camps if you want to use more than 1)

Config.Blip = {
    enableBlip = true,
    enableRadius = true,
    sprite = 84,
    scale = 1.0,
    color = 1,
    radiusColor = 1,
    radiusAlpha = 250
}

Config.Announces = {-- set those options to true if you want people to get notified
    onCreate = true,
    onFinished = true
}

Config.timeToLoot = 15000 -- time in ms

Config.LevelRewards = {
    -- You can add more Levels and add multiple items to each level
    -- Levels are from 0 to 100 exp scale, so imagine if a player have 300exp he is level 3 etc...
    [0] = {
        {item = "tosti", amount = 1, chance = 70},
        {item = "water_bottle", amount = 1, chance = 30},
    },
    [1] = {
        {item = "tosti", amount = 1, chance = 70},
        {item = "water_bottle", amount = 1, chance = 30},
    },
    [2] = {
        {item = "tosti", amount = 2, chance = 70},
        {item = "water_bottle", amount = 2, chance = 30},
    },
}

Config.Camps = {
    -- You can add more Camps
    [1] = {
        name = " ", --the name of a camp will appear at onAnnounce if the notications are ON, you can leave this empty
        lootPos = vector3(60.99, 3717.23, 38.75),
        range = 100.0, -- How much range the player needs to be from the lootpos to spawn the peds
        prop = "ba_prop_battle_crate_closed_bc", --The object that will spawn for loot
        expGiving = 15, -- The amount of EXP that the guy who loots the crate will get
        expRadius = 0, -- Set this to Recommended 5 or 10 if you want to people close to the crate get EXP too, [[0 value will only give to the one opening the crate]]
        itemPickAmount = 1, -- How many items from Config.LevelRewards will be picked according to the player level
        selfDelay = 0, --time in minutes that will take for the zone to be available for the server zone check creation (leave at 0 if you dont want)
        peds = {--You can add more peds for this camp
            {model = "csb_grove_str_dlr", coords = vector4(79.43, 3722.51, 39.75, 100.78), weapon = "weapon_pistol", health = 200, armor = 0, canTakeHeadshot = true},
            {model = "csb_g", coords = vector4(77.4, 3707.73, 40.7, 56.34), weapon = "weapon_assaultrifle", health = 200, armor = 0, canTakeHeadshot = true},
            {model = "csb_ortega", coords = vector4(52.07, 3698.94, 39.76, 326.35), weapon = "weapon_pistol", health = 200, armor = 0, canTakeHeadshot = true},
        }
    },
}

Locales = {
    ["BlipText"] = "Raidable Camp",
    ["interactCrate"] = "Press ~g~E~w~ to loot the crate",
    ["looting"] = "Grabbing the loot",
    ["earnedEXP"] = "You earned ",
    ["exp"] = "EXP",
    ["yourLevel"] = "Your Level: ",
    ["yourEXP"] = "Your EXP: ",
    ["alreadyLooted"] = "Someone already looted this",
    ["onCreate"] = "Some gangsters have taken a location",
    ["onFinished"] = "Location of the gangsters has been contained",
    ["noSpaceInv"] = "Your inventory is full",
    ["pedsAlive"] = "There's someone to kill..."
}

function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 170)
    ClearDrawOrigin()
end