----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local TargetName = Config.CoreSettings.TargetName
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

--<!>-- NOTIFICATIONS --<!>--
-- Notifications
RegisterNetEvent('boii-weed:notify', function(msg,type)
    Core.Functions.Notify(msg,type)
end)
--<!>-- NOTIFICATIONS --<!>--

--<!>-- BLIPS --<!>--
CreateThread(function()
    for k, v in pairs(Config.Blips) do
        if v.useblip then
            v.blip = AddBlipForCoord(v['coords'].x, v['coords'].y, v['coords'].z)
            SetBlipSprite(v.blip, v.id)
            SetBlipDisplay(v.blip, 4)
            SetBlipScale(v.blip, v.scale)
            SetBlipColour(v.blip, v.colour)
            SetBlipAsShortRange(v.blip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(v.title)
            EndTextCommandSetBlipName(v.blip)
        end
    end
end)
--<!>-- BLIPS --<!>--

--<!>-- PEDS --<!>--
CreateThread(function()
    for k, v in pairs(Config.Peds) do
        RequestModel(GetHashKey(v.model))
        while not HasModelLoaded(GetHashKey(v.model)) do
            Wait(1)
        end
        CocainePeds = CreatePed(4, v.model, v['coords'].x, v['coords'].y, v['coords'].z-1, v['coords'].w, false, false)
        FreezeEntityPosition(CocainePeds, true)
        SetEntityInvincible(CocainePeds, true)
        SetBlockingOfNonTemporaryEvents(CocainePeds, true)
        TaskStartScenarioInPlace(CocainePeds, v.scenario, 0, true)
        exports[TargetName]:AddTargetModel(v.model, {
            options = {
                {   
                    icon = v.icon,
                    label = v.label,
                    event = v.event,
                    canInteract = function(entity)
                        if IsPedDeadOrDying(entity, true) or IsPedAPlayer(entity) or IsPedInAnyVehicle(PlayerPedId()) then return false end
                        return true
                    end,    
                },
            },
            distance = v.distance
        })
    end
end)
--<!>-- PEDS --<!>--

--<!>-- STORE --<!>--
RegisterNetEvent('boii-weed:cl:OpenShop', function()
    ShopItems = {}
    ShopItems.label = Language.Stores['smokeshopheader']
    ShopItems.items = Config.Stores.Weed.SmokeShop.Items
    ShopItems.slots = #Config.Stores.Weed.SmokeShop.Items
    lang = 'SmokeOnTheWater_' 
    TriggerServerEvent('inventory:server:OpenInventory', 'shop', lang, ShopItems)
end)
--<!>-- OPEN STORES END --<!>--

--<!>-- SMOKING --<!>--
RegisterNetEvent('boii-weed:cl:Smoke', function(itemname, armour, stress, timer)
    local player = PlayerPedId()
    Core.Functions.Progressbar('weed_smokejoints', Language.Smoking['smokejoint'], Config.Plants.Outdoor.Actions.Smoking.Time*1000, false, true,{
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = Config.Plants.Outdoor.Actions.Smoking.Animations.Dict,
        anim = Config.Plants.Outdoor.Actions.Smoking.Animations.Anim,
        flags = Config.Plants.Outdoor.Actions.Smoking.Animations.Flags,
    }, {
        model = Config.Plants.Outdoor.Actions.Smoking.Animations.Prop,
        bone = Config.Plants.Outdoor.Actions.Smoking.Animations.Bone,
        coords = Config.Plants.Outdoor.Actions.Smoking.Animations.Coords,
        rotation = Config.Plants.Outdoor.Actions.Smoking.Animations.Rotation,
    }, {}, function() 
        TriggerServerEvent('boii-weed:sv:RemoveItem', itemname, 1)
        AddArmourToPed(player, armour)
        TriggerServerEvent(RemoveStressEvent, stress)  
        if Config.Plants.Outdoor.Actions.Smoking.Effects then
            JointEffects(timer)
        end
        TriggerEvent('boii-weed:notify', Language.Smoking['smokedjoint'], 'success')
        ClearPedTasks(player)
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerEvent('boii-weed:notify', Language.Shared['cancelled'], 'primary')
        ClearPedTasks(player)
    end)
end)
--<!>-- SMOKING --<!>--

--<!>-- EFFECTS --<!>--
function JointEffects(timer)
    local ped = PlayerPedId()
    Wait(2000)
    SetTimecycleModifier("spectator9")
    SetPedMotionBlur(ped, true)           
    Wait(timer*60000)
    ClearTimecycleModifier()
    SetPedMotionBlur(ped, false)
end
--<!>-- EFFECTS --<!>--