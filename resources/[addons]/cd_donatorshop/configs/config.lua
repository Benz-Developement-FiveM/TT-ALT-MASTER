Config = {}
function L(cd) if Locales[Config.Language][cd] then return Locales[Config.Language][cd] else print('Locale is nil ('..cd..')') end end
--███████╗██████╗  █████╗ ███╗   ███╗███████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
--██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
--█████╗  ██████╔╝███████║██╔████╔██║█████╗  ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ 
--██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║   ██║██╔══██╗██╔═██╗ 
--██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
--╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝


Config.Database = 'oxmysql' --[ 'mysql' / 'ghmattimysql' / 'oxmysql' ] Choose your sql database script.
Config.Framework = 'qbcore' ---[ 'esx' / 'qbcore' / 'other' ] Choose your framework.
Config.Language = 'EN' --[ 'EN' / 'CZ' / 'ES' / 'FI' / 'FR' / 'NL' / 'SE' / 'SK' ] You can add your own locales to the Locales.lua. But make sure to change the Config.Language to match it.

Config.FrameworkTriggers = { --You can change the esx/qbcore events (IF NEEDED).
    main = 'QBCore:GetObject',   --ESX = 'esx:getSharedObject'   QBCORE = 'QBCore:GetObject'
    load = 'QBCore:Client:OnPlayerLoaded',      --ESX = 'esx:playerLoaded'      QBCORE = 'QBCore:Client:OnPlayerLoaded'
    job = 'QBCore:Client:OnJobUpdate',             --ESX = 'esx:setJob'            QBCORE = 'QBCore:Client:OnJobUpdate'
	resource_name = 'qb-core'   --ESX = 'es_extended'           QBCORE = 'qb-core'
}

Config.NotificationType = { --[ 'esx' / 'qbcore' / 'mythic_old' / 'mythic_new' / 'chat' / 'other' ] Choose your notification script.
    server = 'qbcore',
    client = 'qbcore' 
}


--██╗███╗   ███╗██████╗  ██████╗ ██████╗ ████████╗ █████╗ ███╗   ██╗████████╗
--██║████╗ ████║██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔══██╗████╗  ██║╚══██╔══╝
--██║██╔████╔██║██████╔╝██║   ██║██████╔╝   ██║   ███████║██╔██╗ ██║   ██║   
--██║██║╚██╔╝██║██╔═══╝ ██║   ██║██╔══██╗   ██║   ██╔══██║██║╚██╗██║   ██║   
--██║██║ ╚═╝ ██║██║     ╚██████╔╝██║  ██║   ██║   ██║  ██║██║ ╚████║   ██║   
--╚═╝╚═╝     ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝


Config.IdentifierType = 'license' --[ 'steam' / 'license' ] Choose the identifier type that your server uses.
Config.VehicleDatabasePlateType = 'without_spaces' --[ 'with_spaces' / 'without_spaces'] CHOOSE CAREFULLY! Look at your vehicles database table, do your vehicle plates get saved WITH or WITHOUT spaces?
Config.DebugPrints = false --To enable debug prints.


--███╗   ███╗ █████╗ ██╗███╗   ██╗
--████╗ ████║██╔══██╗██║████╗  ██║
--██╔████╔██║███████║██║██╔██╗ ██║
--██║╚██╔╝██║██╔══██║██║██║╚██╗██║
--██║ ╚═╝ ██║██║  ██║██║██║ ╚████║
--╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝


Config.PurchaseCommand = 'tebex_purchase' --DONT CHANGE IF YOU DON'T KNOW WHAT YOU ARE DOING. This is the command for the tebex transactions.
Config.BlacklistedWords = {'changeme', 'changeme'} --(MUST BE LOWER CASE!) If a word from a plate change/character name change contains a blacklisted word the transaction will be canceled.
Config.cd_multicharacter_maxslots = 5 --If you are using the using the Codesign Multicharacter script, what is the maximum amount of character slots you will allow donators to have?


-- ██████╗██╗  ██╗ █████╗ ████████╗     ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗
--██╔════╝██║  ██║██╔══██╗╚══██╔══╝    ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝
--██║     ███████║███████║   ██║       ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║███████╗
--██║     ██╔══██║██╔══██║   ██║       ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║╚════██║
--╚██████╗██║  ██║██║  ██║   ██║       ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████║
-- ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝        ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝


Config.RedeemCommand = 'redeem' --The command players who have purchased items on tebex can use to redeem their purchase in game.
Config.StaffCommands = {
    Add_Balance = 'add_balance', --The staff command to manually add coins to a players balance in the database.
    Remove_Balance = 'remove_balance', --The staff command to manually remove coins from a players balance in the database.

    Perms = { --You decide which permission groups can use the staff commands to add/remove coins ^.
    --    ['esx'] = {'superadmin', 'admin'},
        ['qbcore'] = {'god', 'admin'},
    --    ['other'] = {'change_me', 'change_me'}
    }
}


--████████╗███████╗██████╗ ███████╗██╗  ██╗    ██╗    ██╗███████╗██████╗ ███████╗██╗████████╗███████╗    ██████╗ ██████╗  ██████╗ ██████╗ ██╗   ██╗ ██████╗████████╗███████╗
--╚══██╔══╝██╔════╝██╔══██╗██╔════╝╚██╗██╔╝    ██║    ██║██╔════╝██╔══██╗██╔════╝██║╚══██╔══╝██╔════╝    ██╔══██╗██╔══██╗██╔═══██╗██╔══██╗██║   ██║██╔════╝╚══██╔══╝██╔════╝
--   ██║   █████╗  ██████╔╝█████╗   ╚███╔╝     ██║ █╗ ██║█████╗  ██████╔╝███████╗██║   ██║   █████╗      ██████╔╝██████╔╝██║   ██║██║  ██║██║   ██║██║        ██║   ███████╗
--   ██║   ██╔══╝  ██╔══██╗██╔══╝   ██╔██╗     ██║███╗██║██╔══╝  ██╔══██╗╚════██║██║   ██║   ██╔══╝      ██╔═══╝ ██╔══██╗██║   ██║██║  ██║██║   ██║██║        ██║   ╚════██║
--   ██║   ███████╗██████╔╝███████╗██╔╝ ██╗    ╚███╔███╔╝███████╗██████╔╝███████║██║   ██║   ███████╗    ██║     ██║  ██║╚██████╔╝██████╔╝╚██████╔╝╚██████╗   ██║   ███████║
--   ╚═╝   ╚══════╝╚═════╝ ╚══════╝╚═╝  ╚═╝     ╚══╝╚══╝ ╚══════╝╚═════╝ ╚══════╝╚═╝   ╚═╝   ╚══════╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝  ╚═════╝   ╚═╝   ╚══════╝


Config.TebexListings = { --These are the products that you will list for sale on your tebex website.
    [1] = {
        ProductName = 'Bronze Package', --You can change this, but this ProductName must be identical to the name of the product on your tebex website.
        Amount = 10, --This is the amount of coins the player will recieve when he purchases this product (you can change this).
    },

    [2] = {
        ProductName = 'Silver Package',
        Amount = 20,
    },

    [3] = {
        ProductName = 'Gold Package',
        Amount = 30,
    },

    [4] = {
        ProductName = 'Platinum Package',
        Amount = 40,
    },

    [5] = {
        ProductName = 'Diamond Package',
        Amount = 50,
    },
}


--███╗   ███╗ █████╗ ██╗███╗   ██╗    ██╗      ██████╗  ██████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
--████╗ ████║██╔══██╗██║████╗  ██║    ██║     ██╔═══██╗██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
--██╔████╔██║███████║██║██╔██╗ ██║    ██║     ██║   ██║██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
--██║╚██╔╝██║██╔══██║██║██║╚██╗██║    ██║     ██║   ██║██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
--██║ ╚═╝ ██║██║  ██║██║██║ ╚████║    ███████╗╚██████╔╝╚██████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
--╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝    ╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝


Config.Locations = {
    [1] = {x = -1394.81, y = -3265.03, z = 13.93, h = 339.85,   Distance = 10.0, EventName = 'cd_donatorshop:Enter', Text = L('enter')},--The entrance to the donator shop.
    [2] = {x = -1266.89, y = -2965.47, z = -48.48, h = 179.08,  Distance = 10.0, EventName = 'cd_donatorshop:Exit', Text = L('exit')},--The exit to the donator shop.
    [3] = {x = -1246.55, y = -2984.19, z = -48.49, h = 0.0,     Distance = 10.0, EventName = 'cd_donatorshop:Menu', Text = L('menu')},--The donator shop main shop UI.
}


--██╗   ██╗███████╗██╗  ██╗██╗ ██████╗██╗     ███████╗███████╗
--██║   ██║██╔════╝██║  ██║██║██╔════╝██║     ██╔════╝██╔════╝
--██║   ██║█████╗  ███████║██║██║     ██║     █████╗  ███████╗
--╚██╗ ██╔╝██╔══╝  ██╔══██║██║██║     ██║     ██╔══╝  ╚════██║
-- ╚████╔╝ ███████╗██║  ██║██║╚██████╗███████╗███████╗███████║
--  ╚═══╝  ╚══════╝╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝╚══════╝╚══════╝


Config.ManuallyPlaceVehicles = false --Do you want to manually enter the coords for each vehicles location? (If disabled the script will automatically choose the location of each vehicle, circled around the Config.AutomaticStartCoords below).
Config.AutomaticStartCoords = vector4(-1266.83, -3013.54, -48.49, 180.0) --(THIS WILL ONLY BE USED IF Config.ManuallyPlaceVehicles ABOVE^^ IS DISABLED). You can change the coords for where the vehicles will spawn. This is the centre, the vehicles will spawn around these coords.

Config.VehiclePurchaseCoords = vector4(-1394.81, -3265.03, 13.93, 339.85) --This is the location where your vehicle will spawn after you make a purchase.

Config.VehicleTest = {
    ENABLE = true, --Do you want players to be able to test drive vehicles?
    check_balance = true, --Do you want to allow only players who can afford to purchase a vehicle to test drive?
    spawn_max = false, --Do you want the vehicles to spawn with max performance upgrades?
    timer = 30 --(in seconds) How long does the player have to test drive the vehicle?
}

Config.Vehicles = {
    --Cost = The amount of donator coins the vehicle will cost.
    --Model = The spawn name of a vehicle.
    --Description = The description displayed on the vehicle UI.
    --Coords = (THIS WILL ONLY BE USED IF Config.ManuallyPlaceVehicles ABOVE^^ IS ENABLED). You can manually set the location of each vehicle.
    [1] = {Cost = 15, Model = '2NCSRCM4COMP', Name = 'M4', Description = 'Im a M4. Vroom. Vroom.', Coords = vector4(0, 0, 0, 0)},
    --[2] = {Cost = 20, Model = 'carbonizzare', Name = 'Carbonizzare', Description = 'Im so tiny', Coords = vector4(0, 0, 0, 0)},
    --[3] = {Cost = 20, Model = 'sultan', Name = 'Sultan', Description = 'Getaway driverrr', Coords = vector4(0, 0, 0, 0)},
    --[4] = {Cost = 20, Model = 'vagner', Name = 'Vagner', Description = 'Im a ballerrr', Coords = vector4(0, 0, 0, 0)},
    --[5] = {Cost = 20, Model = 'sanchez', Name = 'Sanchez', Description = '2 wheels > 4', Coords = vector4(0, 0, 0, 0)},
    --[6] = {Cost = 20, Model = 'alpha', Name = 'Alpha', Description = 'Im a long boi', Coords = vector4(0, 0, 0, 0)},
    --[7] = {Cost = 20, Model = 'cyclone', Name = 'Cyclone', Description = 'TRUMP 4 PRESIDENT', Coords = vector4(0, 0, 0, 0)},
    --[8] = {Cost = 20, Model = 'bf400', Name = 'BF 400', Description = 'Im a bikerr', Coords = vector4(0, 0, 0, 0)},
    --[9] = {Cost = 20, Model = 'tezeract', Name = 'Tezeract', Description = 'Elon 2 the MOON', Coords = vector4(0, 0, 0, 0)},
    --[10] = {Cost = 20, Model = 'taipan', Name = 'Taipan', Description = 'oh yeye oh yeye', Coords = vector4(0, 0, 0, 0)},
    --[11] = {Cost = 20, Model = 'ADD_MORE_CARS_HERE', Description = 'CHANGE_ME', Coords = vector4(0, 0, 0, 0)},
}


--██╗███╗   ██╗     ██████╗  █████╗ ███╗   ███╗███████╗    ██████╗ ██████╗  ██████╗ ██████╗ ██╗   ██╗ ██████╗████████╗    ███╗   ███╗███████╗███╗   ██╗██╗   ██╗
--██║████╗  ██║    ██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██╔══██╗██╔══██╗██╔═══██╗██╔══██╗██║   ██║██╔════╝╚══██╔══╝    ████╗ ████║██╔════╝████╗  ██║██║   ██║
--██║██╔██╗ ██║    ██║  ███╗███████║██╔████╔██║█████╗      ██████╔╝██████╔╝██║   ██║██║  ██║██║   ██║██║        ██║       ██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║
--██║██║╚██╗██║    ██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██╔═══╝ ██╔══██╗██║   ██║██║  ██║██║   ██║██║        ██║       ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║
--██║██║ ╚████║    ╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ██║     ██║  ██║╚██████╔╝██████╔╝╚██████╔╝╚██████╗   ██║       ██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝
--╚═╝╚═╝  ╚═══╝     ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝  ╚═════╝   ╚═╝       ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝ 


Config.Prop = { --The prop to mark the location where players can access the main shop UI.
    Model = 'xm_prop_base_staff_desk_01',
    Coords = vector4(-1242.32, -2988.77, -49.49, 180.0),
}

Config.Shop = {
    [1] = {
        Title = 'Plate Change',
        Description = 'Buy a custom plate',
        Input_Type = 'text',
        Input_Description = 'Enter a plate between 1-8 characters',
        Pattern = '[^a-zA-Z0-9]',
        MaxLength = 8,
        Image = 'plate_change.png',
        Cost = 10,
        RewardType = 'plate_change',
        Quantity = nil,
        ItemName = nil,
    },

    [2] = {
        Title = 'Money',
        Description = 'A briefcase with $10,000 cash inside',
        Input_Type = 'number',
        Input_Description = '1 = $50000',
        MaxLength = nil,
        Pattern = nil,
        Image = 'money.png',
        Cost = 10,
        RewardType = 'money',
        Quantity = 50000,
        ItemName = nil,
    },

    [3] = {
        Title = 'Character Name',
        Description = 'Change your character name',
        Input_Type = 'text',
        Input_Description = 'eg., John Smith',
        MaxLength = nil,
        Pattern = '[^a-zA-Z\\s]',
        Image = 'character_name.png',
        Cost = 10,
        RewardType = 'character_name',
        Quantity = nil,
        ItemName = nil,
    },

    [4] = {
        Title = 'Vehicle Pack',
        Description = 'Contains x1 adder, x1 golf cart and x1 jetski',
        Input_Type = 'number',
        Input_Description = '1 = x1 FULL car pack',
        MaxLength = 1,
        Pattern = '[^0-9\\-]',
        Image = 'vehicle_pack.png',
        Cost = 50,
        RewardType = 'vehicle_pack',
        Quantity = nil,
        ItemName = {'adder', 'seashark', 'dune'},
    },

}


--[[
VEHICLE PLATE CHANGE EXAMPLE.

    [1] = {
        Title = 'Plate Change',                                             -- Title - THIS MUST BE UNIQUE.
        Description = 'Buy a custom plate',                                 -- Description.
        Input_Type = 'text',                                                -- [ 'text' / 'number' ] DONT change if you dont know what you are doing - https://www.w3schools.com/html/html_form_input_types.asp.
        Input_Description = '8 characters long (including whitespaces)',    -- The help text inside the input box.
        Pattern = '[^a-zA-Z0-9]',                                           -- '[^a-zA-Z0-9]' = Allows both text and numbers with no spaces. / '[^0-9\\-]' = Allows numbers only. / '[^a-zA-Z\\s]' = Allows text with spaces.
        MaxLength = 8,                                                      -- The max amount of characters allowed.
        Image = 'license-plate.png',                                        -- The display image. (must be a .png and 512 x 512 size) 
        Cost = 10,                                                          -- The cost to purchase 1 of these.
        RewardType = 'plate_change',                                        -- DONT change this.
        Quantity = nil,                                                     -- DONT change this.
        ItemName = nil,                                                     -- DONT change this.
    },


PHONE NUMBER CHANGE EXAMPLE.

    [2] = {
        Title = 'Phone Number',                                             -- Title - THIS MUST BE UNIQUE.
        Description = 'Buy a custom phone number',                          -- Description.
        Input_Type = 'text',                                                -- [ 'text' / 'number' ] DONT change if you dont know what you are doing - https://www.w3schools.com/html/html_form_input_types.asp.
        Input_Description = 'Enter a number between 1-8 characters',        -- The help text inside the input box.
        MaxLength = 8,                                                      -- The max amount of characters allowed.
        Pattern = '[^0-9\\-]',                                              -- '[^a-zA-Z0-9]' = Allows both text and numbers with no spaces. / '[^0-9\\-]' = Allows numbers only. / '[^a-zA-Z\\s]' = Allows text with spaces.
        Image = 'phone_change.png',                                         -- The display image. (must be a .png and 512 x 512 size) 
        Cost = 15,                                                          -- The cost to purchase 1 of these.
        RewardType = 'phone_number',                                        -- DONT change this.
        Quantity = nil,                                                     -- DONT change this.
        ItemName = nil,                                                     -- DONT change this.
    },


GIVE WEAPON EXAMPLE.

    [3] = {
        Title = 'Assault Rifle',                                            -- Title - THIS MUST BE UNIQUE.
        Description = 'Carbine Rifle with 250 rounds of ammunition',        -- Description.
        Input_Type = 'number',                                              -- [ 'text' / 'number' ] DONT change if you dont know what you are doing - https://www.w3schools.com/html/html_form_input_types.asp.
        Input_Description = '1 = x1 weapon with x250 ammo',                 -- The help text inside the input box.
        MaxLength = nil,                                                    -- DONT change this.
        Pattern = nil,                                                      -- DONT change this.
        Image = 'weapon.png',                                               -- The display image. (must be a .png and 512 x 512 size) 
        Cost = 5,                                                           -- The cost to purchase 1 of these.
        RewardType = 'weapon',                                              -- DONT change this.
        Quantity = 250,                                                     -- If the RewardType is 'weapon', then this is the amount of ammo to add. (players will only recieve 1 weapon).
        ItemName = 'WEAPON_CARBNIERIFLE',                                   -- The spawn name of this weapon.
    },


GIVE MONEY EXAMPLE.

    [4] = {
        Title = 'Money',                                                    -- Title - THIS MUST BE UNIQUE.
        Description = 'A briefcase with $10,000 cash inside',               -- Description.
        Input_Type = 'number',                                              -- [ 'text' / 'number' ] DONT change if you dont know what you are doing - https://www.w3schools.com/html/html_form_input_types.asp.
        Input_Description = '1 = $10000',                                   -- The help text inside the input box.
        MaxLength = nil,                                                    -- DONT change this.
        Pattern = nil,                                                      -- DONT change this.
        Image = 'money.png',                                                -- The display image. (must be a .png and 512 x 512 size) 
        Cost = 5,                                                           -- The cost to purchase 1 of these.
        RewardType = 'money',                                               -- DONT change this.
        Quantity = 10000,                                                   -- If the RewardType is 'money', then this is the amount of money to add. (10000 would give the player $10,000 to their bank).
        ItemName = nil,                                                     -- DONT change this.
    },


GIVE ITEM EXAMPLE.

    [5] = {
        Title = 'Gold Bars',                                                -- Title - THIS MUST BE UNIQUE.
        Description = 'x5 24 carat gold bars',                              -- Description.
        Input_Type = 'number',                                              -- [ 'text' / 'number' ] DONT change if you dont know what you are doing - https://www.w3schools.com/html/html_form_input_types.asp.
        Input_Description = '1 = x5 items',                                 -- The help text inside the input box.
        MaxLength = nil,                                                    -- DONT change this.
        Pattern = nil,                                                      -- DONT change this.
        Image = 'goldbar.png',                                              -- The display image. (must be a .png and 512 x 512 size) 
        Cost = 5,                                                           -- The cost to purchase 1 of these.
        RewardType = 'item',                                                -- DONT change this.
        Quantity = 5,                                                       -- If the RewardType is 'item', then this is the amount of items add. (1 would give the player x1 item).
        ItemName = 'water',                                                 -- The spawn name of this item.
    },

CHANGE CHARACTER NAME EXAMPLE.
    [6] = {
        Title = 'Character Name',                                           -- Title - THIS MUST BE UNIQUE.
        Description = 'Change your character name',                         -- Description.
        Input_Type = 'text',                                                -- [ 'text' / 'number' ] DONT change if you dont know what you are doing - https://www.w3schools.com/html/html_form_input_types.asp.
        Input_Description = 'eg., John Smith',                              -- The help text inside the input box.
        MaxLength = nil,                                                    -- DONT change this.
        Pattern = '[^a-zA-Z\\s]',                                           -- '[^a-zA-Z0-9]' = Allows both text and numbers with no spaces. / '[^0-9\\-]' = Allows numbers only. / '[^a-zA-Z\\s]' = Allows text with spaces.
        Image = 'character_name.png',                                       -- The display image. (must be a .png and 512 x 512 size) 
        Cost = 15,                                                          -- The cost to purchase 1 of these.
        RewardType = 'character_name',                                      -- DONT change this.
        Quantity = nil,                                                     -- DONT change this.
        ItemName = nil,                                                     -- DONT change this.
    },

FULL VEHICLE PACKS EXAMPLE. (by "packs" we mean you can sell multiple vehicles in this 1 product)
    [7] = {
        Title = 'Vehicle Pack',                                             -- Title - THIS MUST BE UNIQUE.
        Description = 'Contains x1 adder, x1 golf cart and x1 jetski',      -- Description.
        Input_Type = 'number',                                              -- [ 'text' / 'number' ] DONT change if you dont know what you are doing - https://www.w3schools.com/html/html_form_input_types.asp.
        Input_Description = '1 = x1 FULL car pack',                         -- The help text inside the input box.
        MaxLength = 1,                                                      -- The max amount of characters allowed.
        Pattern = '[^0-9\\-]',                                              -- '[^a-zA-Z0-9]' = Allows both text and numbers with no spaces. / '[^0-9\\-]' = Allows numbers only. / '[^a-zA-Z\\s]' = Allows text with spaces.
        Image = 'vehicle_pack.png',                                         -- The display image. (must be a .png and 512 x 512 size) 
        Cost = 50,                                                          -- The cost to purchase 1 of these.
        RewardType = 'vehicle_pack',                                        -- DONT change this.
        Quantity = nil,                                                     -- DONT change this.
        ItemName = {'adder', 'seashark', 'caddy'},                          -- Add the spawn name of the vehicles included in this vehicle pack to this table. Use the same format as the example.
    },


ADD CHARACTER SLOT EXAMPLE. (this comes pre-configured to work with cd_multicharacter. It will not work on other multichar scripts unless you edit the code, and we can not offer support for that, so we recommend you remove this from your shop).

    [8] = {
        Title = 'Character Slot',                                           -- Title - THIS MUST BE UNIQUE.
        Description = 'Add 1 extra character slot',                         -- Description.
        Input_Type = 'number',                                              -- [ 'text' / 'number' ] DONT change if you dont know what you are doing - https://www.w3schools.com/html/html_form_input_types.asp.
        Input_Description = '1 = x1 extra character slot',                  -- The help text inside the input box.
        MaxLength = nil,                                                    -- DONT change this.
        Pattern = nil,                                                      -- DONT change this.
        Image = 'character_slot.png',                                       -- The display image. (must be a .png and 512 x 512 size) 
        Cost = 10,                                                          -- The cost to purchase 1 of these.
        RewardType = 'character_slot',                                      -- DONT change this.
        Quantity = nil,                                                     -- DONT change this.
        ItemName = nil,                                                     -- DONT change this.
    },
]]


-- ██████╗ ████████╗██╗  ██╗███████╗██████╗ 
--██╔═══██╗╚══██╔══╝██║  ██║██╔════╝██╔══██╗
--██║   ██║   ██║   ███████║█████╗  ██████╔╝
--██║   ██║   ██║   ██╔══██║██╔══╝  ██╔══██╗
--╚██████╔╝   ██║   ██║  ██║███████╗██║  ██║
-- ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝


function Round(cd) return math.floor(cd+0.5) end
function Trim(cd) return cd:gsub('%s+', '') end

if Config.Framework == 'esx' then
    Config.FrameworkSQLtables = {
        vehicle_table = 'owned_vehicles',
        vehicle_identifier = 'owner',
        vehicle_props = 'vehicle',
        users_table = 'users',
        users_identifier = 'identifier',
    }
elseif Config.Framework == 'qbcore' then
    Config.FrameworkSQLtables = {
        vehicle_table = 'player_vehicles',
        vehicle_identifier = 'citizenid',
        vehicle_props = 'mods',
        users_table = 'players',
        users_identifier = 'citizenid',
    }
end