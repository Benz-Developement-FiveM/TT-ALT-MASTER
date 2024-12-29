--███████╗██████╗  █████╗ ███╗   ███╗███████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
--██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
--█████╗  ██████╔╝███████║██╔████╔██║█████╗  ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ 
--██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║   ██║██╔══██╗██╔═██╗ 
--██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
--╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝


ESX, QBCore = nil, nil

if Config.Framework == 'esx' then
    TriggerEvent(Config.FrameworkTriggers.main, function(obj) ESX = obj end)
    if ESX == nil then
        ESX = exports[Config.FrameworkTriggers.resource_name]:getSharedObject()
    end
    
elseif Config.Framework == 'qbcore' then
    TriggerEvent(Config.FrameworkTriggers.main, function(obj) QBCore = obj end)
    if QBCore == nil then
        QBCore = exports[Config.FrameworkTriggers.resource_name]:GetCoreObject()
    end
end

function GetIdentifier_character(source)
    if Config.Framework == 'esx' then 
        local xPlayer = ESX.GetPlayerFromId(source)
        return xPlayer.identifier

    elseif Config.Framework == 'qbcore' then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        return xPlayer.PlayerData.citizenid

    elseif Config.Framework == 'other' then
        return GetPlayerIdentifiers(source)[1] --we want to return an identifier for a players current character, eg., when giving them cars/items etc.. (string).

    end
end

function GetIdentifier_player(source)
    if Config.Framework == 'esx' or Config.Framework == 'qbcore' then
        for c, d in pairs(GetPlayerIdentifiers(source)) do
            if string.find(d, Config.IdentifierType) then
                return d
            end
        end

    elseif Config.Framework == 'other' then
        return GetPlayerIdentifiers(source)[1] --we want to return an identifier that can be accessed from any character, eg., so any character can access the donator shop (string).

    end
end

function CheckPerms(source)
    
    if Config.Framework == 'esx' then 
        local xPlayer = ESX.GetPlayerFromId(source)
        local perms = xPlayer.getGroup()
        for c, d in pairs(Config.StaffCommands.Perms[Config.Framework]) do
            if perms == d then
                return true
            end
        end

    elseif Config.Framework == 'qbcore' then
        local perms = QBCore.Functions.GetPermission(source)
        for c, d in pairs(Config.StaffCommands.Perms[Config.Framework]) do
            if type(perms) == 'string' then
                if perms == d then
                    return true
                end
            elseif type(perms) == 'table' then
                if perms[d] then
                    return true
                end
            end
        end
    
    elseif Config.Framework == 'other' then
        --check the players permissions (boolean).
    end

    return false
end


--███████╗███████╗██████╗ ██╗   ██╗███████╗██████╗     ███████╗██╗  ██╗██████╗  ██████╗ ██████╗ ████████╗███████╗
--██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝██╔══██╗    ██╔════╝╚██╗██╔╝██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔════╝
--███████╗█████╗  ██████╔╝██║   ██║█████╗  ██████╔╝    █████╗   ╚███╔╝ ██████╔╝██║   ██║██████╔╝   ██║   ███████╗
--╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██╔══╝  ██╔══██╗    ██╔══╝   ██╔██╗ ██╔═══╝ ██║   ██║██╔══██╗   ██║   ╚════██║
--███████║███████╗██║  ██║ ╚████╔╝ ███████╗██║  ██║    ███████╗██╔╝ ██╗██║     ╚██████╔╝██║  ██║   ██║   ███████║
--╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝    ╚══════╝╚═╝  ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝


function GetBalance(source)
    local identifier = GetIdentifier_player(source)
    local Result = DatabaseQuery('SELECT balance FROM cd_donatorshop WHERE identifier="'..identifier..'"')
    if Result and Result[1] and Result[1].balance then
        return tonumber(Result[1].balance)
    else
        return 0
    end
end

function AddBalance(source, amount)
    local identifier = GetIdentifier_player(source)
    local Result = DatabaseQuery('SELECT identifier FROM cd_donatorshop WHERE identifier="'..identifier..'"')
    if Result and Result[1] then
        local balance = GetBalance(source)
        DatabaseQuery('UPDATE cd_donatorshop SET balance="'..balance+amount..'" WHERE identifier="'..identifier..'"')
    else
        DatabaseQuery('INSERT INTO cd_donatorshop (identifier, balance) VALUES ("'..identifier..'", "'..amount..'")')
    end
end

function RemoveBalance(source, amount)
    local identifier = GetIdentifier_player(source)
    local balance = GetBalance(source)
    if balance > 0 then
        DatabaseQuery('UPDATE cd_donatorshop SET balance="'..balance-amount..'" WHERE identifier="'..identifier..'"')
    end
end

function CanPurchaseCheck(source, cost)
    local balance = GetBalance(source)
    if balance >= cost then
        return true
    else
        return false
    end
end


--██████╗ ██╗   ██╗██████╗  ██████╗██╗  ██╗ █████╗ ███████╗███████╗███████╗
--██╔══██╗██║   ██║██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝██╔════╝██╔════╝
--██████╔╝██║   ██║██████╔╝██║     ███████║███████║███████╗█████╗  ███████╗
--██╔═══╝ ██║   ██║██╔══██╗██║     ██╔══██║██╔══██║╚════██║██╔══╝  ╚════██║
--██║     ╚██████╔╝██║  ██║╚██████╗██║  ██║██║  ██║███████║███████╗███████║
--╚═╝      ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝


RegisterServerEvent('cd_donatorshop:Purchase')
AddEventHandler('cd_donatorshop:Purchase', function(data, old_plate)
    local _source = source
    if not LogsTable[_source] then
        local amount = 0
        Wait(500)
        if CanPurchaseCheck(_source, amount) then
            LogsTable[_source] = {}
            LogsTable[_source].timer = 1
            for c, d in pairs(data) do

                local ConfigTable = CrossCheck(d[1])
                local repeat_count = 1
                if ConfigTable.RewardType == 'weapon' or ConfigTable.RewardType == 'money' or ConfigTable.RewardType == 'item' then
                    repeat_count = tonumber(d[2])
                end

                for cd = 1, repeat_count do
                    amount = amount+CrossCheck(d[1]).Cost

                    if ConfigTable.RewardType == 'plate_change' then
                        local new_plate = d[2]
                        d[2] = {}
                        d[2].old_plate = old_plate
                        d[2].new_plate = new_plate
                    end

                    TriggerEvent(string.format('cd_donatorshop:Reward:%s', ConfigTable.RewardType), _source, ConfigTable, d[2])
                    Wait(2000)
                end
            end

            while LogsTable[_source].timer > 0 do Wait(1000) LogsTable[_source].timer=LogsTable[_source].timer-1 end
            UIPurchaseLogs(_source, LogsTable[_source], amount)
            LogsTable[_source] = nil
            Notif(_source, 1, 'purchase_complete')
        else
            TriggerClientEvent('cd_donatorshop:UI_Notif', _source, 'failed', L('insufficient_balance'))
        end
    else
        TriggerClientEvent('cd_donatorshop:UI_Notif', _source, 'failed', L('please_wait'))
    end
end)


--███████╗████████╗ █████╗ ███████╗███████╗     ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗
--██╔════╝╚══██╔══╝██╔══██╗██╔════╝██╔════╝    ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝
--███████╗   ██║   ███████║█████╗  █████╗      ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║███████╗
--╚════██║   ██║   ██╔══██║██╔══╝  ██╔══╝      ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║╚════██║
--███████║   ██║   ██║  ██║██║     ██║         ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████║
--╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝     ╚═╝          ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝


RegisterCommand(Config.StaffCommands.Add_Balance, function(source, args)
    local _source = source
    if CheckPerms(_source) then
        if args[1] and args[2] then
            local target_source = tonumber(args[1])
            local target_name = GetPlayerName(target_source)
            local amount = tonumber(args[2])
            if target_name then
                AddBalance(target_source, amount)
                Notif(_source, 1, 'added_balance', amount, target_name)
                StaffLogs(_source, target_source, Config.StaffCommands.Add_Balance, amount)
            else
                Notif(_source, 3, 'player_not_online', amount, target_source)
            end
        else
            Notif(_source, 3, 'invalid_format')
        end
    else
        Notif(_source, 3, 'no_permissions')
    end
end)

RegisterCommand(Config.StaffCommands.Remove_Balance, function(source, args)
    local _source = source
    if CheckPerms(_source) then
        if args[1] and args[2] then
            local target_source = tonumber(args[1])
            local target_name = GetPlayerName(target_source)
            local amount = tonumber(args[2])
            if target_name then
                RemoveBalance(target_source, amount)
                Notif(_source, 1, 'removed_balance', amount, target_name)
                StaffLogs(_source, target_source, Config.StaffCommands.Remove_Balance, amount)
            else
                Notif(_source, 3, 'player_not_online', amount, target_source)
            end
        else
            Notif(_source, 3, 'invalid_format')
        end
    else
        Notif(_source, 3, 'no_permissions')
    end
end)


--███╗   ██╗ ██████╗ ████████╗██╗███████╗██╗ ██████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
--████╗  ██║██╔═══██╗╚══██╔══╝██║██╔════╝██║██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
--██╔██╗ ██║██║   ██║   ██║   ██║█████╗  ██║██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
--██║╚██╗██║██║   ██║   ██║   ██║██╔══╝  ██║██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
--██║ ╚████║╚██████╔╝   ██║   ██║██║     ██║╚██████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
--╚═╝  ╚═══╝ ╚═════╝    ╚═╝   ╚═╝╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝


function Notification(source, notif_type, message)
    if notif_type and message then
        if Config.NotificationType.server == 'esx' then
            TriggerClientEvent('esx:showNotification', source, message)
        
        elseif Config.NotificationType.server == 'qbcore' then
            if notif_type == 1 then
                TriggerClientEvent('QBCore:Notify', source, message, 'success')
            elseif notif_type == 2 then
                TriggerClientEvent('QBCore:Notify', source, message, 'primary')
            elseif notif_type == 3 then
                TriggerClientEvent('QBCore:Notify', source, message, 'error')
            end
        
        elseif Config.NotificationType.server == 'mythic_old' then
            if notif_type == 1 then
                TriggerClientEvent('mythic_notify:client:SendAlert:custom', source, { type = 'success', text = message, length = 10000})
            elseif notif_type == 2 then
                TriggerClientEvent('mythic_notify:client:SendAlert:custom', source, { type = 'inform', text = message, length = 10000})
            elseif notif_type == 3 then
                TriggerClientEvent('mythic_notify:client:SendAlert:custom', source, { type = 'error', text = message, length = 10000})
            end

        elseif Config.NotificationType.server == 'mythic_new' then
            if notif_type == 1 then
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = message, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
            elseif notif_type == 2 then
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = message, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
            elseif notif_type == 3 then
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = message, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
            end

        elseif Config.NotificationType.server == 'chat' then
                TriggerClientEvent('chatMessage', source, message)

        elseif Config.NotificationType.server == 'other' then
            --add your own notification.

        end
    end
end


-- ██████╗ ████████╗██╗  ██╗███████╗██████╗ 
--██╔═══██╗╚══██╔══╝██║  ██║██╔════╝██╔══██╗
--██║   ██║   ██║   ███████║█████╗  ██████╔╝
--██║   ██║   ██║   ██╔══██║██╔══╝  ██╔══██╗
--╚██████╔╝   ██║   ██║  ██║███████╗██║  ██║
-- ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝


RegisterServerEvent('cd_donatorshop:DeleteVehicleADV')
AddEventHandler('cd_donatorshop:DeleteVehicleADV', function(net)
    TriggerClientEvent('cd_donatorshop:DeleteVehicleADV', source, net)
end)

RegisterServerEvent('cd_donatorshop:KickOutOfVehicle')
AddEventHandler('cd_donatorshop:KickOutOfVehicle', function(players)
    for c, d in pairs(players) do
        TriggerClientEvent('cd_donatorshop:KickOutOfVehicle', d)
    end
end)

function CrossCheck(name)
    for c, d in pairs(Config.Shop) do
        if name == d.Title then
            return d
        end
    end
end

function GetUserInfoTable_UI(source)
    --These are the player identifiers we will display on the shop UI. You can remove the ones you don't want to display.
    local self = {}
    for c, d in ipairs(GetPlayerIdentifiers(source)) do
        if string.match(d, 'steam:') then
            self[#self+1] = {name = L('steam'), value = d:sub(7)}
        elseif string.match(d, 'license:') then
            self[#self+1] = {name = L('license'), value = d:sub(9)}
        elseif string.match(d, 'xbl:') then
            self[#self+1] = {name = L('xbl'), value = d:sub(5)}
        elseif string.match(d, 'live:') then
            self[#self+1] = {name = L('live'), value = d:sub(6)}
        elseif string.match(d, 'discord:') then
            self[#self+1] = {name = L('discord'), value = d:sub(9)}
        elseif string.match(d, 'fivem:') then
            self[#self+1] = {name = L('fivem'), value = d:sub(7)}
        --elseif string.match(d, 'ip:') then
            --self[#self+1] = {name = L('ip'), value = d:sub(R(4))}
        end
    end
    return self
end