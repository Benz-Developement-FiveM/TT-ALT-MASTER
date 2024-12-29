----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

--<!>-- ITEMS --<!>--
-- Seeds

--<!>-- NOTES --<!>--
-- How the planting seeds event works
-- "EVENT", "SOURCE", "ITEM NAME", "STRAIN", "GENDER", "GROWTH RATE", "DEGRADE", "XP"
-- 
-- "ITEM NAME" - This carries the name of the seed you planted to be removed/returned
-- "STRAIN" - This should match your settings in `harvest_sv.lua`
-- "GENDER" - This should match your settings in `harvest_sv.lua`
-- "GROWTH RATE" - How much plants should grow per update tick, 100 = 1%. Default rate: 1% every 1min
-- "DEGRADE" - How much food/water/quality should decay per update tick, 100 = 1%. Default rate: food/water 1% every 1min, quality 0.5% every 1min
-- "XP" - Amount of XP to gain when planting seed
--<!>-- NOTES --<!>--

-- Skunk
Core.Functions.CreateUseableItem('weed_skunk_seed_m', function(source, item)
    TriggerEvent('boii-weed:sv:PlantSeed', source, item.name, 'Skunk', 'Male', 1000, 100, math.random(1,3))
end)

Core.Functions.CreateUseableItem('weed_skunk_seed_f', function(source, item)
    TriggerEvent('boii-weed:sv:PlantSeed', source, item.name, 'Skunk', 'Feminized', 1000, 100, math.random(1,3))
end)
-- OG Kush
Core.Functions.CreateUseableItem('weed_og-kush_seed_m', function(source, item)
    TriggerEvent('boii-weed:sv:PlantSeed', source, item.name, 'OG Kush', 'Male', 100, 100, math.random(1,3))
end)
Core.Functions.CreateUseableItem('weed_og-kush_seed_f', function(source, item)
    TriggerEvent('boii-weed:sv:PlantSeed', source, item.name, 'OG Kush', 'Feminized', 100, 100, math.random(1,3))
end)
-- White Widow
Core.Functions.CreateUseableItem('weed_white-widow_seed_m', function(source, item)
    TriggerEvent('boii-weed:sv:PlantSeed', source, item.name, 'White Widow', 'Male', 100, 100, math.random(1,3))
end)
Core.Functions.CreateUseableItem('weed_white-widow_seed_f', function(source, item)
    TriggerEvent('boii-weed:sv:PlantSeed', source, item.name, 'White Widow', 'Feminized', 100, 100, math.random(1,3))
end)
-- AK47
Core.Functions.CreateUseableItem('weed_ak47_seed_m', function(source, item)
    TriggerEvent('boii-weed:sv:PlantSeed', source, item.name, 'AK47', 'Male', 100, 100, math.random(1,3))
end)
Core.Functions.CreateUseableItem('weed_ak47_seed_f', function(source, item)
    TriggerEvent('boii-weed:sv:PlantSeed', source, item.name, 'AK47', 'Feminized', 100, 100, math.random(1,3))
end)
-- Amnesia
Core.Functions.CreateUseableItem('weed_amnesia_seed_m', function(source, item)
    TriggerEvent('boii-weed:sv:PlantSeed', source, item.name, 'Amnesia', 'Male', 100, 100, math.random(1,3))
end)
Core.Functions.CreateUseableItem('weed_amnesia_seed_f', function(source, item)
    TriggerEvent('boii-weed:sv:PlantSeed', source, item.name, 'Amnesia', 'Feminized', 100, 100, math.random(1,3))
end)
-- Purple Haze
Core.Functions.CreateUseableItem('weed_purple-haze_seed_m', function(source, item)
    TriggerEvent('boii-weed:sv:PlantSeed', source, item.name, 'Purple Haze', 'Male', 100, 100, math.random(1,3))
end)
Core.Functions.CreateUseableItem('weed_purple-haze_seed_f', function(source, item)
    TriggerEvent('boii-weed:sv:PlantSeed', source, item.name, 'Purple Haze', 'Feminized', 100, 100, math.random(1,3))
end)
-- Gelato
Core.Functions.CreateUseableItem('weed_gelato_seed_m', function(source, item)
    TriggerEvent('boii-weed:sv:PlantSeed', source, item.name, 'Gelato', 'Male', 100, 100, math.random(1,3))
end)
Core.Functions.CreateUseableItem('weed_gelato_seed_f', function(source, item)
    TriggerEvent('boii-weed:sv:PlantSeed', source, item.name, 'Gelato', 'Feminized', 100, 100, math.random(1,3))
end)
-- Zkittlez
Core.Functions.CreateUseableItem('weed_zkittlez_seed_m', function(source, item)
    TriggerEvent('boii-weed:sv:PlantSeed', source, item.name, 'Zkittlez', 'Male', 100, 100, math.random(1,3))
end)
Core.Functions.CreateUseableItem('weed_zkittlez_seed_f', function(source, item)
    TriggerEvent('boii-weed:sv:PlantSeed', source, item.name, 'Zkittlez', 'Feminized', 100, 100, math.random(1,3))
end)


-- Crops
--<!>-- NOTES --<!>--
-- How the trimming event works
-- "EVENT", "SOURCE", "ITEM NAME", "STRAIN", "RETURN ITEM", "BAG ITEM", "AMOUNT"
-- 
-- "ITEM NAME" - This carries the name of the crop you are trimming to remove it
-- "STRAIN" - This should match your settings in `trimming_sv.lua`
-- "RETURN ITEM" - Item to return after trimming this should match your settings in `trimming_sv.lua`
-- "BAG ITEM" - Name of bag item to remove when trimming
-- "AMOUNT" - Amount of bags to remove/return this is affected by your settings in `trimming_sv.lua`
--<!>-- NOTES --<!>--

-- Skunk
Core.Functions.CreateUseableItem('weed_skunk_crop', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local shears = Config.Plants.Outdoor.Actions.Trimming.Required['1'].name
    local scales = Config.Plants.Outdoor.Actions.Trimming.Required['2'].name
    local bags = Config.Plants.Outdoor.Actions.Trimming.Required['3'].name
    local bagamount = math.random(2,7)
    if pData.Functions.GetItemByName(shears) ~= nil then
        if pData.Functions.GetItemByName(scales) ~= nil then
            if pData.Functions.GetItemByName(bags) ~= nil then
                if pData.Functions.GetItemByName(bags).amount >= bagamount then
                    TriggerClientEvent('boii-weed:cl:Trim', source, item.name, 'Skunk', 'weed_skunk', bags, bagamount)
                else
                    TriggerClientEvent('boii-weed:notify', source, Language.Trimming['enoughbags'], 'error')
                end
            else
                TriggerClientEvent('boii-weed:notify', source, Language.Trimming['nobags'], 'error')
            end
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Trimming['noscales'], 'error')
        end
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Trimming['noshears'], 'error')
    end
end)
-- OG Kush
Core.Functions.CreateUseableItem('weed_og-kush_crop', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local shears = Config.Plants.Outdoor.Actions.Trimming.Required['1'].name
    local scales = Config.Plants.Outdoor.Actions.Trimming.Required['2'].name
    local bags = Config.Plants.Outdoor.Actions.Trimming.Required['3'].name
    local bagamount = math.random(2,7)
    if pData.Functions.GetItemByName(shears) ~= nil then
        if pData.Functions.GetItemByName(scales) ~= nil then
            if pData.Functions.GetItemByName(bags) ~= nil then
                if pData.Functions.GetItemByName(bags).amount >= bagamount then
                    TriggerClientEvent('boii-weed:cl:Trim', source, item.name, 'OG Kush', 'weed_og-kush', bags, bagamount)
                else
                    TriggerClientEvent('boii-weed:notify', source, Language.Trimming['enoughbags'], 'error')
                end
            else
                TriggerClientEvent('boii-weed:notify', source, Language.Trimming['nobags'], 'error')
            end
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Trimming['noscales'], 'error')
        end
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Trimming['noshears'], 'error')
    end
end)
-- White Widow
Core.Functions.CreateUseableItem('weed_white-widow_crop', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local shears = Config.Plants.Outdoor.Actions.Trimming.Required['1'].name
    local scales = Config.Plants.Outdoor.Actions.Trimming.Required['2'].name
    local bags = Config.Plants.Outdoor.Actions.Trimming.Required['3'].name
    local bagamount = math.random(2,7)
    if pData.Functions.GetItemByName(shears) ~= nil then
        if pData.Functions.GetItemByName(scales) ~= nil then
            if pData.Functions.GetItemByName(bags) ~= nil then
                if pData.Functions.GetItemByName(bags).amount >= bagamount then
                    TriggerClientEvent('boii-weed:cl:Trim', source, item.name, 'Skunk', 'weed_white-widow', bags, bagamount)
                else
                    TriggerClientEvent('boii-weed:notify', source, Language.Trimming['enoughbags'], 'error')
                end
            else
                TriggerClientEvent('boii-weed:notify', source, Language.Trimming['nobags'], 'error')
            end
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Trimming['noscales'], 'error')
        end
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Trimming['noshears'], 'error')
    end
end)
-- AK47
Core.Functions.CreateUseableItem('weed_ak47_crop', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local shears = Config.Plants.Outdoor.Actions.Trimming.Required['1'].name
    local scales = Config.Plants.Outdoor.Actions.Trimming.Required['2'].name
    local bags = Config.Plants.Outdoor.Actions.Trimming.Required['3'].name
    local bagamount = math.random(2,7)
    if pData.Functions.GetItemByName(shears) ~= nil then
        if pData.Functions.GetItemByName(scales) ~= nil then
            if pData.Functions.GetItemByName(bags) ~= nil then
                if pData.Functions.GetItemByName(bags).amount >= bagamount then
                    TriggerClientEvent('boii-weed:cl:Trim', source, item.name, 'Skunk', 'weed_ak47', bags, bagamount)
                else
                    TriggerClientEvent('boii-weed:notify', source, Language.Trimming['enoughbags'], 'error')
                end
            else
                TriggerClientEvent('boii-weed:notify', source, Language.Trimming['nobags'], 'error')
            end
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Trimming['noscales'], 'error')
        end
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Trimming['noshears'], 'error')
    end
end)
-- Amnesia
Core.Functions.CreateUseableItem('weed_amnesia_crop', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local shears = Config.Plants.Outdoor.Actions.Trimming.Required['1'].name
    local scales = Config.Plants.Outdoor.Actions.Trimming.Required['2'].name
    local bags = Config.Plants.Outdoor.Actions.Trimming.Required['3'].name
    local bagamount = math.random(2,7)
    if pData.Functions.GetItemByName(shears) ~= nil then
        if pData.Functions.GetItemByName(scales) ~= nil then
            if pData.Functions.GetItemByName(bags) ~= nil then
                if pData.Functions.GetItemByName(bags).amount >= bagamount then
                    TriggerClientEvent('boii-weed:cl:Trim', source, item.name, 'Skunk', 'weed_amnesia', bags, bagamount)
                else
                    TriggerClientEvent('boii-weed:notify', source, Language.Trimming['enoughbags'], 'error')
                end
            else
                TriggerClientEvent('boii-weed:notify', source, Language.Trimming['nobags'], 'error')
            end
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Trimming['noscales'], 'error')
        end
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Trimming['noshears'], 'error')
    end
end)
-- Purple Haze
Core.Functions.CreateUseableItem('weed_purple-haze_crop', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local shears = Config.Plants.Outdoor.Actions.Trimming.Required['1'].name
    local scales = Config.Plants.Outdoor.Actions.Trimming.Required['2'].name
    local bags = Config.Plants.Outdoor.Actions.Trimming.Required['3'].name
    local bagamount = math.random(2,7)
    if pData.Functions.GetItemByName(shears) ~= nil then
        if pData.Functions.GetItemByName(scales) ~= nil then
            if pData.Functions.GetItemByName(bags) ~= nil then
                if pData.Functions.GetItemByName(bags).amount >= bagamount then
                    TriggerClientEvent('boii-weed:cl:Trim', source, item.name, 'Skunk', 'weed_purple-haze', bags, bagamount)
                else
                    TriggerClientEvent('boii-weed:notify', source, Language.Trimming['enoughbags'], 'error')
                end
            else
                TriggerClientEvent('boii-weed:notify', source, Language.Trimming['nobags'], 'error')
            end
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Trimming['noscales'], 'error')
        end
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Trimming['noshears'], 'error')
    end
end)
-- Gelato
Core.Functions.CreateUseableItem('weed_gelato_crop', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local shears = Config.Plants.Outdoor.Actions.Trimming.Required['1'].name
    local scales = Config.Plants.Outdoor.Actions.Trimming.Required['2'].name
    local bags = Config.Plants.Outdoor.Actions.Trimming.Required['3'].name
    local bagamount = math.random(2,7)
    if pData.Functions.GetItemByName(shears) ~= nil then
        if pData.Functions.GetItemByName(scales) ~= nil then
            if pData.Functions.GetItemByName(bags) ~= nil then
                if pData.Functions.GetItemByName(bags).amount >= bagamount then
                    TriggerClientEvent('boii-weed:cl:Trim', source, item.name, 'Skunk', 'weed_gelato', bags, bagamount)
                else
                    TriggerClientEvent('boii-weed:notify', source, Language.Trimming['enoughbags'], 'error')
                end
            else
                TriggerClientEvent('boii-weed:notify', source, Language.Trimming['nobags'], 'error')
            end
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Trimming['noscales'], 'error')
        end
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Trimming['noshears'], 'error')
    end
end)
-- Zkittlez
Core.Functions.CreateUseableItem('weed_zkittlez_crop', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local shears = Config.Plants.Outdoor.Actions.Trimming.Required['1'].name
    local scales = Config.Plants.Outdoor.Actions.Trimming.Required['2'].name
    local bags = Config.Plants.Outdoor.Actions.Trimming.Required['3'].name
    local bagamount = math.random(2,7)
    if pData.Functions.GetItemByName(shears) ~= nil then
        if pData.Functions.GetItemByName(scales) ~= nil then
            if pData.Functions.GetItemByName(bags) ~= nil then
                if pData.Functions.GetItemByName(bags).amount >= bagamount then
                    TriggerClientEvent('boii-weed:cl:Trim', source, item.name, 'Skunk', 'weed_zkittlez', bags, bagamount)
                else
                    TriggerClientEvent('boii-weed:notify', source, Language.Trimming['enoughbags'], 'error')
                end
            else
                TriggerClientEvent('boii-weed:notify', source, Language.Trimming['nobags'], 'error')
            end
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Trimming['noscales'], 'error')
        end
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Trimming['noshears'], 'error')
    end
end)

-- Bags
--<!>-- NOTES --<!>--
-- How the joint rolling event works
-- "EVENT", "SOURCE", "ITEM NAME", "STRAIN", "RETURN ITEM", "PAPERS ITEM", "AMOUNT"
-- 
-- "ITEM NAME" - This carries the name of the crop you are trimming to remove it
-- "STRAIN" - This should match your settings in `rolling_sv.lua`
-- "RETURN ITEM" - Item to return after trimming this should match your settings in `rolling_sv.lua`
-- "PAPERS ITEM" - Name of papers item to remove when rolling
-- "AMOUNT" - Amount of papers to remove and joints to return
--<!>-- NOTES --<!>--

-- Skunk
Core.Functions.CreateUseableItem('weed_skunk', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local grinder = Config.Plants.Outdoor.Actions.Rolling.Required['1'].name
    local papers = Config.Plants.Outdoor.Actions.Rolling.Required['2'].name
    local papersamount = Config.Plants.Outdoor.Actions.Rolling.Required['2'].amount
    if pData.Functions.GetItemByName(grinder) ~= nil then
        if pData.Functions.GetItemByName(papers) ~= nil then
            if pData.Functions.GetItemByName(papers).amount >= papersamount then
                TriggerClientEvent('boii-weed:cl:Roll', source, item.name, 'Skunk', 'weed_skunk_joint', papers, papersamount)
            else
                TriggerClientEvent('boii-weed:notify', source, Language.Rolling['enoughpapers'], 'error')
            end
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Rolling['nopapers'], 'error')
        end
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Rolling['nogrinder'], 'error')
    end
end)
-- OG Kush
Core.Functions.CreateUseableItem('weed_og-kush', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local grinder = Config.Plants.Outdoor.Actions.Rolling.Required['1'].name
    local papers = Config.Plants.Outdoor.Actions.Rolling.Required['2'].name
    local papersamount = Config.Plants.Outdoor.Actions.Rolling.Required['2'].amount
    if pData.Functions.GetItemByName(grinder) ~= nil then
        if pData.Functions.GetItemByName(papers) ~= nil then
            if pData.Functions.GetItemByName(papers).amount >= papersamount then
                TriggerClientEvent('boii-weed:cl:Roll', source, item.name, 'OG Kush', 'weed_og-kush_joint', papers, papersamount)
            else
                TriggerClientEvent('boii-weed:notify', source, Language.Rolling['enoughpapers'], 'error')
            end
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Rolling['nopapers'], 'error')
        end
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Rolling['nogrinder'], 'error')
    end
end)
-- White Widow
Core.Functions.CreateUseableItem('weed_white-widow', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local grinder = Config.Plants.Outdoor.Actions.Rolling.Required['1'].name
    local papers = Config.Plants.Outdoor.Actions.Rolling.Required['2'].name
    local papersamount = Config.Plants.Outdoor.Actions.Rolling.Required['2'].amount
    if pData.Functions.GetItemByName(grinder) ~= nil then
        if pData.Functions.GetItemByName(papers) ~= nil then
            if pData.Functions.GetItemByName(papers).amount >= papersamount then
                TriggerClientEvent('boii-weed:cl:Roll', source, item.name, 'White Widow', 'weed_white-widow_joint', papers, papersamount)
            else
                TriggerClientEvent('boii-weed:notify', source, Language.Rolling['enoughpapers'], 'error')
            end
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Rolling['nopapers'], 'error')
        end
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Rolling['nogrinder'], 'error')
    end
end)
-- AK47
Core.Functions.CreateUseableItem('weed_ak47', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local grinder = Config.Plants.Outdoor.Actions.Rolling.Required['1'].name
    local papers = Config.Plants.Outdoor.Actions.Rolling.Required['2'].name
    local papersamount = Config.Plants.Outdoor.Actions.Rolling.Required['2'].amount
    if pData.Functions.GetItemByName(grinder) ~= nil then
        if pData.Functions.GetItemByName(papers) ~= nil then
            if pData.Functions.GetItemByName(papers).amount >= papersamount then
                TriggerClientEvent('boii-weed:cl:Roll', source, item.name, 'AK47', 'weed_ak47_joint', papers, papersamount)
            else
                TriggerClientEvent('boii-weed:notify', source, Language.Rolling['enoughpapers'], 'error')
            end
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Rolling['nopapers'], 'error')
        end
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Rolling['nogrinder'], 'error')
    end
end)
-- Amnesia
Core.Functions.CreateUseableItem('weed_amnesia', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local grinder = Config.Plants.Outdoor.Actions.Rolling.Required['1'].name
    local papers = Config.Plants.Outdoor.Actions.Rolling.Required['2'].name
    local papersamount = Config.Plants.Outdoor.Actions.Rolling.Required['2'].amount
    if pData.Functions.GetItemByName(grinder) ~= nil then
        if pData.Functions.GetItemByName(papers) ~= nil then
            if pData.Functions.GetItemByName(papers).amount >= papersamount then
                TriggerClientEvent('boii-weed:cl:Roll', source, item.name, 'Amnesia', 'weed_amnesia_joint', papers, papersamount)
            else
                TriggerClientEvent('boii-weed:notify', source, Language.Rolling['enoughpapers'], 'error')
            end
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Rolling['nopapers'], 'error')
        end
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Rolling['nogrinder'], 'error')
    end
end)
-- Purple Haze
Core.Functions.CreateUseableItem('weed_purple-haze', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local grinder = Config.Plants.Outdoor.Actions.Rolling.Required['1'].name
    local papers = Config.Plants.Outdoor.Actions.Rolling.Required['2'].name
    local papersamount = Config.Plants.Outdoor.Actions.Rolling.Required['2'].amount
    if pData.Functions.GetItemByName(grinder) ~= nil then
        if pData.Functions.GetItemByName(papers) ~= nil then
            if pData.Functions.GetItemByName(papers).amount >= papersamount then
                TriggerClientEvent('boii-weed:cl:Roll', source, item.name, 'Purple Haze', 'weed_purple-haze_joint', papers, papersamount)
            else
                TriggerClientEvent('boii-weed:notify', source, Language.Rolling['enoughpapers'], 'error')
            end
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Rolling['nopapers'], 'error')
        end
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Rolling['nogrinder'], 'error')
    end
end)
-- Gelato
Core.Functions.CreateUseableItem('weed_gelato', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local grinder = Config.Plants.Outdoor.Actions.Rolling.Required['1'].name
    local papers = Config.Plants.Outdoor.Actions.Rolling.Required['2'].name
    local papersamount = Config.Plants.Outdoor.Actions.Rolling.Required['2'].amount
    if pData.Functions.GetItemByName(grinder) ~= nil then
        if pData.Functions.GetItemByName(papers) ~= nil then
            if pData.Functions.GetItemByName(papers).amount >= papersamount then
                TriggerClientEvent('boii-weed:cl:Roll', source, item.name, 'Gelato', 'weed_gelato_joint', papers, papersamount)
            else
                TriggerClientEvent('boii-weed:notify', source, Language.Rolling['enoughpapers'], 'error')
            end
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Rolling['nopapers'], 'error')
        end
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Rolling['nogrinder'], 'error')
    end
end)
-- Zkittlez
Core.Functions.CreateUseableItem('weed_zkittlez', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local grinder = Config.Plants.Outdoor.Actions.Rolling.Required['1'].name
    local papers = Config.Plants.Outdoor.Actions.Rolling.Required['2'].name
    local papersamount = Config.Plants.Outdoor.Actions.Rolling.Required['2'].amount
    if pData.Functions.GetItemByName(grinder) ~= nil then
        if pData.Functions.GetItemByName(papers) ~= nil then
            if pData.Functions.GetItemByName(papers).amount >= papersamount then
                TriggerClientEvent('boii-weed:cl:Roll', source, item.name, 'Zkittlez', 'weed_zkittlez_joint', papers, papersamount)
            else
                TriggerClientEvent('boii-weed:notify', source, Language.Rolling['enoughpapers'], 'error')
            end
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Rolling['nopapers'], 'error')
        end
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Rolling['nogrinder'], 'error')
    end
end)

-- Joints
--<!>-- NOTES --<!>--
-- How the smoking event works
-- "EVENT", "SOURCE", "ITEM NAME", "ARMOUR", "STRESS"

-- "ITEM NAME" - Name of joint
-- "ARMOUR" - Amount of armour added by smoking joint
-- "STRESS" - Amount of stress removed by smoking joint
-- "TIME" - Amount of time drug effects should remain active in minutes
--<!>-- NOTES --<!>--

-- Skunk
Core.Functions.CreateUseableItem('weed_skunk_joint', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local lighter = Config.Plants.Outdoor.Actions.Smoking.Required.name
    if pData.Functions.GetItemByName(lighter) ~= nil then
        TriggerClientEvent('boii-weed:cl:Smoke', source, item.name, math.random(1,3), math.random(3,5), 2)
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Smoking['nolighter'], 'error')
    end
end)
-- OG Kush
Core.Functions.CreateUseableItem('weed_og-kush_joint', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local lighter = Config.Plants.Outdoor.Actions.Smoking.Required.name
    if pData.Functions.GetItemByName(lighter) ~= nil then
        TriggerClientEvent('boii-weed:cl:Smoke', source, item.name, math.random(1,3), math.random(3,5), 2)
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Smoking['nolighter'], 'error')
    end
end)
-- White Widow
Core.Functions.CreateUseableItem('weed_white-widow_joint', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local lighter = Config.Plants.Outdoor.Actions.Smoking.Required.name
    if pData.Functions.GetItemByName(lighter) ~= nil then
        TriggerClientEvent('boii-weed:cl:Smoke', source, item.name, math.random(1,3), math.random(3,5), 2)
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Smoking['nolighter'], 'error')
    end
end)
-- AK47
Core.Functions.CreateUseableItem('weed_ak47_joint', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local lighter = Config.Plants.Outdoor.Actions.Smoking.Required.name
    if pData.Functions.GetItemByName(lighter) ~= nil then
        TriggerClientEvent('boii-weed:cl:Smoke', source, item.name, math.random(1,3), math.random(3,5), 2)
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Smoking['nolighter'], 'error')
    end
end)
-- Amnesia
Core.Functions.CreateUseableItem('weed_amnesia_joint', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local lighter = Config.Plants.Outdoor.Actions.Smoking.Required.name
    if pData.Functions.GetItemByName(lighter) ~= nil then
        TriggerClientEvent('boii-weed:cl:Smoke', source, item.name, math.random(1,3), math.random(3,5), 2)
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Smoking['nolighter'], 'error')
    end
end)
-- Purple Haze
Core.Functions.CreateUseableItem('weed_purple-haze_joint', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local lighter = Config.Plants.Outdoor.Actions.Smoking.Required.name
    if pData.Functions.GetItemByName(lighter) ~= nil then
        TriggerClientEvent('boii-weed:cl:Smoke', source, item.name, math.random(1,3), math.random(3,5), 2)
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Weed.Smoking['nolighter'], 'error')
    end
end)
-- Gelato
Core.Functions.CreateUseableItem('weed_gelato_joint', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local lighter = Config.Plants.Outdoor.Actions.Smoking.Required.name
    if pData.Functions.GetItemByName(lighter) ~= nil then
        TriggerClientEvent('boii-weed:cl:Smoke', source, item.name, math.random(1,3), math.random(3,5), 2)
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Smoking['nolighter'], 'error')
    end
end)
-- Zkittlez
Core.Functions.CreateUseableItem('weed_zkittlez_joint', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local lighter = Config.Plants.Outdoor.Actions.Smoking.Required.name
    if pData.Functions.GetItemByName(lighter) ~= nil then
        TriggerClientEvent('boii-weed:cl:Smoke', source, item.name, math.random(1,3), math.random(3,5), 2)
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Smoking['nolighter'], 'error')
    end
end)
--<!>-- ITEMS --<!>--