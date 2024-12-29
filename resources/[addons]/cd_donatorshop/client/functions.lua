local LoadingDots = {}
LoadingDots.Dot, LoadingDots.Timer = '.', 0

function GetPlate(vehicle)
    if not vehicle then
        vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    end
    if Config.VehicleDatabasePlateType == 'with_spaces' then
        return tostring(GetVehicleNumberPlateText(vehicle))
    elseif Config.VehicleDatabasePlateType == 'without_spaces' then
        return Trim(GetVehicleNumberPlateText(vehicle))
    end
end

function GetCorrectPlateFormat(plate)
    if Config.VehicleDatabasePlateType == 'with_spaces' then
       return tostring(plate)
    elseif Config.VehicleDatabasePlateType == 'without_spaces' then
        return Trim(plate)
    end
end

RegisterNetEvent('cd_donatorshop:ToggleNUIFocus')
AddEventHandler('cd_donatorshop:ToggleNUIFocus', function()
    NUI_status = true
    while NUI_status do
        Wait(5)
        SetNuiFocus(NUI_status, NUI_status)
    end
    Wait(100)
    SetNuiFocus(false, false)
end)

RegisterNetEvent('cd_donatorshop:DisableControls')
AddEventHandler('cd_donatorshop:DisableControls', function(state)
    if state then
        DisableControls = true
    else
        DisableControls = false
    end
    LoadingDots.Timer = 0
    while DisableControls do
        Wait(0)
        DisableAllControlActions(0)
        SetNuiFocus(true, true)
        Draw2DText(L('purchasing_vehiclepack')..' '..AddWaitingDots())
    end
    Wait(100)
    SetNuiFocus(false, false)
end)

function AddWaitingDots()
    LoadingDots.Timer = LoadingDots.Timer+1
    if LoadingDots.Timer == 50 then
        if LoadingDots.Dot == '.' then
            LoadingDots.Dot = '..'
        elseif LoadingDots.Dot == '..' then
            LoadingDots.Dot = '...'
        elseif LoadingDots.Dot == '...' then
            LoadingDots.Dot = '.'
        end
        LoadingDots.Timer = 0
        return LoadingDots.Dot
    else
        return LoadingDots.Dot
    end
end

function Teleport(x, y, z, h)
    local ped = PlayerPedId()
    RequestCollisionAtCoord(x, y, z)
    while not HasCollisionLoadedAroundEntity(ped) do
        RequestCollisionAtCoord(x, y, z)
        Wait(1)
    end
    DoScreenFadeOut(950)
    Wait(1000)                            
    if IsPedInAnyVehicle(ped, true) then
        local vehicle = GetVehiclePedIsUsing(ped)
        SetEntityCoords(vehicle, x, y, z)
        SetEntityHeading(vehicle, h)
        CheckSpawnArea(vehicle, vector3(x, y, z))
    else
        SetEntityCoords(ped, x, y, z)
        SetEntityHeading(ped, h)
    end
    Wait(1000)
    DoScreenFadeIn(3000)
end

function CheckSpawnArea(veh, coords)
    local new_coords = coords
    local vehicle = GetClosestVehicle_single(new_coords, 3, veh)
    if vehicle then
        new_coords = new_coords + GetEntityForwardVector(veh) * 6.0
        SetEntityCoords(veh, new_coords.x, new_coords.y, new_coords.z)
    else
        new_coords = nil
        return
    end

    local vehicle = GetClosestVehicle_single(new_coords, 3, veh)
    if vehicle then
        new_coords = new_coords + GetEntityForwardVector(veh) * 6.0
        SetEntityCoords(veh, new_coords.x, new_coords.y, new_coords.z)
    else
        new_coords = nil
        return
    end

    local vehicle = GetClosestVehicle_single(new_coords, 3, veh)
    if vehicle then
        new_coords = new_coords + GetEntityForwardVector(veh) * 6.0
        SetEntityCoords(veh, new_coords.x, new_coords.y, new_coords.z)
    else
        new_coords = nil
        return
    end

    local vehicle = GetClosestVehicle_single(new_coords, 3, veh)
    if vehicle then
        new_coords = new_coords + GetEntityForwardVector(veh) * 6.0
        SetEntityCoords(veh, new_coords.x, new_coords.y, new_coords.z)
    else
        new_coords = nil
        return
    end
    new_coords = nil
end

function GetClosestVehicle_single(coords, distance, myveh)
    local vehicles = GetGamePool('CVehicle')
    for i=1, #vehicles, 1 do
        local vehicleCoords = GetEntityCoords(vehicles[i])
        local dist = #(coords-vehicleCoords)
        if dist < distance and vehicles[i] ~= myveh then
            return true
        end
    end
    return false
end

function GetBlipType(vehicle)
    local vehclass = GetVehicleClass(vehicle)
    local blip
    if vehclass == 8 then
        blip = 37
    else
        blip = 36
    end
    return blip
end

function DrawSpotlight(pos)
    local lightPos = vector3(pos.x,pos.y,pos.z + 5.0)
    local direction = pos - lightPos
    local normal = Normalize(direction)
    DrawSpotLight(lightPos.x,lightPos.y,lightPos.z, normal.x,normal.y,normal.z, 255,255,255, 100.0, 10.0, 0.0, 25.0, 1.0)
end

function Normalize(v)
    local len = Length(v)
    return vector3(v.x / len, v.y / len, v.z / len)
end

function Length(v)
    return math.sqrt( (v.x * v.x)+(v.y * v.y)+(v.z * v.z) )
end

function GetClosestVehicleData(coords, distance)
    local self = {}
    self.dist = distance
    self.state = false
    local vehicle = GetGamePool('CVehicle')
    for cd = 1, #vehicle, 1 do
        local vehcoords = GetEntityCoords(vehicle[cd])
        local dist = #(coords-vehcoords)
        if dist < self.dist then
            self.dist = dist
            self.vehicle = vehicle[cd]
            self.coords = vehcoords
            self.state = true
        end
    end
    self.dist = nil
    return self
end

function GetPerformanceStats(vehicle)
    local data = {}
    data.acceleration = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fInitialDriveForce')
    data.brakes = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fBrakeForce')
    local topspeed1 = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fInitialDriveMaxFlatVel')
    local topspeed2 = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fInitialDragCoeff')
    data.topspeed = math.ceil(CalculateTopSpeed(topspeed1, topspeed2))
    local handling1 = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fTractionBiasFront')
    local handling2 = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fTractionCurveMax')
    local handling3 = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fTractionCurveMin')
    data.handling = CalculateHandling(handling1, handling2, handling3)
    return data
end

function CalculateTopSpeed(topspeed1, topspeed2)
    local calc = 1.3
    if topspeed2 >= 1.5 then
        calc = 0.9
    elseif topspeed2 >= 1.0 then
        calc = 1.0 
    elseif topspeed2 >= 0.5 then
        calc = 1.1 
    elseif topspeed2 >= 0.1 then
        calc = 1.2
    end
    return ((topspeed1*calc)*1.1)
end

function CalculateHandling(handling1, handling2, handling3)
    local calc = (handling1+handling2)
    return (calc*handling3)
end

function GetVehicleLabel_model(model)
    if Config.Framework == 'esx' or Config.Framework == 'other' then
        local vehicleLabel = string.lower(GetDisplayNameFromVehicleModel(model))
        
        if vehicleLabel == 'null' or vehicleLabel == 'carnotfound' or vehicleLabel == 'NULL' then
            return {label = L('vehicle')}
        end
        if vehicleLabel ~= 'null' or vehicleLabel ~= 'carnotfound' or vehicleLabel ~= 'NULL'then
            local text = GetLabelText(vehicleLabel)
            if text == nil or text == 'null' or text == 'NULL' then
                return {label = vehicleLabel}
            else
                return {label = text}
            end
        end
        return {label = vehicleLabel}

    elseif Config.Framework == 'qbcore' then
        for c, d in pairs(QBCore.Shared.Vehicles) do
            if type(d.hash) == 'string' then
                d.hash = tonumber(d.hash) or GetHashKey(d.hash)
            end
            if d.hash == model then
                return {label = d.name, model = d.model}
            end
        end
        return {label = 'unknown', model = 'unknown'}
    end
end

function GetVehicleProperties(vehicle)
    if DoesEntityExist(vehicle) then
        local props
        if Config.Framework == 'esx' then
            props = ESX.Game.GetVehicleProperties(vehicle)
        elseif Config.Framework == 'qbcore' then
            props = QBCore.Functions.GetVehicleProperties(vehicle)
        elseif Config.Framework == 'other' then
            props = GetVehicleProps_OTHER(vehicle)
        end
        props.plate = GetCorrectPlateFormat(props.plate)
        return props
    end
end

function LoadModel(model)
    LoadingDots.Timer = 0
    if not HasModelLoaded(model) and IsModelInCdimage(model) then
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(0)
            Draw2DText(L('loading_model')..' : '..GetVehicleLabel_model(model).label..' '..AddWaitingDots())
        end
    end
end

function RegisterEntity(vehicle)
    local timeout = 0
    LoadingDots.Timer = 0
    while not DoesEntityExist(vehicle) and timeout <= 1000 do 
        Wait(0)
        Draw2DText(L('registering_entity')..' '..AddWaitingDots())
    end
    if not DoesEntityExist(vehicle) then
        CD_DeleteVehicle(vehicle)
        Notif(3, 'registering_entity_failed')
    end
end

function RequestNetworkControl(vehicle)
    local timeout = 0
    LoadingDots.Timer = 0
    while not NetworkHasControlOfEntity(vehicle) and timeout <= 1000 do 
        Wait(0)
        NetworkRequestControlOfEntity(vehicle)
        Draw2DText(L('registering_network')..' '..AddWaitingDots())
    end
    if not NetworkHasControlOfEntity(vehicle) then
        CD_DeleteVehicle(vehicle)
        Notif(3, 'registering_network_failed')
    end
end

function RegisterEntityNetworked(vehicle)
    local timeout = 0
    LoadingDots.Timer = 0
    while not NetworkGetEntityIsNetworked(vehicle) and timeout <= 1000 do 
        Wait(0)
        NetworkRegisterEntityAsNetworked(vehicle)
        Draw2DText(L('registering_entitynetwork')..' '..AddWaitingDots())
    end
    if not NetworkGetEntityIsNetworked(vehicle) then
        CD_DeleteVehicle(vehicle)
        Notif(3, 'registering_entitynetwork_failed')
    end     
end

function RequestNetworkId(vehicle)
    local timeout = 0
    LoadingDots.Timer = 0
    local netID = NetworkGetNetworkIdFromEntity(vehicle)
    while not NetworkHasControlOfNetworkId(netID) and timeout <= 1000 do 
        Wait(0)
        NetworkRequestControlOfNetworkId(netID)
        Draw2DText(L('requesting_netid')..AddWaitingDots())
    end
end

function Draw2DText(text)
    SetTextFont(4)
    SetTextScale(0.0, 0.4)
    SetTextColour(255, 255, 255, 150)
    SetTextCentre(true)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(0.5, 0.9)
end

function RequestCollision(coords, vehicle)
    RequestCollisionAtCoord(coords.x, coords.y, coords.z)
    while not HasCollisionLoadedAroundEntity(vehicle) do
        RequestCollisionAtCoord(coords.x, coords.y, coords.z)
        Wait(0)
    end
end

function CD_DeleteVehicle(vehicle, kickout)
    if vehicle ~= nil then
        if not DoesEntityExist(vehicle) then
            Notif(3, 'entity_doesnot_exist')
            return
        end
        if kickout then
            TriggerServerEvent('cd_donatorshop:KickOutOfVehicle', GetPlayersInVehicle(vehicle))
            Wait(1000)
        end
        RequestNetworkControl(vehicle)
        RequestNetworkId(vehicle)
        if NetworkHasControlOfEntity(vehicle) then
            SetEntityAsMissionEntity(vehicle)
            SetVehicleHasBeenOwnedByPlayer(vehicle, true)
            Wait(100)
            SetEntityAsNoLongerNeeded(vehicle)
            DeleteEntity(vehicle)
            DeleteVehicle(vehicle)
        else
            TriggerServerEvent('cd_donatorshop:DeleteVehicleADV', NetworkGetNetworkIdFromEntity(vehicle))
        end
    end
end

function GetPlayersInVehicle(vehicle)
    local temp_table = {}
    local vehicle_coords = GetEntityCoords(vehicle)
    for c, d in pairs(GetActivePlayers()) do
        local targetped = GetPlayerPed(d)
        local dist = #(vehicle_coords-GetEntityCoords(vehicle))
        if dist < 10 then
            local ped_vehicle = GetVehiclePedIsIn(targetped)
            if ped_vehicle == vehicle then
                table.insert(temp_table, GetPlayerServerId(d))  
            end
        end
    end
    return temp_table
end

RegisterNetEvent('cd_donatorshop:KickOutOfVehicle')
AddEventHandler('cd_donatorshop:KickOutOfVehicle', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    SetEntityCoords(ped, coords.x, coords.y, coords.z+5)
    if IsPedInAnyVehicle(ped, true) then
        CD_DeleteVehicle(GetVehiclePedIsUsing(ped))
    end
end)

RegisterNetEvent('cd_donatorshop:DeleteVehicleExploitAttempt')
AddEventHandler('cd_donatorshop:DeleteVehicleExploitAttempt', function()
    CD_DeleteVehicle(GetVehiclePedIsIn(PlayerPedId(), false))
end)

RegisterNetEvent('cd_donatorshop:DeleteVehicleADV')
AddEventHandler('cd_donatorshop:DeleteVehicleADV', function(net)
    local entity = NetworkGetEntityFromNetworkId(net)
    if NetworkHasControlOfEntity(entity) then
        SetEntityAsNoLongerNeeded(entity)
        Wait(100)
        Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(entity))
        DeleteEntity(entity)
        DeleteVehicle(entity)
    else
        Notif(3, 'no_control_netid')
    end
end)

local function SetVehicleMaxMods(vehicle)
    SetVehicleModKit(vehicle, 0)
    SetVehicleMod(vehicle, 11, 3, false)--engine
    SetVehicleMod(vehicle, 12, 2, false)--brakes
    SetVehicleMod(vehicle, 13, 2, false)--transmission
    SetVehicleMod(vehicle, 15, 2, false)--suspension
    SetVehicleMod(vehicle, 16, 4, false)--armor
    ToggleVehicleMod(vehicle,  18, true)--turbo
end

function SpawnVehicle(data)
    if not IsModelValid(data.Model) then
        return Notif(3, 'invalid_model')
    end
    LoadModel(data.Model)
    if HasModelLoaded(data.Model) then
        local vehicle = CreateVehicle(data.Model, Config.VehiclePurchaseCoords.x, Config.VehiclePurchaseCoords.y, Config.VehiclePurchaseCoords.z, Config.VehiclePurchaseCoords.w, true, false)
        local ped = PlayerPedId()
        RegisterEntity(vehicle)

        NetworkFadeInEntity(vehicle, true, true)
        SetVehicleOnGroundProperly(vehicle)

        RequestNetworkControl(vehicle)
        RegisterEntityNetworked(vehicle)

        SetVehicleHasBeenOwnedByPlayer(vehicle, true)
        SetVehicleNeedsToBeHotwired(vehicle, false)
        SetEntityAsMissionEntity(vehicle, true, false)
        local netID = NetworkGetNetworkIdFromEntity(vehicle)
        SetNetworkIdCanMigrate(netID, true)
        SetNetworkIdExistsOnAllMachines(netID, true)
        SetPedIntoVehicle(ped, vehicle, -1)
        SetVehicleDirtLevel(vehicle)
        WashDecalsFromVehicle(vehicle, 1.0)
        NetworkRequestControlOfEntity(vehicle)
        SetModelAsNoLongerNeeded(data.Model)

        RequestCollision(vector3(Config.VehiclePurchaseCoords.x, Config.VehiclePurchaseCoords.y, Config.VehiclePurchaseCoords.z), vehicle)

        SetVehRadioStation(vehicle, 'OFF')
        NetworkFadeInEntity(vehicle, true, true)

        CheckSpawnArea(vehicle, vector3(Config.VehiclePurchaseCoords.x, Config.VehiclePurchaseCoords.y, Config.VehiclePurchaseCoords.z))
        VehicleSpawned(vehicle, GetPlate(vehicle))
        return vehicle
    end
end

local testdrive_active = false
local function StartTestDrive(data, coords, heading)
    if Config.VehicleTest.ENABLE then
        if not Config.VehicleTest.check_balance or (Config.VehicleTest.check_balance and Callback(data.config.Cost)) then
            data.Model = data.model
            local vehicle = SpawnVehicle(data)
            local timer = Config.VehicleTest.timer
            Notif(2, 'testdrive_started', timer)
            if Config.VehicleTest.spawn_max then SetVehicleMaxMods(vehicle) end

            while timer > 0 do
                Wait(1000)
                timer = timer-1
                local current_vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                if current_vehicle ~= vehicle then
                    timer = 0
                end
            end

            testdrive_active = false
            Teleport(coords.x, coords.y, coords.z, heading)
            CD_DeleteVehicle(vehicle, true)
        elseif Config.VehicleTest.check_balance then
            Notif(2, 'testdrive_nocredits')
        end
    end
end


RegisterNetEvent('cd_donatorshop:StartThread_1')
AddEventHandler('cd_donatorshop:StartThread_1', function()
    while VehicleTable ~= nil do
        Wait(0)
        if not DisablePurchase and not testdrive_active then
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped, 1)
            local vehicle = GetClosestVehicleData(coords, 5.1)
            if vehicle.state and not Purchasedvehicle and VehicleTable then
                for cd = 1, #VehicleTable do
                    if VehicleTable and VehicleTable[cd] and VehicleTable[cd].vehicle and VehicleTable[cd].vehicle == vehicle.vehicle then
                        DrawSpotlight(vehicle.coords)
                        if IsControlJustReleased(0, 38) then
                            keypressed_count = keypressed_count+1
                            if keypressed_count == 2 then
                                ConfirmPurchaseVehicle(Config.Vehicles[cd])
                                Wait(1000)
                                keypressed_count = 0
                            elseif keypressed_count == 1 then
                                ConfirmInsideShop_UI()
                            end
                        elseif IsControlJustReleased(0, 47) then
                            HideInsideShop_UI()
                            StartTestDrive(VehicleTable[cd], coords, GetEntityHeading(ped))
                        end
                    end
                end
            end
        end
    end
end)

local lastvehicle = nil
RegisterNetEvent('cd_donatorshop:StartThread_2')
AddEventHandler('cd_donatorshop:StartThread_2', function()
    while VehicleTable ~= nil do
        Wait(100)
        if not DisablePurchase and not testdrive_active then
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped, 1)
            local vehicle = GetClosestVehicleData(coords, 5.1)
            if vehicle.state and not Purchasedvehicle and VehicleTable ~= nil then
                for cd = 1, #VehicleTable do
                    if VehicleTable and VehicleTable[cd] and VehicleTable[cd].vehicle and VehicleTable[cd].vehicle == vehicle.vehicle and lastvehicle ~= vehicle.vehicle then
                        ShowInsideShop_UI(VehicleTable[cd])
                    elseif lastvehicle ~= vehicle.vehicle then
                        keypressed_count = 0
                    end
                end
            else
                HideInsideShop_UI()
            end
            lastvehicle = vehicle.vehicle
        end
    end
end)

RegisterNetEvent('cd_donatorshop:ChangePlate')
AddEventHandler('cd_donatorshop:ChangePlate', function(plate)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    local plate = GetCorrectPlateFormat(plate)
    SetVehicleNumberPlateText(vehicle, plate)
    VehicleSpawned(vehicle, plate)
end)

RegisterNetEvent('cd_donatorshop:VehiclePackPurchased')
AddEventHandler('cd_donatorshop:VehiclePackPurchased', function(model, pack_purchased, cd, last_vehicle)
    Wait(2000)
    local self = {}
    self.Model = model
    ConfirmPurchaseVehicle(self, pack_purchased, cd)
    if not last_vehicle then
        local vehicle = GetVehiclePedIsIn(PlayerPedId())
        CD_DeleteVehicle(vehicle)
    end
end)

CreateThread(function()
    while not Authorised do Wait(1000) end
    local prop_hash = GetHashKey(Config.Prop.Model)
    while not HasModelLoaded(prop_hash) do
        RequestModel(prop_hash)
        Wait(5)
    end

    SpawnedProp = CreateObject(prop_hash, Config.Prop.Coords.x, Config.Prop.Coords.y, Config.Prop.Coords.z, false)
    SetEntityHeading(SpawnedProp, Config.Prop.Coords.w)
    SetEntityAsMissionEntity(SpawnedProp, true, true)
    Wait(1000)
    PlaceObjectOnGroundProperly(SpawnedProp)
    FreezeEntityPosition(SpawnedProp, true)
end)