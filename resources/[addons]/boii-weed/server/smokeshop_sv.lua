----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

-- Event
RegisterServerEvent('boii-weed:sv:SellBags', function(args) 
	local source = source
    local pData = Core.Functions.GetPlayer(source)
    local MoneyType = Config.Stores.Weed.SmokeShop.MoneyType
    local CashItem = Config.Stores.Weed.SmokeShop.CashItem
	local args = tonumber(args)
    weedbag = ''
    if args == 1 then
        weedbag =  'weed_skunk'
	elseif args == 2 then
        weedbag =  'weed_og-kush'
    elseif args == 3 then
        weedbag =  'weed_white-widow'
    elseif args == 4 then
        weedbag =  'weed_ak47'
    elseif args == 5 then
        weedbag =  'weed_amnesia'
    elseif args == 6 then
        weedbag =  'weed_purple-haze'
    elseif args == 7 then
        weedbag =  'weed_gelato'
    elseif args == 8 then
        weedbag =  'weed_zkittlez'
    -- Add addtional strains below    
    end
	if pData.Functions.GetItemByName(weedbag) ~= nil then
        amount = pData.Functions.GetItemByName(weedbag).amount
        pay = (amount*Config.Stores.Weed.SmokeShop.Drugs.Bags[weedbag])
        pData.Functions.RemoveItem(weedbag, amount)
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[weedbag], 'remove', amount)
        if Config.Stores.Weed.SmokeShop.UseCashItem == true then
            pData.Functions.AddItem(CashItem, pay)
            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[CashItem], 'add', Amount)
        elseif Config.Stores.Weed.SmokeShop.UseCashItem == false then
            pData.Functions.AddMoney(MoneyType, math.floor(pay))
        end
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Stores['nobags'], 'error')
        TriggerClientEvent('boii-weed:cl:SellingMenu', source)
    end
end)