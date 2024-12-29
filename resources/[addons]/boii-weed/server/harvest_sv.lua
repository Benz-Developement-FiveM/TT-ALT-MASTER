----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local MetaDataEvent = Config.CoreSettings.MetaDataEvent
local MetaDataName = Config.XP.MetaDataName
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--


--<!>-- HARVEST PLANTS --<!>--
RegisterNetEvent('boii-weed:sv:Harvest',function(itemname, strain, plantdata)
    local pData = Core.Functions.GetPlayer(source)
    local DrugXP = pData.PlayerData.metadata[MetaDataName]
    local amount = math.random(3,6)
    if Config.XP.Use then
        if DrugXP <= 1000 then
            if plantdata.quality > 95 then
                itemadd = math.ceil(amount*0.7)
            else
                itemadd = math.ceil(amount*0.5)
            end
        elseif DrugXP >= 1000 then
            if plantdata.quality > 95 then
                itemadd = math.ceil(amount*0.7)
            else
                itemadd = math.ceil(amount*0.5)
            end
        elseif DrugXP >= 1250 then
            if plantdata.quality > 95 then
                itemadd = math.ceil(amount*0.8)
            else
                itemadd = math.ceil(amount*0.6)
            end
        elseif DrugXP >= 1562 then
            if plantdata.quality > 95 then
                itemadd = math.ceil(amount*0.9)
            else
                itemadd = math.ceil(amount*0.7)
            end
        elseif DrugXP >= 1953 then
            if plantdata.quality > 95 then
                itemadd = math.ceil(amount*1.1)
            else
                itemadd = math.ceil(amount*0.9)
            end
        elseif DrugXP >= 2441 then
            if plantdata.quality > 95 then
                itemadd = math.ceil(amount*1.3)
            else
                itemadd = math.ceil(amount*1.1)
            end
        elseif DrugXP >= 3051 then
            if plantdata.quality > 95 then
                itemadd = math.ceil(amount*1.5)
            else
                itemadd = math.ceil(amount*1.3)
            end
        elseif DrugXP >= 3814 then
            if plantdata.quality > 95 then
                itemadd = math.ceil(amount*1.7)
            else
                itemadd = math.ceil(amount*1.5)
            end
        elseif DrugXP >= 4768 then
            if plantdata.quality > 95 then
                itemadd = math.ceil(amount*1.9)
            else
                itemadd = math.ceil(amount*1.7)
            end
        elseif DrugXP >= 5960 then
            if plantdata.quality > 95 then
                itemadd = math.ceil(amount*2.1)
            else
                itemadd = math.ceil(amount*1.9)
            end
        end
    else
        if plantdata.quality > 95 then
            itemadd = math.ceil(amount*2.5)
        else
			itemadd = amount
        end
    end
    -- Skunk
    if strain == 'Skunk' and plantdata.gender == 'Male' then
        pData.Functions.AddItem('weed_skunk_seed_f', itemadd) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['weed_skunk_seed_f'], 'add', itemadd)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestnoxp'], 'success')
        end
        return
    end
    if strain == 'Skunk' and plantdata.gender == 'Feminized' then
        pData.Functions.AddItem('weed_skunk_crop', itemadd) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['weed_skunk_crop'], 'add', itemadd)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestnoxp'], 'success')
        end
        return 
    end
    -- OG Kush
    if strain == 'OG Kush' and plantdata.gender == 'Male' then
        pData.Functions.AddItem('weed_og-kush_seed_f', itemadd) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['weed_og-kush_seed_f'], 'add', itemadd)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestnoxp'], 'success')
        end
        return 
    end
    if strain == 'OG Kush' and plantdata.gender == 'Feminized' then
        pData.Functions.AddItem('weed_og-kush_crop', itemadd) 
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['weed_og-kush_crop'], 'add', itemadd)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestnoxp'], 'success')
        end
        return 
    end
    -- White Widow
    if strain == 'White Widow' and plantdata.gender == 'Male' then
        pData.Functions.AddItem('weed_white-widow_seed_f', itemadd) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['weed_white-widow_seed_f'], 'add', itemadd)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestnoxp'], 'success')
        end
        return 
    end
    if strain == 'White Widow' and plantdata.gender == 'Feminized' then
        pData.Functions.AddItem('weed_white-widow_crop', itemadd) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['weed_white-widow_crop'], 'add', itemadd)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestnoxp'], 'success')
        end
        return 
    end
    -- AK47
    if strain == 'AK47' and plantdata.gender == 'Male' then
        pData.Functions.AddItem('weed_ak47_seed_f', itemadd) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['weed_ak47_seed_f'], 'add', itemadd)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestnoxp'], 'success')
        end
        return 
    end
    if strain == 'AK47' and plantdata.gender == 'Feminized' then
        pData.Functions.AddItem('weed_ak47_crop', itemadd) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['weed_ak47_crop'], 'add', itemadd)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestnoxp'], 'success')
        end
        return 
    end
    -- Amnesia
    if strain == 'Amnesia' and plantdata.gender == 'Male' then
        pData.Functions.AddItem('weed_amnesia_seed_f', itemadd) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['weed_amnesia_seed_f'], 'add', itemadd)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestnoxp'], 'success')
        end
        return 
    end
    if strain == 'Amnesia' and plantdata.gender == 'Feminized' then
        pData.Functions.AddItem('weed_amnesia_crop', itemadd) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['weed_amnesia_crop'], 'add', itemadd)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestnoxp'], 'success')
        end
        return 
    end
    -- Purple Haze
    if strain == 'Purple Haze' and plantdata.gender == 'Male' then
        pData.Functions.AddItem('weed_purple-haze_seed_f', itemadd) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['weed_purple-haze_seed_f'], 'add', itemadd)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestnoxp'], 'success')
        end
        return 
    end
    if strain == 'Purple Haze' and plantdata.gender == 'Feminized' then
        pData.Functions.AddItem('weed_purple-haze_crop', itemadd) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['weed_purple-haze_crop'], 'add', itemadd)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestnoxp'], 'success')
        end
        return 
    end
    -- Gelato
    if strain == 'Gelato' and plantdata.gender == 'Male' then
        pData.Functions.AddItem('weed_gelato_seed_f', itemadd) --- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['weed_gelato_seed_f'], 'add', itemadd)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestnoxp'], 'success')
        end
        return 
    end
    if strain == 'Gelato' and plantdata.gender == 'Feminized' then
        pData.Functions.AddItem('weed_gelato_crop', itemadd) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['weed_gelato_crop'], 'add', itemadd)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestnoxp'], 'success')
        end
        return 
    end
    -- Zkittlez
    if strain == 'Zkittlez' and plantdata.gender == 'Male' then
        pData.Functions.AddItem('weed_zkittlez_seed_f', itemadd) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['weed_zkittlez_seed_f'], 'add', itemadd)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestnoxp'], 'success')
        end
        return 
    end
    if strain == 'Zkittlez' and plantdata.gender == 'Feminized' then
        pData.Functions.AddItem('weed_zkittlez_crop', itemadd) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['weed_zkittlez_crop'], 'add', itemadd)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Planting['harvestnoxp'], 'success')
        end
        return 
    end
end)
--<!>-- HARVEST PLANTS --<!>--