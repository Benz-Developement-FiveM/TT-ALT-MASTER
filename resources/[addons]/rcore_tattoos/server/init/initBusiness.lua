-- ❗❗❗ This file is open to be edited, but be really careful and edit it only if you know what you are doing
-- You should only edit this file, if you need to change the database queries for ESX
-- Make sure to backup this file before editing, edit on your own risk.
-- Support will not be provided if you break anything, so please always let edit someone, who knows their stuff :)
Businesses = {}

local useWhitelisted = nil
local handledBusinesses = {}

function getShopBusinessData(businessId, types)
    local businessData = Businesses[businessId] or ConfigBusiness.Businesses[businessId]

    if not businessData or not table.len(businessData) then
        for i = 1, 3 do
            dbg.critical('Tattoo shop business with id "%s" not found in config_business.lua', businessId)
        end
        dbg.critical('businessId in config.lua must match business id in config_business.lua !!!')
        dbg.critical('Stopping current tattoo shop business "%s"!', businessId)

        return nil
    end

    if not types or not table.len(businessData) then
        return businessData
    end

    local returnData = {}

    for _, type in pairs(types) do
        local typeData = businessData[type]

        if typeData then
            returnData[type] = businessData[type]
        else
            dbg.critical('Type "%s" not found in business "%s" data!', type, businessId)
        end
    end

    if not table.len(returnData) then
        dbg.critical('No data found for any of given types for shop business "%s"!!!', businessId)
    end

    return returnData
end

function handleBusinessMoneyConversion(name, id)
    if handledBusinesses[name] and handledBusinesses[name].conversion then
        return
    end
    handledBusinesses[name].conversion = true

    dbg.info('----------------------')
    dbg.info('Handling business/society money conversion for business `%s`', name)

    local businessMoney = getBusinessMoney(name)
    local societyMoney = getSocietyMoney(name)

    if businessMoney == 0 and societyMoney == 0 then
        dbg.info('Money conversion not needed, business `%s` has no money :(', name)
        return
    end

    if businessMoney ~= 0 and societyMoney ~= 0 then
        for i = 1, 3 do
            print(
            "^8Money conversion failed :( Don't touch the database next time, you have money both in society and in business!")
        end
        print(
        "^8You will have to manually remove either society or business money in your database for business/society '" ..
        name .. "'")
        print(
        "^3After removing it manually, restart the server and money will be automatically converted to correct table.")
        return
    end

    if isBusinessJobEnabled(id) then
        if societyMoney == 0 and businessMoney ~= 0 then
            dbg.info('Converting business money (%s) to society for business `%s`', businessMoney, name)

            setBusinessMoney(name, 0)
            addSocietyMoney(businessMoney, name)

            dbg.info('Conversion (business -> society) done for business `%s`', name)
            return
        end

        dbg.info('Handling done, job enabled, but no money needed to be converted for business `%s`', name)
        return
    end

    if businessMoney == 0 and societyMoney ~= 0 then
        dbg.info('Converting society money (%s) to business for business `%s`', societyMoney, name)
        removeSocietyMoney(societyMoney, name)
        setBusinessMoney(name, societyMoney)

        dbg.info('Conversion (society -> business) done for business `%s`', name)
        return
    end

    dbg.info('Handling done, no money needed to be converted for business `%s`', name)
end

function handleBusinessesData()
    CreateThread(function()
        local tableBusiness = MySQL.Sync.fetchAll("SELECT * FROM `rcore_tattoos_business`", {})

        local defaultMargin = ConfigBusiness.DefaultMargin or 20

        for id, business in pairs(Businesses) do
            if not isBusinessEnabled(id) then
                break
            end

            local businessName = business.businessName

            local margin = defaultMargin
            local owner = business.owner

            local insert = true
            local updateOwner = false
            for k, v in pairs(tableBusiness) do
                if v.name == businessName then
                    insert = false

                    margin = v.margin or defaultMargin

                    if v.owner ~= owner then
                        updateOwner = true
                    end
                    break
                end
            end

            Businesses[id].margin = margin

            if handledBusinesses[businessName] and handledBusinesses[businessName].data then
                return
            end
            handledBusinesses[businessName].data = true

            if insert then
                MySQL.Sync.execute(
                    'INSERT INTO `rcore_tattoos_business` (`name`, `margin`, `money`, `owner`) VALUES (@name, @margin, 0, @owner)',
                    {
                        ["@name"] = businessName,
                        ["@margin"] = margin,
                        ["@owner"] = owner,
                    })

                dbg.info("======================")
                dbg.info('Business %s has been created in the `rcore_tattoos_business`!', businessName)
                dbg.info("======================")
            end

            if updateOwner then
                MySQL.Async.execute('UPDATE `rcore_tattoos_business` SET owner = @owner WHERE name = @name',
                    {
                        ["@name"] = businessName,
                        ["@owner"] = owner,
                    },
                    function(result)
                        if result then
                            dbg.critical("======================")
                            for i = 0, 2 do
                                dbg.critical('Successfully changed owner of business `%s`!', businessName)
                            end
                            dbg.critical("======================")
                        end
                    end
                )
            end

            handleBusinessMoneyConversion(businessName, id)
        end
    end)
end

function handleBusinessDatabase()
    if Config.Framework == Frameworks.ESX then
        CreateThread(function()
            local addonAcc = MySQL.Sync.fetchAll("SELECT * FROM `addon_account`", {})
            local addonAccData = MySQL.Sync.fetchAll("SELECT * FROM `addon_account_data`", {})
            local jobs = MySQL.Sync.fetchAll("SELECT * FROM `jobs`", {})
            local jobGrades = MySQL.Sync.fetchAll("SELECT * FROM `job_grades`", {})

            for id, business in pairs(Businesses) do
                if not isBusinessEnabled(id) or not isBusinessJobEnabled(id) then
                    break
                end

                local name = business.job.label
                local businessName = business.businessName

                if not businessName then
                    for i = 0, 2 do
                        print('^Business "' .. id .. '" is missing businessName!')
                    end
                    break
                end

                if handledBusinesses[businessName] and handledBusinesses[businessName].database then
                    return
                end
                handledBusinesses[businessName].database = true

                local societyName = 'society_' .. businessName

                local insertAcc = true
                for _, v in pairs(addonAcc) do
                    if v.name == societyName then
                        insertAcc = false
                        break
                    end
                end

                local insertAccData = true
                for _, v in pairs(addonAccData) do
                    if v.account_name == societyName then
                        insertAccData = false
                        break
                    end
                end

                local insertJobs = true
                for _, v in pairs(jobs) do
                    if useWhitelisted == nil then
                        useWhitelisted = v.whitelisted ~= nil
                    end

                    if v.name == businessName then
                        insertJobs = false
                        break
                    end
                end

                local insertJobGrades = true
                for _, v in pairs(jobGrades) do
                    if v.job_name == businessName then
                        insertJobGrades = false
                        break
                    end
                end

                if insertAcc then
                    MySQL.Sync.execute(
                        [[ INSERT IGNORE INTO `addon_account` (`name`, `label`, `shared`) VALUES (@name, @label, '1') ]],
                        {
                            ["@name"] = societyName,
                            ["@label"] = name,
                        })
                    print('^2Society "' .. societyName .. '" has been created in the database!')
                end

                if insertAccData then
                    MySQL.Sync.execute(
                        [[ INSERT IGNORE INTO `addon_account_data` (`account_name`, `money`, `owner`) VALUES (@name, @money, '') ]],
                        {
                            ["@name"] = societyName,
                            ["@money"] = 0,
                        })
                    print('^2Society "' .. societyName .. '" has been added into addon_account_data in the database!')
                end

                if insertJobs then
                    local jobsQuery = "INSERT IGNORE INTO `jobs` (`name`, `label`) VALUES (@name, @label)"

                    if useWhitelisted then
                        jobsQuery =
                        "INSERT IGNORE INTO `jobs` (`name`, `label`, `whitelisted`) VALUES (@name, @label, '1')"
                    end

                    MySQL.Sync.execute(jobsQuery, {
                        ["@name"] = businessName,
                        ["@label"] = name,
                    })
                    print('^2Job was created in `jobs` database table for society "' .. societyName .. '"!')
                end

                if insertJobGrades and ConfigBusiness.AutoInsertJobGrades and business.job then
                    for grade, data in pairs(business.job.grades) do
                        MySQL.Sync.execute(
                            "INSERT IGNORE INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) "
                            .. "VALUES (@job_name, @grade, @name, @label, '0', '{}', '{}')", {
                                ["@job_name"] = businessName,
                                ["@grade"] = grade - 1,
                                ["@name"] = data.name,
                                ["@label"] = data.label or data.name:gsub("^%l", string.upper),
                            })
                    end
                end

                if insertAcc or insertAccData or insertJobs or insertJobGrades then
                    print("^3======================")
                    for i = 0, 2 do
                        print('^1Data for society "' ..
                            societyName ..
                            '" have been inserted into the database! The server should be restarted in order to work correctly!')
                    end
                    print("^3======================")
                end
            end
        end)

        for id, business in pairs(Businesses) do
            if not isBusinessEnabled(id) or not isBusinessJobEnabled(id) then
                break
            end

            local businessName = business.businessName

            if not businessName then
                for i = 0, 2 do
                    print('^1Business "' .. id .. '" is missing businessName!')
                end
                break
            end

            local societyName = 'society_' .. businessName

            TriggerEvent(Config.Events["esx_society:registerSociety"], businessName, businessName, societyName,
                societyName, societyName, { type = "private" })
        end
    end

    handleBusinessesData()
end

function initBusinesses()
    for _, shop in pairs(Config.Shops) do
        local businessId = shop.businessId
        if businessId ~= nil then
            if not isBusinessEnabled(businessId) then
                goto continue
            end

            local businessData = getShopBusinessData(businessId)

            if not businessData then
                dbg.critical('initBusinesses: business data for "%s" not found!', businessId)
                goto continue
            end

            if not businessData.businessName then
                dbg.critical('Tattoo business is missing a businessName, check your config!')
            else
                handledBusinesses[businessData.businessName] = {
                    database = false,
                    data = false,
                    conversion = false,
                }
            end

            if businessData.job and not businessData.job.label then
                dbg.critical('Tattoo business is missing a label, check your config!')
            end

            if not businessData.bossMenu then
                dbg.critical('Tattoo business is missing bossMenu data, check your config!')
            else
                if not businessData.job.grades then
                    dbg.info('Tattoo business is missing grades, default grade `boss` will be used!')
                end

                Businesses[businessId] = {}

                for dataType, dataValue in pairs(businessData) do
                    Businesses[businessId][dataType] = dataValue
                end
            end
        end

        ::continue::
    end

    handleBusinessDatabase()
end

initBusinesses()

registerCallback(triggerName('getBusinessData'), function(source, cb)
    cb(Businesses)
end)
