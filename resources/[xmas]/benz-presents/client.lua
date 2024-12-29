local QBCore = exports['qb-core']:GetCoreObject()
	
local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local PropsDetected = {}
local Cooldowns = {}


function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 75)
end

CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local objects = GetGamePool("CObject")

        PropsDetected = {}

        for _, obj in pairs(objects) do
            if GetEntityModel(obj) == GetHashKey("prop_xmas_tree_int") then
                local objCoords = GetEntityCoords(obj)
                if #(playerCoords - objCoords) < 6.0 then
                    table.insert(PropsDetected, { obj = obj, coords = objCoords })
                end
            end
        end

        Wait(1000)
    end
end)


CreateThread(function()
    local notify
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local nearProp = false

        for _, prop in pairs(PropsDetected) do
            if #(playerCoords - prop.coords) < 6.0 then
                nearProp = true

                if not notify then
                    if Config.NotificationType == "cd_drawtextui" then
                        notify = true 
                        DrawText3D(prop.coords.x, prop.coords.y, prop.coords.z, "~r~[E]~w~ Check Christmas Tree")
                    end
                end

                if IsControlJustReleased(0, 38) then
                    QBCore.Functions.TriggerCallback('checkCooldown', function(isOnCooldown, remainingTime)
                        if isOnCooldown then
                            QBCore.Functions.Notify("You are on cooldown. Remaining time: " .. remainingTime .. " seconds.", "error")
                        else
                            TriggerServerEvent('applyCooldown')
                            TriggerEvent('benz-presents:checkProp', prop.obj)
                        end
                    end)
                end
            else
                if notify then
                    if Config.NotificationType == "cd_drawtextui" then
                    end
                    notify = nil
                end
            end
        end

        Wait(10)
    end
end)

RegisterNetEvent('benz-presents:checkProp', function(prop)
    local playerPed = PlayerPedId() 
    local playerCoords = GetEntityCoords(playerPed)
    notify = nil

    local crouchAnimDict = "move_crouch_proto"
    local crouchAnimName = "idle"

    RequestAnimDict(crouchAnimDict)
    while not HasAnimDictLoaded(crouchAnimDict) do
        Wait(10)
    end

    TaskPlayAnim(playerPed, crouchAnimDict, crouchAnimName, 8.0, -8.0, -1, 2, 0, false, false, false)

    Wait(100) 

    local animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
    local animName = "machinic_loop_mechandplayer"

    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Wait(10)
    end

    TaskPlayAnim(playerPed, animDict, animName, 8.0, -8.0, -1, 49, 0, false, false, false)

    TriggerEvent('InteractSound_CL:PlayOnOne', 'sound_touch_tree_crhistmas', 0.9)

    QBCore.Functions.Progressbar("checking_gifts", "Checking Gifts...", 8000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() 
        TriggerServerEvent('benz-presents:giveGift') 
    end, function() 
        QBCore.Functions.Notify("Canceled.", "error")
    end)
end)

RegisterNetEvent('benz-presents:abriendoregalo', function()
    local playerPed = PlayerPedId() 
    local playerCoords = GetEntityCoords(playerPed) 
    local propName = "bzzz_xmas23_convert_tree_gift"
    local prop = nil 

    
    local xOffset, yOffset, zOffset = -0.35, 0.7, -0.3
    local xRot, yRot, zRot = 0, 0, 96.0
    local boneIndex = 0 
    local forwardVector = GetEntityForwardVector(playerPed) 
    local spawnCoords = playerCoords + (forwardVector * 0.5) 

    RequestModel(propName)
    while not HasModelLoaded(propName) do
        Wait(10)
    end

    prop = CreateObject(GetHashKey(propName), spawnCoords.x + xOffset, spawnCoords.y + yOffset, spawnCoords.z + zOffset, true, true, false)
    AttachEntityToEntity(prop, playerPed, boneIndex, xOffset, yOffset, zOffset, xRot, yRot, zRot, false, false, true, false, 2, true)


    local crouchAnimDict = "move_crouch_proto"
    local crouchAnimName = "idle"

    RequestAnimDict(crouchAnimDict)
    while not HasAnimDictLoaded(crouchAnimDict) do
        Wait(10)
    end

    TaskPlayAnim(playerPed, crouchAnimDict, crouchAnimName, 8.0, -8.0, -1, 2, 0, false, false, false)

    Wait(100) 


    TriggerEvent('InteractSound_CL:PlayOnOne', 'sound_open_gift_chrms', 1.0)


    local animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
    local animName = "machinic_loop_mechandplayer"

    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Wait(10)
    end

    TaskPlayAnim(playerPed, animDict, animName, 8.0, -8.0, -1, 49, 0, false, false, false)



    QBCore.Functions.Progressbar("checking_gifts2", "Opening Gift....", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() 
        if DoesEntityExist(prop) then
            DeleteEntity(prop)
        end
        ClearPedTasks(playerPed) 
        TriggerServerEvent('benz-presents:giveGiftregalos') 
    end, function() 
        if DoesEntityExist(prop) then
            DeleteEntity(prop)
        end
        ClearPedTasks(playerPed)
        QBCore.Functions.Notify("Canceled.", "error")
    end)
end)