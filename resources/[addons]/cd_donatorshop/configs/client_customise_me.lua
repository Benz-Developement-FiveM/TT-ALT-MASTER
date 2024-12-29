--███████╗██████╗  █████╗ ███╗   ███╗███████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
--██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
--█████╗  ██████╔╝███████║██╔████╔██║█████╗  ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ 
--██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║   ██║██╔══██╗██╔═██╗ 
--██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
--╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝


ESX, QBCore = nil, nil

CreateThread(function()
    if Config.Framework == 'esx' then
        while ESX == nil do
            TriggerEvent(Config.FrameworkTriggers.main, function(obj) ESX = obj end)
            if ESX == nil then
                ESX = exports[Config.FrameworkTriggers.resource_name]:getSharedObject()
            end
            Wait(100)
        end

        RegisterNetEvent(Config.FrameworkTriggers.load)
        AddEventHandler(Config.FrameworkTriggers.load, function(xPlayer)
            ESX.PlayerData = xPlayer
        end)

        RegisterNetEvent(Config.FrameworkTriggers.job)
        AddEventHandler(Config.FrameworkTriggers.job, function(job)
            ESX.PlayerData.job = job
        end)
    

    elseif Config.Framework == 'qbcore' then
        while QBCore == nil do
            TriggerEvent(Config.FrameworkTriggers.main, function(obj) QBCore = obj end)
            if QBCore == nil then
                QBCore = exports[Config.FrameworkTriggers.resource_name]:GetCoreObject()
            end
            Wait(100)
        end

        RegisterNetEvent(Config.FrameworkTriggers.load)
        AddEventHandler(Config.FrameworkTriggers.load, function()

        end)

        RegisterNetEvent(Config.FrameworkTriggers.job)
        AddEventHandler(Config.FrameworkTriggers.job, function(JobInfo)
            QBCore.Functions.GetPlayerData().job = JobInfo
        end)

    end
end)


--███╗   ███╗ █████╗ ██╗███╗   ██╗    ████████╗██╗  ██╗██████╗ ███████╗ █████╗ ██████╗ 
--████╗ ████║██╔══██╗██║████╗  ██║    ╚══██╔══╝██║  ██║██╔══██╗██╔════╝██╔══██╗██╔══██╗
--██╔████╔██║███████║██║██╔██╗ ██║       ██║   ███████║██████╔╝█████╗  ███████║██║  ██║
--██║╚██╔╝██║██╔══██║██║██║╚██╗██║       ██║   ██╔══██║██╔══██╗██╔══╝  ██╔══██║██║  ██║
--██║ ╚═╝ ██║██║  ██║██║██║ ╚████║       ██║   ██║  ██║██║  ██║███████╗██║  ██║██████╔╝
--╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝       ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═════╝ 


CreateThread(function()
    local alreadyEnteredZone = false
    local GlobalText = nil
    local GlobalText_last = nil
    while true do
        wait = 5
        local ped = PlayerPedId()
        local inZone = false
        if not DisablePurchase then
            for cd = 1, #Config.Locations do
                local self = Config.Locations[cd]
                local dist = #(GetEntityCoords(ped)-vector3(self.x, self.y, self.z))
                if dist <= self.Distance then
                    wait = 5
                    inZone  = true
                    GlobalText = self.Text
                    if IsControlJustReleased(0, 38) then
                        TriggerEvent(self.EventName, false)
                        Wait(1000)
                    end
                    break
                else
                    wait = 2000
                end
            end

            if inZone and not alreadyEnteredZone then
                alreadyEnteredZone = true
                TriggerEvent('cd_drawtextui:ShowUI', 'show', GlobalText)
            end

            if GlobalText_last ~= GlobalText then
                TriggerEvent('cd_drawtextui:ShowUI', 'show', GlobalText)
            end

            if not inZone and alreadyEnteredZone then
                alreadyEnteredZone = false
                TriggerEvent('cd_drawtextui:HideUI')
            end
            GlobalText_last = GlobalText
        end
        Wait(wait)
    end
end)


--██╗   ██╗███████╗██╗  ██╗██╗ ██████╗██╗     ███████╗    ██████╗ ███████╗██╗      █████╗ ████████╗███████╗██████╗ 
--██║   ██║██╔════╝██║  ██║██║██╔════╝██║     ██╔════╝    ██╔══██╗██╔════╝██║     ██╔══██╗╚══██╔══╝██╔════╝██╔══██╗
--██║   ██║█████╗  ███████║██║██║     ██║     █████╗      ██████╔╝█████╗  ██║     ███████║   ██║   █████╗  ██║  ██║
--╚██╗ ██╔╝██╔══╝  ██╔══██║██║██║     ██║     ██╔══╝      ██╔══██╗██╔══╝  ██║     ██╔══██║   ██║   ██╔══╝  ██║  ██║
-- ╚████╔╝ ███████╗██║  ██║██║╚██████╗███████╗███████╗    ██║  ██║███████╗███████╗██║  ██║   ██║   ███████╗██████╔╝
--  ╚═══╝  ╚══════╝╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝╚══════╝    ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═════╝ 


function ConfirmPurchaseVehicle(data, pack_purchased, cd)
    DisablePurchase = true
    if (pack_purchased ~= nil and cd ~= nil) or Callback(data.Cost) then
        local vehicle = SpawnVehicle(data)
        local props = GetVehicleProperties(vehicle)
        local garage_type = 'NULL'
        if GetResourceState('cd_garage') == 'started' then
            garage_type = exports['cd_garage']:GetGarageType(vehicle)
        end
        TriggerServerEvent('cd_donatorshop:Purchase_Vehicle', data, props, garage_type, GetVehicleLabel_model(props.model), pack_purchased, cd)
        DisablePurchase = false
    else
        DisablePurchase = false
        Notif(3, 'not_enough_credits')
    end
end

function VehicleSpawned(vehicle, plate) --This will be triggered when you spawn a vehicle or you buy a plate change, you can add extra events here.
    if GetResourceState('cd_garage') == 'started' then
        local cd_garage_config = exports['cd_garage']:GetConfig()
        if cd_garage_config.VehicleKeys.ENABLE then
            TriggerEvent('cd_garage:AddKeys', plate)
            return
        end
    end

    if Config.Framework == 'esx' then
        --Add your own code here.
        
    elseif Config.Framework == 'qbcore' then
        TriggerEvent('vehiclekeys:client:SetOwner', plate)
    end
end


-- ██████╗██╗  ██╗ █████╗ ████████╗     ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗
--██╔════╝██║  ██║██╔══██╗╚══██╔══╝    ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝
--██║     ███████║███████║   ██║       ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║███████╗
--██║     ██╔══██║██╔══██║   ██║       ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║╚════██║
--╚██████╗██║  ██║██║  ██║   ██║       ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████║
-- ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝        ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝


TriggerEvent('chat:addSuggestion', '/'..Config.RedeemCommand, L('redeem_description'), {{ name=L('enter_tebex_id_1'), help=L('enter_tebex_id_2')}})
TriggerEvent('chat:addSuggestion', '/'..Config.StaffCommands.Add_Balance, L('addbalance_description'), {{ name=L('playerid_1'), help=L('playerid_2')}, { name=L('amount_1'), help=L('amount_2_add')}})
TriggerEvent('chat:addSuggestion', '/'..Config.StaffCommands.Remove_Balance, L('removebalance_description'), {{ name=L('playerid_1'), help=L('playerid_2')}, { name=L('amount_1'), help=L('amount_2_remove')}})


--███╗   ██╗ ██████╗ ████████╗██╗███████╗██╗ ██████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
--████╗  ██║██╔═══██╗╚══██╔══╝██║██╔════╝██║██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
--██╔██╗ ██║██║   ██║   ██║   ██║█████╗  ██║██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
--██║╚██╗██║██║   ██║   ██║   ██║██╔══╝  ██║██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
--██║ ╚████║╚██████╔╝   ██║   ██║██║     ██║╚██████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
--╚═╝  ╚═══╝ ╚═════╝    ╚═╝   ╚═╝╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝


function Notification(notif_type, message)
    if notif_type and message then
        if Config.NotificationType.client == 'esx' then
            ESX.ShowNotification(message)
        
        elseif Config.NotificationType.client == 'qbcore' then
            if notif_type == 1 then
                QBCore.Functions.Notify(message, 'success')
            elseif notif_type == 2 then
                QBCore.Functions.Notify(message, 'primary')
            elseif notif_type == 3 then
                QBCore.Functions.Notify(message, 'error')
            end

        elseif Config.NotificationType.client == 'mythic_old' then
            if notif_type == 1 then
                exports['mythic_notify']:DoCustomHudText('success', message, 10000)
            elseif notif_type == 2 then
                exports['mythic_notify']:DoCustomHudText('inform', message, 10000)
            elseif notif_type == 3 then
                exports['mythic_notify']:DoCustomHudText('error', message, 10000)
            end

        elseif Config.NotificationType.client == 'mythic_new' then
            if notif_type == 1 then
                exports['mythic_notify']:SendAlert('success', message, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
            elseif notif_type == 2 then
                exports['mythic_notify']:SendAlert('inform', message, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
            elseif notif_type == 3 then
                exports['mythic_notify']:SendAlert('error', message, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
            end

        elseif Config.NotificationType.client == 'chat' then
            TriggerEvent('chatMessage', message)
            
        elseif Config.NotificationType.client == 'other' then
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


CreateThread(function()
    local blip = AddBlipForCoord(Config.Locations[1].x, Config.Locations[1].y, Config.Locations[1].z)
    SetBlipSprite (blip, 108)
    SetBlipDisplay(blip, 4)
    SetBlipScale  (blip, 0.7)
    SetBlipColour (blip, 2)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(L('donator_shop'))
    EndTextCommandSetBlipName(blip)
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        TriggerEvent('cd_drawtextui:HideUI')
        SetModelAsNoLongerNeeded(SpawnedProp)
        DeleteEntity(SpawnedProp)
        if VehicleTable ~= nil then
            for cd=1, #VehicleTable do
                if VehicleTable[cd] and VehicleTable[cd].vehicle then
                    SetEntityAsNoLongerNeeded(VehicleTable[cd].vehicle)
                    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(VehicleTable[cd].vehicle))
                    DeleteEntity(VehicleTable[cd].vehicle)
                    DeleteVehicle(VehicleTable[cd].vehicle)
                end
            end
        end
        SetNuiFocus(false, false)
    end
end)