--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local MetaDataEvent = Config.CoreSettings.MetaDataEvent
local MetaDataName = Config.XP.MetaDataName
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

-- Event
RegisterServerEvent('boii-weed:sv:Roll',function(strain, returnitem, papersamount)
    local pData = Core.Functions.GetPlayer(source)
    local DrugXP = pData.PlayerData.metadata[MetaDataName]
    if strain == 'Skunk' then
        pData.Functions.AddItem(returnitem, papersamount) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[returnitem], 'add', papersamount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-weed:notify', source, Language.Rolling['rollxp'], 'success')
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Rolling['rollnoxp'], 'success')
        end
        return 
    end
    if strain == 'OG Kush' then
        pData.Functions.AddItem(returnitem, papersamount) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[returnitem], 'add', papersamount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-weed:notify', source, Language.Rolling['rollxp'], 'success')
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Rolling['rollnoxp'], 'success')
        end
        return 
    end
    if strain == 'White Widow' then
        pData.Functions.AddItem(returnitem, papersamount) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[returnitem], 'add', papersamount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-weed:notify', source, Language.Rolling['rollxp'], 'success')
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Rolling['rollnoxp'], 'success')
        end
        return 
    end
    if strain == 'AK47' then
        pData.Functions.AddItem(returnitem, papersamount) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[returnitem], 'add', papersamount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-weed:notify', source, Language.Rolling['rollxp'], 'success')
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Rolling['rollnoxp'], 'success')
        end
        return 
    end
    if strain == 'Amnesia' then
        pData.Functions.AddItem(returnitem, papersamount) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[returnitem], 'add', papersamount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-weed:notify', source, Language.Rolling['rollxp'], 'success')
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Rolling['rollnoxp'], 'success')
        end
        return 
    end
    if strain == 'Purple Haze' then
        pData.Functions.AddItem(returnitem, papersamount) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[returnitem], 'add', papersamount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-weed:notify', source, Language.Rolling['rollxp'], 'success')
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Rolling['rollnoxp'], 'success')
        end
        return 
    end
    if strain == 'Gelato' then
        pData.Functions.AddItem(returnitem, papersamount) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[returnitem], 'add', papersamount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-weed:notify', source, Language.Rolling['rollxp'], 'success')
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Rolling['rollnoxp'], 'success')
        end
        return 
    end
    if strain == 'Zkittlez' then
        pData.Functions.AddItem(returnitem, papersamount) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[returnitem], 'add', papersamount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-weed:notify', source, Language.Rolling['rollxp'], 'success')
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Rolling['rollnoxp'], 'success')
        end
        return 
    end
end)