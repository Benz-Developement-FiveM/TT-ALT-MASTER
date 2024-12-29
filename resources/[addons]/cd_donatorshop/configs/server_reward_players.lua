FW = Config.FrameworkSQLtables

local function SplitName(name)
    name = name:lower()
    local count = 0
    local firstname, lastname = nil, nil
    for new_name in string.gmatch(name, '[^%s][0-9a-z][^ ]*') do
        count = count+1
        if count == 1 then firstname = new_name:sub(1,1):upper()..new_name:sub(2) end
        if count == 2 then lastname = new_name:sub(1,1):upper()..new_name:sub(2) end
    end
    if count == 2 then
        return {result = true, firstname = firstname, lastname = lastname}
    else
        return {result = false}
    end
end

local function BlacklistedWordChecks(word)
    for c, d in pairs(Config.BlacklistedWords) do
        if string.match(word:lower(), d:lower()) then
            return d
        else
            return false
        end
    end
end

local function GenerateSpacesInPlate(new_plate)
    local ws = ' '
    if #new_plate ~= 8 then
        if #new_plate == 7 then
            return new_plate..''..ws
        elseif #new_plate == 6 then
            return ws..''..new_plate..''..ws
        elseif #new_plate == 5 then
            return ws..''..ws..''..new_plate..''..ws
        elseif #new_plate == 4 then
            return ws..''..ws..''..new_plate..''..ws..''..ws
        elseif #new_plate == 3 then
            return ws..''..ws..''..new_plate..''..ws..''..ws..''..ws
        elseif #new_plate == 2 then
            return ws..''..ws..''..ws..''..new_plate..''..ws..''..ws..''..ws
        elseif #new_plate == 1 then
            return ws..''..ws..''..ws..''..ws..''..new_plate..''..ws..''..ws..''..ws
        end
    else
        return new_plate
    end
end


--██████╗ ██╗      █████╗ ████████╗███████╗     ██████╗██╗  ██╗ █████╗ ███╗   ██╗ ██████╗ ███████╗
--██╔══██╗██║     ██╔══██╗╚══██╔══╝██╔════╝    ██╔════╝██║  ██║██╔══██╗████╗  ██║██╔════╝ ██╔════╝
--██████╔╝██║     ███████║   ██║   █████╗      ██║     ███████║███████║██╔██╗ ██║██║  ███╗█████╗  
--██╔═══╝ ██║     ██╔══██║   ██║   ██╔══╝      ██║     ██╔══██║██╔══██║██║╚██╗██║██║   ██║██╔══╝  
--██║     ███████╗██║  ██║   ██║   ███████╗    ╚██████╗██║  ██║██║  ██║██║ ╚████║╚██████╔╝███████╗
--╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝     ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝


RegisterServerEvent('cd_donatorshop:Reward:plate_change')
AddEventHandler('cd_donatorshop:Reward:plate_change', function(source, ConfigTable, plates)
    plates.new_plate = plates.new_plate:upper()
    if plates.old_plate ~= nil then
        if plates.new_plate and #plates.new_plate > 0 then
            local blacklist_check = BlacklistedWordChecks(plates.new_plate)
            if not blacklist_check then
                if Config.VehicleDatabasePlateType == 'with_spaces' then
                    plates.new_plate = GenerateSpacesInPlate(plates.new_plate)
                end
                
                if Config.Framework == 'esx' or Config.Framework == 'qbcore' then
                    local Result1 = DatabaseQuery('SELECT plate, '..FW.vehicle_props..' FROM '..FW.vehicle_table..' WHERE plate="'..plates.old_plate..'"')
                    if Result1 and Result1[1] then
                        local Result2 = DatabaseQuery('SELECT plate FROM '..FW.vehicle_table..' WHERE plate="'..plates.new_plate..'"')
                        if Result2 and Result2[1] == nil then

                            local props
                            if Config.Framework == 'esx' then
                                props = json.decode(Result1[1].vehicle)
                            elseif Config.Framework == 'qbcore' then 
                                props = json.decode(Result1[1].mods)
                            end
                            props.plate = plates.new_plate

                            DatabaseQuery('UPDATE '..FW.vehicle_table..' SET plate=@new_plate, '..FW.vehicle_props..'=@props WHERE plate=@old_plate', {
                                ['@old_plate'] = plates.old_plate,
                                ['@new_plate'] = plates.new_plate,
                                ['@props'] = json.encode(props),
                            })
                            TriggerClientEvent('cd_donatorshop:ChangePlate', source, plates.new_plate)
                            RemoveBalance(source, ConfigTable.Cost)
                            TriggerClientEvent('cd_donatorshop:UI_Notif', source, 'success', string.format(L('platechange_success'), plates.old_plate, plates.new_plate))
                            table.insert(LogsTable[source], string.format(L('logs_reward_platechange'), ConfigTable.Title, ConfigTable.Cost, plates.old_plate, plates.new_plate))
                            LogsTable[source].timer = LogsTable[source].timer+2
                        else
                            TriggerClientEvent('cd_donatorshop:UI_Notif', source, 'failed', string.format(L('duplicate_plate'), plates.old_plate))
                        end
                    else
                        TriggerClientEvent('cd_donatorshop:UI_Notif', source, 'failed', string.format(L('not_owned_vehicle'), plates.old_plate))
                    end


                elseif Config.Framework == 'other' then
                    --Add your own code here.

                end

            else
                TriggerClientEvent('cd_donatorshop:UI_Notif', source, 'failed', string.format(L('blacklisted_word'), blacklist_check))
            end
        else
            TriggerClientEvent('cd_donatorshop:UI_Notif', source, 'failed', L('new_plate_nil'))
        end
    else
        TriggerClientEvent('cd_donatorshop:UI_Notif', source, 'failed', L('old_plate_nil'))
    end
end)


--██████╗ ██╗  ██╗ ██████╗ ███╗   ██╗███████╗    ███╗   ██╗██╗   ██╗███╗   ███╗██████╗ ███████╗██████╗ 
--██╔══██╗██║  ██║██╔═══██╗████╗  ██║██╔════╝    ████╗  ██║██║   ██║████╗ ████║██╔══██╗██╔════╝██╔══██╗
--██████╔╝███████║██║   ██║██╔██╗ ██║█████╗      ██╔██╗ ██║██║   ██║██╔████╔██║██████╔╝█████╗  ██████╔╝
--██╔═══╝ ██╔══██║██║   ██║██║╚██╗██║██╔══╝      ██║╚██╗██║██║   ██║██║╚██╔╝██║██╔══██╗██╔══╝  ██╔══██╗
--██║     ██║  ██║╚██████╔╝██║ ╚████║███████╗    ██║ ╚████║╚██████╔╝██║ ╚═╝ ██║██████╔╝███████╗██║  ██║
--╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝    ╚═╝  ╚═══╝ ╚═════╝ ╚═╝     ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝


RegisterServerEvent('cd_donatorshop:Reward:phone_number')
AddEventHandler('cd_donatorshop:Reward:phone_number', function(source, ConfigTable, new_phone_number)
    local identifier = GetIdentifier_character(source)
    local old_phone_number

    if Config.Framework == 'esx' then
        local Result1 = DatabaseQuery('SELECT phone_number FROM users WHERE phone_number="'..new_phone_number..'"')
        if Result1 and Result1[1] == nil then
            local Result2 = DatabaseQuery('SELECT phone_number FROM users WHERE identifier="'..identifier..'"')
            if Result2 and Result2[1] and Result2[1].phone_number then
                old_phone_number = Result2[1].phone_number
                DatabaseQuery('UPDATE users SET phone_number="'..new_phone_number..'" WHERE identifier="'..identifier..'"')
            end
        else
            TriggerClientEvent('cd_donatorshop:UI_Notif', source, 'failed', string.format(L('phonenumber_failed'), new_phone_number))
            return
        end

    elseif Config.Framework == 'qbcore' then
        local duplicate_phonenumber = false
        local Result = DatabaseQuery('SELECT charinfo FROM players')
        if Result and Result[1] then
            for cd = 1, #Result do
                if json.decode(Result[cd].charinfo).phone == new_phone_number then
                    duplicate_phonenumber = true
                    break
                end
            end
        end
        if not duplicate_phonenumber then
            old_phone_number = QBCore.Functions.GetPlayer(source).PlayerData.charinfo.phone
            TriggerEvent('cd_donatorshop:UpdateCharInfo', source, 'phone', {phone = new_phone_number})

        else
            TriggerClientEvent('cd_donatorshop:UI_Notif', source, 'failed', string.format(L('phonenumber_failed'), new_phone_number))
            return
        end

    elseif Config.Framework == 'other' then
        --Add your own code here.
        
    end

    RemoveBalance(source, ConfigTable.Cost)
    TriggerEvent('cd_donatorshop:PhoneNumberChanged', new_phone_number, source)
    TriggerClientEvent('cd_donatorshop:UI_Notif', source, 'success', string.format(L('phonenumber_success'), old_phone_number, new_phone_number))
    table.insert(LogsTable[source], string.format(L('logs_reward_phonenumber'), ConfigTable.Title, ConfigTable.Cost, old_phone_number, new_phone_number))
    LogsTable[source].timer = LogsTable[source].timer+2
end)


--███╗   ███╗ ██████╗ ███╗   ██╗███████╗██╗   ██╗
--████╗ ████║██╔═══██╗████╗  ██║██╔════╝╚██╗ ██╔╝
--██╔████╔██║██║   ██║██╔██╗ ██║█████╗   ╚████╔╝ 
--██║╚██╔╝██║██║   ██║██║╚██╗██║██╔══╝    ╚██╔╝  
--██║ ╚═╝ ██║╚██████╔╝██║ ╚████║███████╗   ██║   
--╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝   ╚═╝ 


RegisterServerEvent('cd_donatorshop:Reward:money')
AddEventHandler('cd_donatorshop:Reward:money', function(source, ConfigTable)
    if Config.Framework == 'esx' then
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.addAccountMoney('bank', ConfigTable.Quantity)
        

    elseif Config.Framework == 'qbcore' then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        xPlayer.Functions.AddMoney('bank', ConfigTable.Quantity, 'cd_donatorshop')
    
    elseif Config.Framework == 'other' then
        --Add your own code here.

    end

    RemoveBalance(source, ConfigTable.Cost)
    TriggerClientEvent('cd_donatorshop:UI_Notif', source, 'success', string.format(L('money_success'), ConfigTable.Quantity))
    table.insert(LogsTable[source], string.format(L('logs_reward_money'), ConfigTable.Title, ConfigTable.Cost, ConfigTable.Quantity))
    LogsTable[source].timer = LogsTable[source].timer+2
end)


--██╗████████╗███████╗███╗   ███╗
--██║╚══██╔══╝██╔════╝████╗ ████║
--██║   ██║   █████╗  ██╔████╔██║
--██║   ██║   ██╔══╝  ██║╚██╔╝██║
--██║   ██║   ███████╗██║ ╚═╝ ██║
--╚═╝   ╚═╝   ╚══════╝╚═╝     ╚═╝


RegisterServerEvent('cd_donatorshop:Reward:item')
AddEventHandler('cd_donatorshop:Reward:item', function(source, ConfigTable)
    if Config.Framework == 'esx' then
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.addInventoryItem(ConfigTable.ItemName, ConfigTable.Quantity)
    
    elseif Config.Framework == 'qbcore' then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        xPlayer.Functions.AddItem(ConfigTable.ItemName, ConfigTable.Quantity)

    elseif Config.Framework == 'other' then
        --Add your own code here.

    end

    RemoveBalance(source, ConfigTable.Cost)
    TriggerClientEvent('cd_donatorshop:UI_Notif', source, 'success', string.format(L('item_success'), ConfigTable.Quantity, ConfigTable.Title))
    table.insert(LogsTable[source], string.format(L('logs_reward_item'), ConfigTable.Title, ConfigTable.Cost, ConfigTable.ItemName, ConfigTable.Quantity))
    LogsTable[source].timer = LogsTable[source].timer+2
end)


--██╗    ██╗███████╗ █████╗ ██████╗  ██████╗ ███╗   ██╗
--██║    ██║██╔════╝██╔══██╗██╔══██╗██╔═══██╗████╗  ██║
--██║ █╗ ██║█████╗  ███████║██████╔╝██║   ██║██╔██╗ ██║
--██║███╗██║██╔══╝  ██╔══██║██╔═══╝ ██║   ██║██║╚██╗██║
--╚███╔███╔╝███████╗██║  ██║██║     ╚██████╔╝██║ ╚████║
-- ╚══╝╚══╝ ╚══════╝╚═╝  ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═══╝


RegisterServerEvent('cd_donatorshop:Reward:weapon')
AddEventHandler('cd_donatorshop:Reward:weapon', function(source, ConfigTable)
    if Config.Framework == 'esx' then
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.addWeapon(ConfigTable.ItemName, ConfigTable.Quantity)

    elseif Config.Framework == 'qbcore' then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        local data = {}
        data.serie = tostring(QBCore.Shared.RandomInt(2) .. QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(4))
        xPlayer.Functions.AddItem(ConfigTable.ItemName, 1, false, data)

    elseif Config.Framework == 'other' then
        --Add your own code here.

    end

    RemoveBalance(source, ConfigTable.Cost)
    TriggerClientEvent('cd_donatorshop:UI_Notif', source, 'success', string.format(L('weapon_success'), ConfigTable.Title))
    table.insert(LogsTable[source], string.format(L('logs_reward_weapon'), ConfigTable.Title, ConfigTable.Cost, ConfigTable.ItemName, ConfigTable.Quantity))
    LogsTable[source].timer = LogsTable[source].timer+2
end)


-- ██████╗██╗  ██╗ █████╗ ██████╗  █████╗  ██████╗████████╗███████╗██████╗     ███╗   ██╗ █████╗ ███╗   ███╗███████╗
--██╔════╝██║  ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗    ████╗  ██║██╔══██╗████╗ ████║██╔════╝
--██║     ███████║███████║██████╔╝███████║██║        ██║   █████╗  ██████╔╝    ██╔██╗ ██║███████║██╔████╔██║█████╗  
--██║     ██╔══██║██╔══██║██╔══██╗██╔══██║██║        ██║   ██╔══╝  ██╔══██╗    ██║╚██╗██║██╔══██║██║╚██╔╝██║██╔══╝  
--╚██████╗██║  ██║██║  ██║██║  ██║██║  ██║╚██████╗   ██║   ███████╗██║  ██║    ██║ ╚████║██║  ██║██║ ╚═╝ ██║███████╗
-- ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝    ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝


RegisterServerEvent('cd_donatorshop:Reward:character_name')
AddEventHandler('cd_donatorshop:Reward:character_name', function(source, ConfigTable, new_fullname)
    local blacklist_check = BlacklistedWordChecks(new_fullname)
    if not blacklist_check then
        local old_fullname
        local new_names = SplitName(new_fullname)
        if new_names.result then

            if Config.Framework == 'esx' then
                local identifier = GetIdentifier_character(source)
                local Result = DatabaseQuery('SELECT firstname, lastname FROM users WHERE identifier="'..identifier..'"')
                if Result and Result[1] then
                    old_fullname = Result[1].firstname..' '..Result[1].lastname
                    DatabaseQuery('UPDATE users SET firstname="'..new_names.firstname..'", lastname="'..new_names.lastname..'" WHERE identifier="'..identifier..'"')
                end

            elseif Config.Framework == 'qbcore' then
                local xPlayer = QBCore.Functions.GetPlayer(source)
                old_fullname = xPlayer.PlayerData.charinfo.firstname..' '..xPlayer.PlayerData.charinfo.lastname
                TriggerEvent('cd_donatorshop:UpdateCharInfo', source, 'charname', new_names)

            elseif Config.Framework == 'other' then
                --Add your own code here.

            end
            
            RemoveBalance(source, ConfigTable.Cost)
            TriggerEvent('cd_donatorshop:CharacterNameChanged', new_fullname, source)
            TriggerClientEvent('cd_donatorshop:UI_Notif', source, 'success', string.format(L('charactername_success'), old_fullname, new_fullname))
            table.insert(LogsTable[source], string.format(L('logs_reward_charactername'), ConfigTable.Title, ConfigTable.Cost, old_fullname, new_fullname))
            LogsTable[source].timer = LogsTable[source].timer+2
        else
            TriggerClientEvent('cd_donatorshop:UI_Notif', source, 'failed', L('charactername_invalidformat'))
        end
    else
        TriggerClientEvent('cd_donatorshop:UI_Notif', source, 'failed', string.format(L('blacklisted_word'), blacklist_check))
    end
end)


-- ██████╗ █████╗ ██████╗     ██████╗  █████╗  ██████╗██╗  ██╗███████╗
--██╔════╝██╔══██╗██╔══██╗    ██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██╔════╝
--██║     ███████║██████╔╝    ██████╔╝███████║██║     █████╔╝ ███████╗
--██║     ██╔══██║██╔══██╗    ██╔═══╝ ██╔══██║██║     ██╔═██╗ ╚════██║
--╚██████╗██║  ██║██║  ██║    ██║     ██║  ██║╚██████╗██║  ██╗███████║
-- ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝


local CarPackPurchase = {}
RegisterServerEvent('cd_donatorshop:Reward:vehicle_pack')
AddEventHandler('cd_donatorshop:Reward:vehicle_pack', function(source, ConfigTable)
    local identifier = GetIdentifier_character(source)
    local cars_table = ConfigTable.ItemName
    local last_vehicle = false
    LogsTable[source].timer = LogsTable[source].timer+(#cars_table*5)
    CarPackPurchase[source] = {}
    CarPackPurchase[source].AntiCheat = math.random(0000000,9999999)
    CarPackPurchase[source].CarSaved = {}
    
    for cd = 1, #cars_table do
        CarPackPurchase[source].CarSaved[cd] = false
    end
    TriggerClientEvent('cd_donatorshop:Close_UI', source)
    TriggerClientEvent('cd_donatorshop:DisableControls', source, true)
    for cd = 1, #cars_table do
        if cd == #cars_table then last_vehicle = true end
        TriggerClientEvent('cd_donatorshop:VehiclePackPurchased', source, cars_table[cd], CarPackPurchase[source].AntiCheat, cd, last_vehicle)
        while CarPackPurchase[source].CarSaved[cd] == false do Wait(1000) end
    end
    if CarPackPurchase[source].AntiCheat ~= 'USING LUA INJECTOR' then
        CarPackPurchase[source] = nil

        RemoveBalance(source, ConfigTable.Cost)
        TriggerClientEvent('cd_donatorshop:UI_Notif', source, 'success', L('vehiclepack_success'))
        TriggerClientEvent('cd_donatorshop:DisableControls', source, false)
        table.insert(LogsTable[source], string.format(L('logs_reward_vehiclepack'), ConfigTable.Title, ConfigTable.Cost))
    end
end)


--██████╗ ██╗   ██╗██████╗  ██████╗██╗  ██╗ █████╗ ███████╗███████╗    ██╗   ██╗███████╗██╗  ██╗██╗ ██████╗██╗     ███████╗
--██╔══██╗██║   ██║██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝██╔════╝    ██║   ██║██╔════╝██║  ██║██║██╔════╝██║     ██╔════╝
--██████╔╝██║   ██║██████╔╝██║     ███████║███████║███████╗█████╗      ██║   ██║█████╗  ███████║██║██║     ██║     █████╗  
--██╔═══╝ ██║   ██║██╔══██╗██║     ██╔══██║██╔══██║╚════██║██╔══╝      ╚██╗ ██╔╝██╔══╝  ██╔══██║██║██║     ██║     ██╔══╝  
--██║     ╚██████╔╝██║  ██║╚██████╗██║  ██║██║  ██║███████║███████╗     ╚████╔╝ ███████╗██║  ██║██║╚██████╗███████╗███████╗
--╚═╝      ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝      ╚═══╝  ╚══════╝╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝╚══════╝


RegisterServerEvent('cd_donatorshop:Purchase_Vehicle')
AddEventHandler('cd_donatorshop:Purchase_Vehicle', function(data, props, garage_type, label, pack_purchased, cd)
    local _source = source
    if pack_purchased == nil and LogsTable[_source] then
        TriggerClientEvent('cd_donatorshop:DeleteVehicleExploitAttempt', _source)
        Notif(_source, 3, 'vehicle_exploit')
        return
    end

    local identifier_character = GetIdentifier_character(_source)
    local using_lua_injector = false

    if pack_purchased ~= nil and CarPackPurchase[_source] and CarPackPurchase[_source].AntiCheat then
        CarPackPurchase[_source].CarSaved[cd] = true
        if CarPackPurchase[_source].AntiCheat ~= pack_purchased then
            DropPlayer(_source, 'USING LUA INJECTOR')
            ExploitAlertLogs(_source, identifier)
            CarPackPurchase[_source].AntiCheat = 'USING LUA INJECTOR'
            using_lua_injector = true
        end
    end
    
    if not using_lua_injector then
        
        if Config.Framework == 'esx' then
            if GetResourceState('cd_garage') == 'started' then
                DatabaseQuery('INSERT INTO '..FW.vehicle_table..' ('..FW.vehicle_identifier..', plate, '..FW.vehicle_props..', garage_type, in_garage) VALUES (@'..FW.vehicle_identifier..', @plate, @'..FW.vehicle_props..', @garage_type, @in_garage)',
                {
                    ['@'..FW.vehicle_identifier] = identifier_character,
                    ['@plate'] = props.plate,
                    ['@'..FW.vehicle_props] = json.encode(props),
                    ['@garage_type'] = garage_type,
                    ['@in_garage'] = 0,
                })
            else
                DatabaseQuery('INSERT INTO '..FW.vehicle_table..' ('..FW.vehicle_identifier..', plate, '..FW.vehicle_props..') VALUES (@'..FW.vehicle_identifier..', @plate, @'..FW.vehicle_props..')',
                {
                    ['@'..FW.vehicle_identifier] = identifier_character,
                    ['@plate'] = props.plate,
                    ['@'..FW.vehicle_props] = json.encode(props),
                })
            end
        
        elseif Config.Framework == 'qbcore' then
            if GetResourceState('cd_garage') == 'started' then
                DatabaseQuery('INSERT INTO '..FW.vehicle_table..' ('..FW.vehicle_identifier..', plate, '..FW.vehicle_props..', license, hash, vehicle, garage_type, in_garage) VALUES (@'..FW.vehicle_identifier..', @plate, @'..FW.vehicle_props..', @license, @hash, @vehicle, @garage_type, @in_garage)',
                {
                    ['@'..FW.vehicle_identifier] = identifier_character,
                    ['@plate'] = props.plate,
                    ['@'..FW.vehicle_props] = json.encode(props),
                    ['@license'] = GetIdentifier_player(_source),
                    ['@hash'] = props.model,
                    ['@vehicle'] = label.model,
                    ['@garage_type'] = garage_type,
                    ['@in_garage'] = 0,
                })
            else
                DatabaseQuery('INSERT INTO '..FW.vehicle_table..' ('..FW.vehicle_identifier..', plate, '..FW.vehicle_props..', license, hash, vehicle) VALUES (@'..FW.vehicle_identifier..', @plate, @'..FW.vehicle_props..', @license, @hash, @vehicle)',
                {
                    ['@'..FW.vehicle_identifier] = identifier_character,
                    ['@plate'] = props.plate,
                    ['@'..FW.vehicle_props] = json.encode(props),
                    ['@license'] = GetIdentifier_player(_source),
                    ['@hash'] = props.model,
                    ['@vehicle'] = label.model,
                })
            end


        elseif Config.Framework == 'other' then
            --Add your own NON esx code here.

        end

        if not pack_purchased then
            RemoveBalance(_source, data.Cost)
            TriggerClientEvent('cd_donatorshop:Purchasedvehicle', _source)
            VehiclePurchaseLogs(_source, props.plate, garage_type, label.label, props.model, data.Cost)
            Notif(_source, 1, 'purchase_complete')
        end
    end
end)


-- ██████╗██╗  ██╗ █████╗ ██████╗  █████╗  ██████╗████████╗███████╗██████╗     ███████╗██╗      ██████╗ ████████╗
--██╔════╝██║  ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗    ██╔════╝██║     ██╔═══██╗╚══██╔══╝
--██║     ███████║███████║██████╔╝███████║██║        ██║   █████╗  ██████╔╝    ███████╗██║     ██║   ██║   ██║   
--██║     ██╔══██║██╔══██║██╔══██╗██╔══██║██║        ██║   ██╔══╝  ██╔══██╗    ╚════██║██║     ██║   ██║   ██║   
--╚██████╗██║  ██║██║  ██║██║  ██║██║  ██║╚██████╗   ██║   ███████╗██║  ██║    ███████║███████╗╚██████╔╝   ██║   
-- ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝    ╚══════╝╚══════╝ ╚═════╝    ╚═╝

local function SortLicenseIdentifier(identifier) --removes the "license:" string from the license identifier, needed for getting the correct identifier in users_lastcharacter.
    if #identifier > 30 then
        return identifier:sub(9)
    else
        return identifier
    end
end

RegisterServerEvent('cd_donatorshop:Reward:character_slot')
AddEventHandler('cd_donatorshop:Reward:character_slot', function(source, ConfigTable, amount)
    if GetResourceState('cd_multicharacter') == 'started' then
        local identifier = SortLicenseIdentifier(GetIdentifier_player(source))
        local Result = DatabaseQuery('SELECT max_chars FROM user_lastcharacter WHERE steamid="'..identifier..'"')
        if Result and Result[1] and Result[1].max_chars then
            if tonumber(Result[1].max_chars)+1 <= Config.cd_multicharacter_maxslots then
                local new_maxchars = Round(Result[1].max_chars+amount)
                DatabaseQuery('UPDATE user_lastcharacter SET max_chars="'..new_maxchars..'" WHERE steamid="'..identifier..'"')
                RemoveBalance(source, ConfigTable.Cost*amount)
                TriggerClientEvent('cd_donatorshop:UI_Notif', source, 'success', string.format(L('characterslot_success'), amount, new_maxchars))
                table.insert(LogsTable[source], string.format(L('logs_reward_characterslot'), ConfigTable.Title, ConfigTable.Cost*amount, Result[1].max_chars, new_maxchars))
                LogsTable[source].timer = LogsTable[source].timer+2
            else
                TriggerClientEvent('cd_donatorshop:UI_Notif', source, 'failed', string.format(L('maxchars_reached'), Config.cd_multicharacter_maxslots))
            end
        else
            TriggerClientEvent('cd_donatorshop:UI_Notif', source, 'failed', L('characterslot_failed'))
        end
    else
        TriggerClientEvent('cd_donatorshop:UI_Notif', source, 'failed', 'Unable to purchase this currently.')
    end
end)
