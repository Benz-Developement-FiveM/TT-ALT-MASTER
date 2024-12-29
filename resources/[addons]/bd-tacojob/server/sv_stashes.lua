local QBCore = exports['qb-core']:GetCoreObject()
local ox_inventory = exports.ox_inventory

if Config.InventorySystem == 'ox' then
    ----- | FRONT COUNTER | -----
    RegisterNetEvent('ox:frontTray', function()
        ox_inventory:RegisterStash('frontTray', 'Counter', 5, 5000, true)
    end)
    ----- | JOB FRIDGE | -----
    RegisterNetEvent('ox:jobFridge', function()
        ox_inventory:RegisterStash('jobFridge', 'Fridge', 25, 50000, true)
    end)
    ----- | JOB STORAGE | -----
    RegisterNetEvent('ox:jobStorage', function()
        ox_inventory:RegisterStash('jobStorage', 'Storage', 50, 85000, true)
    end)
    ----- | SHOP | -----
    exports.ox_inventory:RegisterShop('thshop', {
    name = 'Tacohut Shop',
    inventory = Config.Items
})
elseif Config.InventorySystem == 'qb' then
    ----- | FRONT COUNTER | -----
    RegisterNetEvent('bd-tacojob:server:frontTray1', function(frontTray1)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        local stashName = 'TacoHuts Counter'
    
        if Player then
            exports['qb-inventory']:OpenInventory(src, stashName, {
                maxweight = 50000,
                slots = 15,
            })
        end
    end)
    ----- | JOB FRIDGE | -----
    RegisterNetEvent('bd-tacojob:server:jobFridge', function(jobFridge)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        local stashName = 'TacoHuts Fridge'
    
        if Player then
            exports['qb-inventory']:OpenInventory(src, stashName, {
                maxweight = 750000,
                slots = 50,
            })
        end
    end)
    ----- | JOB STORAGE | -----
    RegisterNetEvent('bd-tacojob:server:jobStorage', function(jobFridge)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        local stashName = 'TacoHuts Storage'
    
        if Player then
            exports['qb-inventory']:OpenInventory(src, stashName, {
                maxweight = 1000000,
                slots = 75,
            })
        end
    end)
    ----- | CREATING SHOP | ----
    RegisterNetEvent('bd-tacojob:server:ingredientShop', function(name)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        local playerCoords = GetEntityCoords(playerPed)
        exports['qb-inventory']:CreateShop({
            name = 'ingredientShop',
            label = 'Taco Huts Shop',
            slots = 20,
            items = Config.Items
        })
    
        if Player then
            exports['qb-inventory']:OpenShop(source, 'ingredientShop')
        end
    end)
end
