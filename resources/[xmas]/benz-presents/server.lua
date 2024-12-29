local QBCore = exports['qb-core']:GetCoreObject()
local cooldowns = {}


RegisterNetEvent('benz-presents:giveGift', function()
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    local gift = Config.GiftItems[math.random(#Config.GiftItems)] 

if gift then
    xPlayer.Functions.AddItem(gift.item, gift.amount)
    TriggerClientEvent('QBCore:Notify', src, "You received " .. gift.amount .. "x " .. gift.item .. " as a gift.", "success")
else
    TriggerClientEvent('QBCore:Notify', src, "No gifts available.", "error")
end
end)



QBCore.Functions.CreateCallback('checkCooldown', function(source, cb)
    local playerId = source
    if cooldowns[playerId] then
        local remainingTime = cooldowns[playerId] - os.time()
        if remainingTime > 0 then
            cb(true, remainingTime) 
            return
        else
            cooldowns[playerId] = nil 
        end
    end
    cb(false) 
end)


RegisterNetEvent('applyCooldown', function()
    local playerId = source
    cooldowns[playerId] = os.time() + Config.CooldownTime
end)




QBCore.Functions.CreateUseableItem('gift', function(source)
    local ply = QBCore.Functions.GetPlayer(source)

    TriggerClientEvent("benz-presents:abriendoregalo", source)
	ply.Functions.RemoveItem("gift", 1)
end)

QBCore.Functions.CreateUseableItem('gift2', function(source)
    local ply = QBCore.Functions.GetPlayer(source)

    
    TriggerClientEvent("benz-presents:abriendoregalo", source)
	ply.Functions.RemoveItem("gift2", 1)
end)

QBCore.Functions.CreateUseableItem('gift3', function(source)
    local ply = QBCore.Functions.GetPlayer(source)


    TriggerClientEvent("benz-presents:abriendoregalo", source)
	ply.Functions.RemoveItem("gift3", 1)
end)

QBCore.Functions.CreateUseableItem('gift4', function(source)
    local ply = QBCore.Functions.GetPlayer(source)

    TriggerClientEvent("benz-presents:abriendoregalo", source)
	ply.Functions.RemoveItem("gift4", 1)
end)


RegisterNetEvent('benz-presents:giveGiftregalos', function()
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    local gift2 = Config.GiftItems_reward[math.random(#Config.GiftItems_reward)] 

if gift2 then
    xPlayer.Functions.AddItem(gift2.item, gift2.amount)
    TriggerClientEvent('QBCore:Notify', src, "You received " .. gift2.amount .. "x " .. gift2.item .. " as a gift.", "success")
else
    TriggerClientEvent('QBCore:Notify', src, "There is no gift.", "error")
end
end)