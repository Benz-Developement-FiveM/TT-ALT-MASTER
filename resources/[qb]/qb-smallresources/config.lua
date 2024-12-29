Config = {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)
Config.PauseMapText = 'TRANSPORT SIMULATOR 2025'                                     -- Text shown above the map when ESC is pressed. If left empty 'FiveM' will appear
Config.HarnessUses = 20
Config.DamageNeeded = 100.0                                  -- amount of damage till you can push your vehicle. 0-1000
Config.Logging = 'discord'                                   -- fivemanage

Config.AFK = {
    ignoredGroups = {
        ['mod'] = true,
        ['admin'] = true,
        ['god'] = true
    },
    secondsUntilKick = 1000000, -- AFK Kick Time Limit (in seconds)
    kickInCharMenu = false      -- Set to true if you want to kick players for being AFK even when they are in the character menu.
}

Config.HandsUp = {
    command = 'hu',
    keybind = 'X',
    controls = { 24, 25, 47, 58, 59, 63, 64, 71, 72, 75, 140, 141, 142, 143, 257, 263, 264 }
}

Config.Binoculars = {
    zoomSpeed = 10.0,        -- camera zoom speed
    storeBinocularsKey = 177 -- backspace by default
}

Config.AIResponse = {
    wantedLevels = true, -- if true, you will recieve wanted levels
    dispatchServices = {  -- AI dispatch services
        [1] = true,      -- Police Vehicles
        [2] = true,      -- Police Helicopters
        [3] = true,      -- Fire Department Vehicles
        [4] = false,      -- Swat Vehicles
        [5] = true,      -- Ambulance Vehicles
        [6] = true,      -- Police Motorcycles
        [7] = false,      -- Police Backup
        [8] = false,      -- Police Roadblocks
        [9] = false,      -- PoliceAutomobileWaitPulledOver
        [10] = false,     -- PoliceAutomobileWaitCruising
        [11] = false,     -- Gang Members
        [12] = false,     -- Swat Helicopters
        [13] = false,     -- Police Boats
        [14] = false,     -- Army Vehicles
        [15] = false      -- Biker Backup
    }
}

-- To Set This Up visit https://forum.cfx.re/t/how-to-updated-discord-rich-presence-custom-image/157686
Config.Discord = {
    isEnabled = true,                                     -- If set to true, then discord rich presence will be enabled
    applicationId = '1318691385917964352',                   -- The discord application id
    iconLarge = 'logo_name',                               -- The name of the large icon
    iconLargeHoverText = 'Transport Simulator 2025', -- The hover text of the large icon
    iconSmall = 'small_logo_name',                         -- The name of the small icon
    iconSmallHoverText = 'TS25', -- The hover text of the small icon
    updateRate = 30000,                                    -- How often the player count should be updated
    showPlayerCount = true,                                -- If set to true the player count will be displayed in the rich presence
    maxPlayers = 32,                                       -- Maximum amount of players
    buttons = {
        {
            text = 'TS25 Discord',
            url = 'https://discord.gg/jaah866Vj3'
        }
    }
}

Config.Density = {
    parked = 0.8,
    vehicle = 0.8,
    multiplier = 0.8,
    peds = 0.8,
    scenario = 0.1
}

Config.Disable = {
    hudComponents = { 1, 2, 3, 4, 7, 9, 13, 14, 19, 20, 21, 22 }, -- Hud Components: https://docs.fivem.net/natives/?_0x6806C51AD12B83B8
    controls = { 37 },                                            -- Controls: https://docs.fivem.net/docs/game-references/controls/
    displayAmmo = false,                                           -- false disables ammo display
    ambience = false,                                             -- disables distance sirens, distance car alarms, flight music, etc
    idleCamera = false,                                            -- disables the idle cinematic camera
    vestDrawable = false,                                         -- disables the vest equipped when using heavy armor
    pistolWhipping = false,                                        -- disables pistol whipping
    driveby = false,                                              -- disables driveby
}

Config.RelieveWeedStress = math.random(15, 20) -- stress relief amount (100 max)

Config.Consumables = {
    eat = {
        ['tosti'] = math.random(25, 35),
        ['sandwich'] = math.random(25, 35),
        ['grape'] = math.random(25, 35),
        ['uwu_misosoup'] = math.random(25, 35),
        ['cranberry'] = math.random(25, 35),
        ['shotnuggets'] = math.random(25, 35),
        ['shotrings'] = math.random(25, 35),
        ['heartstopper'] = math.random(25, 35),
        ['shotfries'] = math.random(25, 35),
        ['moneyshot'] = math.random(25, 35),
        ['meatfree'] = math.random(25, 35),
        ['bleeder'] = math.random(25, 35),
        ['torpedo'] = math.random(25, 35),
        ['rimjob'] = math.random(25, 35),
        ['creampie'] = math.random(25, 35),
        ['cheesewrap'] = math.random(25, 35),
        ['chickenwrap'] = math.random(25, 35),
        ['uwupancake'] = math.random(25, 35),
        ['uwucupcake'] = math.random(25, 35),
        ['uwuvanillasandy'] = math.random(25, 35),
        ['uwuchocsandy'] = math.random(25, 35),
        ['uwubudhabowl'] = math.random(25, 35),
        ['uwusushi'] = math.random(25, 35),
        ['uwumisosoup'] = math.random(25, 35),
        ['uwubentobox'] = math.random(25, 35),
        ['cheese_burger_fries'] = math.random(25, 35),
        ['chicken_caesar_wrap'] = math.random(25, 35),
        ['greek_veggie_wrap'] = math.random(25, 35),
        ['spicy_chicken_wrap'] = math.random(25, 35),
        ['chicken_stips'] = math.random(25, 35),
        ['french_toast_bacon'] = math.random(25, 35),
        ['grilled_cheese_fries'] = math.random(25, 35),
        ['pbj'] = math.random(25, 35),
        ['scrambled_egg'] = math.random(25, 35),
        ['sirloin_burger'] = math.random(25, 35),
        ['steakncheese'] = math.random(25, 35),
        ['bacon_cheese_fries'] = math.random(25, 35),
        ['hot_wings'] = math.random(25, 35),
        ['eggs'] = math.random(25, 35),
        ['jam'] = math.random(25, 35),
        ['peanut_butter'] = math.random(25, 35),
        ['bread'] = math.random(25, 35),
        ['fries'] = math.random(25, 35),
        ['veggie'] = math.random(25, 35),
        ['sirloin_steak'] = math.random(25, 35),
        ['steak'] = math.random(25, 35),
        ['salad'] = math.random(25, 35),
        ['wraps'] = math.random(25, 35),
        ['wrap'] = math.random(25, 35),
        ['brownie1'] = math.random(25, 35),
        ['brownie2'] = math.random(25, 35),
        ['brownie3'] = math.random(25, 35),
        ['brownie4'] = math.random(25, 35),
        ['brownie5'] = math.random(25, 35),
        ['brownie6'] = math.random(25, 35),
        ['brownie7'] = math.random(25, 35),
        ['bacon_eggs'] = math.random(25, 35),
        ['blueberries'] = math.random(25, 35),
        ['blueberry_pie'] = math.random(25, 35),
        ['boiled_meat'] = math.random(25, 35),
        ['burned_meat'] = math.random(25, 35),
        ['canned_chicken_soup'] = math.random(25, 35),
        ['canned_country_soup'] = math.random(25, 35),
        ['canned_pears'] = math.random(25, 35),
        ['canned_peas'] = math.random(25, 35),
        ['canned_salmon'] = math.random(25, 35),
        ['canned_tuna'] = math.random(25, 35),
        ['chilli_bowl'] = math.random(25, 35),
        ['chilli_dog'] = math.random(25, 35),
        ['corn_bread'] = math.random(25, 35),
        ['corn_on_hob'] = math.random(25, 35),
        ['egg_boiled'] = math.random(25, 35),
        ['fish_taco'] = math.random(25, 35),
        ['grilled_meat'] = math.random(25, 35),
        ['gumbo_stew'] = math.random(25, 35),
        ['meat_stew'] = math.random(25, 35),
        ['meow_chow'] = math.random(25, 35),
        ['mushroom'] = math.random(25, 35),
        ['potato'] = math.random(25, 35),
        ['pumpkin_bread'] = math.random(25, 35),
        ['pumpkin_cheesecake'] = math.random(25, 35),
        ['pumpkinpie_slice'] = math.random(25, 35),
        ['ration_beef'] = math.random(25, 35),
        ['ration_chicken'] = math.random(25, 35),
        ['ration_lamb'] = math.random(25, 35),
        ['ravioli'] = math.random(25, 35),
        ['sham'] = math.random(25, 35),
        ['sham_chowder'] = math.random(25, 35),
        ['sham_sandwich'] = math.random(25, 35),
        ['shephards_pie'] = math.random(25, 35),
        ['soup_miso'] = math.random(25, 35),
        ['spaghetti'] = math.random(25, 35),
        ['stash_chilli'] = math.random(25, 35),
        ['steak_potato'] = math.random(25, 35),
        ['stew_vegetable'] = math.random(25, 35),
        ['tuna_toast'] = math.random(25, 35),
        ['yucca_fruit'] = math.random(25, 35),
        ['pumpkin'] = math.random(25, 35),
        ['tapiokaballs'] = math.random(25, 35),
        ['tofu'] = math.random(25, 35),
        ['th_beef_burrito'] = math.random(15, 25),
        ['th_beef_enchilada'] = math.random(15, 25),
        ['th_beef_taco'] = math.random(15, 25),
        ['th_chicken_burrito'] = math.random(15, 25),
        ['th_chicken_caesar_wrap'] = math.random(15, 25),
        ['th_chicken_taco'] = math.random(15, 25),
        ['th_greek_veggie_wrap'] = math.random(15, 25),
        ['th_nachos'] = math.random(15, 25),
        ['th_quesadilla'] = math.random(15, 25),
        ['th_tortilla_chips'] = math.random(15, 25),
        ['th_oranges'] = math.random(15, 25),
        ['orange'] = math.random(5, 10),
        ['pineapple'] = math.random(5, 10),
        ['tomato'] = math.random(5, 10),
        ['strawberry'] = math.random(5, 10),
        ['casino_burger'] = math.random(15, 25),
        ['casino_chips'] = math.random(15, 25),
        ['casino_donut'] = math.random(15, 25),
        ['casino_sandwitch'] = math.random(15, 25),
    
    
        ['twerks_candy'] = math.random(10, 15),
        ['snikkel_candy'] = math.random(10, 15),
        ['ccookie'] = math.random(10, 15),
        ['eye_kandy'] = math.random(10, 15),
        ['health_bar'] = math.random(10, 15),
        ['hackers'] = math.random(10, 15),
        ['honey'] = math.random(10, 15),
        ['jail_breakers'] = math.random(10, 15),
        ['natures_call'] = math.random(10, 15),
        ['nerd_tats'] = math.random(10, 15),
        ['oh_shitz_drops'] = math.random(10, 15),
        ['skull_crushers'] = math.random(10, 15),
        ['sugar_butts'] = math.random(10, 15),
        ['casino_ego_chaser'] = math.random(10, 15),
        ['casino_psqs'] = math.random(10, 15),
        },
    drink = {
        ['water_bottle'] = math.random(15, 25),
        ['coffee'] = math.random(15, 25),
        ['kurkakola'] = math.random(15, 25),
        ['grapejuice'] = math.random(15, 25),
        ['uwu_bubbleteablueberry'] = math.random(15, 25),
        ['uwu_bubbletearose'] = math.random(15, 25),
        ['uwu_bubbleteamint'] = math.random(15, 25),
        ['uwu_matchatea'] = math.random(15, 25),
        ['bs-milkshake'] = math.random(15, 25),
        ['water'] = math.random(15, 25),
        ['watercup'] = math.random(15, 25),
        ['blueberry-pom'] = math.random(15, 25),
        ['tropical-guava'] = math.random(15, 25),
        ['tropical-punch'] = math.random(15, 25),
        ['sour-bubble'] = math.random(15, 25),
        ['hemp-prickly'] = math.random(15, 25),
        ['original'] = math.random(15, 25),
        ['watermelon-punch'] = math.random(15, 25),
        ['el-mango'] = math.random(15, 25),
        ['barr-bubblegum'] = math.random(15, 25),
        ['barr-shandy'] = math.random(15, 25),
        ['icream-soda'] = math.random(15, 25),
        ['irn-bru'] = math.random(15, 25),
        ['jar_coffee'] = math.random(15, 25),
        ['jar_goldroot_tea'] = math.random(15, 25),
        ['jar_redtea'] = math.random(15, 25),
        ['jar_river_water'] = math.random(15, 25),
        ['jar_yukkajuice'] = math.random(15, 25),
        ['mega_crush'] = math.random(15, 25),
        ['yukka_glass'] = math.random(15, 25),
        ['atom_junkie'] = math.random(15, 25),
        ['tea'] = math.random(15, 25),
        ['th_ecola'] = math.random(15, 25),
        ['th_sprunk'] = math.random(15, 25),
        ['th_orangotang'] = math.random(15, 25),
        ['th_carbonated_water'] = math.random(15, 25),
        ['casino_coffee'] = math.random(15, 25),
        ['casino_coke'] = math.random(15, 25),
        ['casino_luckypotion'] = math.random(15, 25),
        ['casino_sprite'] = math.random(15, 25),
        },
    alcohol = {
        ['beer'] = math.random(15, 25),
        ['whiskey'] = math.random(15, 25),
        ['vodka'] = math.random(15, 25),
        ['wine'] = math.random(15, 25),
        ['amaretto'] = math.random(15, 25),
        ['amarone'] = math.random(15, 25),
        ['ambeer'] = math.random(15, 25),
        ['b52'] = math.random(15, 25),
        ['barbera'] = math.random(15, 25),
        ['bkamikaze'] = math.random(15, 25),
        ['blue_white_bottle'] = math.random(15, 25),
        ['brussian'] = math.random(15, 25),
        ['cappucc'] = math.random(15, 25),
        ['grandpa_gin'] = math.random(15, 25),
        ['grandpa_moonshine'] = math.random(15, 25),
        ['grandpa_whiskey'] = math.random(15, 25),
        ['jar_beer'] = math.random(15, 25),
        ['casino_beer'] = math.random(15, 25),
        },
    custom = { -- put any custom items here
        -- ['newitem'] = {
        --     progress = {
        --         label = 'Using Item...',
        --         time = 5000
        --     },
        --     animation = {
        --         animDict = 'amb@prop_human_bbq@male@base',
        --         anim = 'base',
        --         flags = 8,
        --     },
        --     prop = {
        --         model = false,
        --         bone = false,
        --         coords = false, -- vector 3 format
        --         rotation = false, -- vector 3 format
        --     },
        --     replenish = {'''
        --         type = 'Hunger', -- replenish type 'Hunger'/'Thirst' / false
        --         replenish = math.random(20, 40),
        --         isAlcohol = false, -- if you want it to add alcohol count
        --         event = false, -- 'eventname' if you want it to trigger an outside event on use useful for drugs
        --         server = false -- if the event above is a server event
        --     }
        -- }
    }
}

Config.Fireworks = {
    delay = 5, -- time in s till it goes off
    items = {  -- firework items
        'firework1',
        'firework2',
        'firework3',
        'firework4'
    }
}

Config.BlacklistedScenarios = {
    types = {
        'WORLD_VEHICLE_MILITARY_PLANES_SMALL',
        'WORLD_VEHICLE_MILITARY_PLANES_BIG',
        'WORLD_VEHICLE_AMBULANCE',
        'WORLD_VEHICLE_POLICE_NEXT_TO_CAR',
        'WORLD_VEHICLE_POLICE_CAR',
        'WORLD_VEHICLE_POLICE_BIKE'
    },
    groups = {
        2017590552,
        2141866469,
        1409640232,
        `ng_planes`
    }
}

Config.BlacklistedVehs = {
    [`shamal`] = false,
    [`luxor`] = false,
    [`luxor2`] = true,
    [`jet`] = false,
    [`lazer`] = true,
    [`buzzard`] = true,
    [`buzzard2`] = true,
    [`annihilator`] = true,
    [`savage`] = true,
    [`titan`] = true,
    [`rhino`] = true,
    [`firetruck`] = true,
    [`mule`] = false,
    [`maverick`] = false,
    [`blimp`] = true,
    [`airtug`] = true,
    [`camper`] = false,
    [`hydra`] = true,
    [`oppressor`] = true,
    [`technical3`] = true,
    [`insurgent3`] = true,
    [`apc`] = true,
    [`tampa3`] = true,
    [`trailersmall2`] = true,
    [`halftrack`] = true,
    [`hunter`] = true,
    [`vigilante`] = true,
    [`akula`] = true,
    [`barrage`] = true,
    [`khanjali`] = true,
    [`caracara`] = true,
    [`blimp3`] = true,
    [`menacer`] = true,
    [`oppressor2`] = true,
    [`scramjet`] = true,
    [`strikeforce`] = true,
    [`cerberus`] = true,
    [`cerberus2`] = true,
    [`cerberus3`] = true,
    [`scarab`] = true,
    [`scarab2`] = true,
    [`scarab3`] = true,
    [`rrocket`] = true,
    [`ruiner2`] = true,
    [`deluxo`] = true,
    [`cargoplane2`] = true,
    [`voltic2`] = true
}

Config.BlacklistedWeapons = {
    [`WEAPON_RAILGUN`] = true,
}

Config.BlacklistedPeds = {
    [`s_m_y_ranger_01`] = true,
    [`s_m_y_sheriff_01`] = true,
    [`s_m_y_cop_01`] = true,
    [`s_f_y_sheriff_01`] = true,
    [`s_f_y_cop_01`] = true,
    [`s_m_y_hwaycop_01`] = true
}

Config.Objects = { -- for object removal
    { coords = vector3(266.09, -349.35, 44.74), heading = 0, length = 200, width = 200, model = 'prop_sec_barier_02b' },
    { coords = vector3(285.28, -355.78, 45.13), heading = 0, length = 200, width = 200, model = 'prop_sec_barier_02a' },
}

-- You may add more than 2 selections and it will bring up a menu for the player to select which floor be sure to label each section though
Config.Teleports = {
--[[    [1] = {                   -- Elevator @ labs
        [1] = {               -- up
            poly = { coords = vector3(3540.74, 3675.59, 20.99), heading = 167.5, length = 2, width = 2 },
            allowVeh = false, -- whether or not to allow use in vehicle
            label = false     -- set this to a string for a custom label or leave it false to keep the default. if more than 2 options, label all options

        },
        [2] = { -- down
            poly = { coords = vector3(3540.74, 3675.59, 28.11), heading = 172.5, length = 2, width = 2 },
            allowVeh = false,
            label = false
        }
    },
    [2] = { --Coke Processing Enter/Exit
        [1] = {
            poly = { coords = vector3(909.49, -1589.22, 30.51), heading = 92.24, length = 2, width = 2 },
            allowVeh = false,
            label = '[E] Enter Coke Processing'
        },
        [2] = {
            poly = { coords = vector3(1088.81, -3187.57, -38.99), heading = 181.7, length = 2, width = 2 },
            allowVeh = false,
            label = '[E] Leave'
        }
    }]]--
}

Config.CarWash = {
    dirtLevel = 0.1,                                                                                   -- threshold for the dirt level to be counted as dirty
    defaultPrice = 50,                                                                                 -- default price for the carwash
    locations = {
        [1] = { coords = vector3(174.81, -1736.77, 28.87), length = 7.0, width = 8.8, heading = 359 }, -- South Los Santos Carson Avenue
        [2] = { coords = vector3(25.2, -1391.98, 28.91), length = 6.6, width = 8.2, heading = 0 },     -- South Los Santos Innocence Boulevard
        [3] = { coords = vector3(-74.27, 6427.72, 31.02), length = 9.4, width = 8, heading = 315 },    -- Paleto Bay Boulevard
        [4] = { coords = vector3(1362.69, 3591.81, 34.5), length = 6.4, width = 8, heading = 21 },     -- Sandy Shores
        [5] = { coords = vector3(-699.84, -932.68, 18.59), length = 11.8, width = 5.2, heading = 0 }   -- Little Seoul Gas Station
    }
}