----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

Config = {}

Config.Debug = false -- Enables/disables debug messages

-- Core settings for renamed cores
Config.CoreSettings = {
    Core = 'QBCore', -- The name of your core. Default; QBCore
    CoreFolder = 'qb-core', -- The name of your core folder. Default; qb-core
    TargetName = 'qb-target', -- The name of your third eye targeting. Default; qb-target
    MenuName = 'qb-menu', -- The name of your menu. Default; qb-menu
    MetaDataEvent = 'QBCore:Server:SetMetaData', -- The name of your set metadata event. Default; 'QBCore:Server:SetMetaData'
    RemoveStressEvent = 'hud:server:RelieveStress', -- Event to remove stress from player. Default; 'hud:server:RelieveStress'
    PlayerLoaded = 'QBCore:Client:OnPlayerLoaded' -- Name of player load event
}

-- XP settings
Config.XP = {
    Use = false, -- Toggles xp system on or off; true = on, false = off
    Command = false, -- Toggles xp command on or off; true = on, false = off
    MetaDataName = 'drugxp', -- The name of your xp if you edit this make sure to also edit the line included in readme this is also your /drugxp command
    Levels = { -- Change your xp requirements here to suit your server set these as high as you want preset xp increase = (xp / 0.8)
        1000, -- level 2 
        1250, -- level 3 
        1562, -- level 4
        1953, -- level 5
        2441, -- level 6 
        3051, -- level 7
        3814, -- level 8
        4768, -- level 9
        5960, -- level 10
    }
}

-- Blip settings
Config.Blips = { -- Blips information
    {title = 'Smoke On The Water', colour = 25, id = 496, coords = vector3(-1173.55, -1574.21, 5.38), scale = 0.6, useblip = false}
}

-- Ped settings
Config.Peds = {
    --{name = 'Clyde', coords = vector4(-1169.42, -1573.99, 4.66, 36.20), model = 'u_m_y_hippie_01', scenario = 'WORLD_HUMAN_LEANING', label = 'Speak To Clyde', icon = 'fa-solid fa-shop', event = 'boii-weed:cl:SmokeShopMenu', distance = 1.0}, -- Smoke on the water
}

-- Store settings
Config.Stores = {
    Weed = {
        SmokeShop = {
            UseTimes = false, -- Toggle time locks for smoke store; true = enables smoke store; false = disabled
            StartTime = 10, -- Time you can start smoke store drugs
            EndTime = 18, -- Time to stop smoke store drugs
            UseCashItem = true, -- Toggle cash as item; true = CashItem reward, false = MoneyType reward
            MoneyType = 'cash', -- Money type rewarded for bulk selling; 'cash', 'bank', 'crypto' etc...
            CashItem = 'cash', -- Name of your cash item in your city
            Items = { -- Items available for sale in smoke on the water                 
                [1] = {name = 'empty_weed_bag', price = 2, amount = 1000, info = {}, type = 'item', slot = 1}
            },	
            Drugs = { 
                Bags = { -- Bags are 50% of the street sale minimum prices if you are using BOII-DRUGSALES *(adjust these however you like)*
                    ['weed_skunk'] = 5,
                    ['weed_og-kush'] = 8,
                    ['weed_white-widow'] = 10,
                    ['weed_ak47'] = 13,
                    ['weed_amnesia'] = 15,
                    ['weed_purple-haze'] = 18,
                    ['weed_gelato'] = 25,
                    ['weed_zkittlez'] = 30,
                }
            }
        }
    }
}

-- Plant settings
Config.Plants = {
    Outdoor = {
        UseTarget = true, -- Enables/disables qb-target for plants; true = qb-target enabled, false = in range check enabled
        Growth = {
            Timer = 1, -- Plant update timer in (mins) this directly affects the growth rate of strains defined server side
            Defaults = {
                Hunger = 15, -- Amount of hunger plants will start with by default
                Thirst = 12, -- Amount of thirst plants will start with by default
                Quality = 16 -- Amount of quality plants will start with by default
            }
        },
        Services = {
            Job = { -- Service job list; these jobs will only be able to view dead menu and destroy plants
                {name = 'police'}

                -- You can add as many jobs here as required. Example below;
                -- {name = 'police'},
                -- {name = 'dea'},
                -- {name = 'fib'}
            }
        },
        Props = {
            ['state'] = {
                -- Edit props and prop height here
                s1 = {'bkr_prop_weed_bud_01b', -1.035},
                s2 = {'bkr_prop_weed_med_01a', -4.80},
                s3 = {'bkr_prop_weed_med_01a', -4.55},
                s4 = {'bkr_prop_weed_lrg_01a', -4.40},
                s5 = {'bkr_prop_weed_lrg_01a', -4.25},
                s6 = {'bkr_prop_weed_lrg_01a', -4.18}
            }
        },       
        Actions = {
            Plant = {
                Animations = {
                    Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', -- Animation dict; https://wiki.gtanet.work/index.php?title=Animations
                    Anim = 'weed_spraybottle_crouch_base_inspector', -- Animation; https://wiki.gtanet.work/index.php?title=Animations
                    Flags = 9, -- Animation flags refer to; https://docs.fivem.net/natives/?_0xEA47FE3719165B94
                },
                Time = math.random(1,2), -- Time in (s) to plant seeds
                Range = 1.5, -- Range check for planting to close to another plant
                OnlyOutdoors = true, -- Enables/disables ground type checks; true = enables, false = disabled
                Required = {name = 'trowel', label = 'Trowel'} -- Item required to plant seeds
            },
            Harvest = {
                Animations = {
                    Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', -- Animation dict; https://wiki.gtanet.work/index.php?title=Animations
                    Anim = 'weed_spraybottle_crouch_base_inspector', -- Animation; https://wiki.gtanet.work/index.php?title=Animations
                    Flags = 49, -- Animation flags refer to; https://docs.fivem.net/natives/?_0xEA47FE3719165B94
                },
                Time = math.random(3,8), -- Time in (s) to harvest plants
                Required = {name = 'drug_shears', label = 'Trimming Shears'} -- Item required to harvest plants
            },
            Feed = {
                Animations = {
                    Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', -- Animation dict; https://wiki.gtanet.work/index.php?title=Animations
                    Anim = 'weed_spraybottle_crouch_base_inspector', -- Animation; https://wiki.gtanet.work/index.php?title=Animations
                    Flags = 49, -- Animation flags refer to; https://docs.fivem.net/natives/?_0xEA47FE3719165B94
                },
                Time = math.random(1,3), -- Time in (s) to feed plants
                Increase = math.random(10,20), -- Amount to increase hunger on feeding
                Quality = 0.3, -- Amount of quality to increase on feeding 0.5 = 50% "Increase" amount
                Required = {name = 'weed_fertilizer', label = 'Big Bud Fertilizer'}
            },
            Water = {
                Animations = {
                    Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', -- Animation dict; https://wiki.gtanet.work/index.php?title=Animations
                    Anim = 'weed_spraybottle_crouch_base_inspector', -- Animation; https://wiki.gtanet.work/index.php?title=Animations
                    Flags = 49, -- Animation flags refer to; https://docs.fivem.net/natives/?_0xEA47FE3719165B94
                },
                Time = math.random(1,3), -- Time in (s) to water plants
                Increase = math.random(10,20), -- Amount to increase thirst on watering
                Quality = 0.3, -- Amount of quality to increase on watering 0.5 = 50% "Increase" amount
                Required = {name = 'weed_water', label = 'Distilled Water'}
            },
            Destroy = {
                Animations = {
                    Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', -- Animation dict; https://wiki.gtanet.work/index.php?title=Animations
                    Anim = 'weed_spraybottle_crouch_base_inspector', -- Animation; https://wiki.gtanet.work/index.php?title=Animations
                    Flags = 9, -- Animation flags refer to; https://docs.fivem.net/natives/?_0xEA47FE3719165B94
                },
                Time = math.random(1,3), -- Time in (s) to destroy plants
                AutoDelete = true -- Enables auto deletion of plants when hunger/thirst/quality is below 1
            },
            Trimming = {
                Animations = {
                    Dict = 'amb@prop_human_parking_meter@female@base', -- Animation dict; https://wiki.gtanet.work/index.php?title=Animations
                    Anim = 'base_female', -- Animation; https://wiki.gtanet.work/index.php?title=Animations
                    Flags = 49, -- Animation flags refer to; https://docs.fivem.net/natives/?_0xEA47FE3719165B94
                },
                Time = math.random(7,13), -- Time in (s) to trim crops
                Required = {
                    ['1'] = {name = 'drug_shears', label = 'Trimming Shears'},
                    ['2'] = {name = 'drug_scales', label = 'Scales'},
                    ['3'] = {name = 'empty_weed_bag', label = 'Resealable Bags'}
                }
            },
            Rolling = {
                Animations = {
                    Dict = 'amb@prop_human_parking_meter@female@base', -- Animation dict; https://wiki.gtanet.work/index.php?title=Animations
                    Anim = 'base_female', -- Animation; https://wiki.gtanet.work/index.php?title=Animations
                    Flags = 49, -- Animation flags refer to; https://docs.fivem.net/natives/?_0xEA47FE3719165B94
                },
                Time = math.random(5,8), -- Time in (s) to water plants
                Required = {
                    ['1'] = {name = 'drug_grinder', label = 'Grinder'},
                    ['2'] = {name = 'rollingpapers', label = 'Rolling Paper', amount = 2}
                }
            }, 
            Smoking = {
                Animations = {
                    Dict = 'timetable@gardener@smoking_joint', -- Animation dict; https://wiki.gtanet.work/index.php?title=Animations
                    Anim = 'smoke_idle', -- Animation; https://wiki.gtanet.work/index.php?title=Animations
                    Flags = 49, -- Animation flags refer to; https://docs.fivem.net/natives/?_0xEA47FE3719165B94
                    Prop = 'prop_sh_joint_01', -- Prop; https://forge.plebmasters.de/objects
                    Bone =  57005, -- Bone index refer to; https://wiki.gtanet.work/index.php?title=Bones
                    Coords = vector3(0.12, 0.03, -0.05), -- Prop coordinates
                    Rotation = vector3(0.0, 10.0, 70.0), -- Prop rotation
                },
                Time = math.random(5,10), -- Time in (s) to smoke joints
                Effects = true, -- Enables or disable screen effects; true = enables, false = disabled
                Required = {name = 'lighter', label = 'Lighter'}
            }
        }
    }
}
