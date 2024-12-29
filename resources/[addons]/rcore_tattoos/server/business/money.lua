----------------------
-- SOCIETY
----------------------
function getSocietyMoney(society)
    dbg.info("Started getting society money. `%s`", society)
    local result = nil
    local promise = promise:new()

    if Config.Framework == Frameworks.QBCORE then
        xpcall(function()
            local societyMoney = exports[Config.Events["qb-banking"]]:GetAccountBalance(society)
            result = societyMoney
            promise:resolve(result)
        end, function(error)
            xpcall(function()
                local societyMoney = exports[Config.Events["qb-management"]]:GetAccount(society)
                result = societyMoney
                promise:resolve(result)
            end, function(error)
                local societyMoney = exports[Config.Events["qb-bossmenu"]]:GetAccount(society)
                result = societyMoney
                promise:resolve(result)
            end)
        end)
    end

    if Config.Framework == Frameworks.ESX or Config.Framework == Frameworks.ESX_LIMIT then
        TriggerEvent(Config.Events['esx_addonaccount:getSharedAccount'], 'society_' .. society, function(account)
            if account then
                result = account.money
                promise:resolve(result)
            else
                dbg.error('Society %s does not exist!', society)
                result = 0
                promise:resolve(result)
            end
        end)
    end

    Citizen.Await(promise)
    return result
end

function removeSocietyMoney(money, society)
    dbg.info("Started removing society money. `%s, %s`", society, money)
    if Config.Framework == Frameworks.QBCORE then
        xpcall(function()
            exports[Config.Events["qb-banking"]]:RemoveMoney(society, money)
        end, function(error)
            xpcall(function()
                exports[Config.Events["qb-management"]]:RemoveMoney(society, money)
            end, function(error)
                TriggerEvent(Config.Events["qb-bossmenu:server:removeAccountMoney"], society, money)
            end)
        end)
    end

    if Config.Framework == Frameworks.ESX or Config.Framework == Frameworks.ESX_LIMIT then
        TriggerEvent(Config.Events['esx_addonaccount:getSharedAccount'], 'society_' .. society, function(account)
            if account then
                account.removeMoney(money)
            else
                dbg.error('Society %s does not exist!', society)
            end
        end)
    end
end

function addSocietyMoney(money, society)
    dbg.info("Started adding society money. `%s, %s`", society, money)
    if Config.Framework == Frameworks.QBCORE then
        xpcall(function()
            exports[Config.Events["qb-banking"]]:AddMoney(society, money)
        end, function(error)
            xpcall(function()
                exports[Config.Events["qb-management"]]:AddMoney(society, money)
            end, function(error)
                TriggerEvent(Config.Events["qb-bossmenu:server:addAccountMoney"], society, money)
            end)
        end)
    end

    if Config.Framework == Frameworks.ESX or Config.Framework == Frameworks.ESX_LIMIT then
        TriggerEvent(Config.Events['esx_addonaccount:getSharedAccount'], 'society_' .. society, function(account)
            if account then
                account.addMoney(money)
            else
                dbg.error('Society %s does not exist!', society)
            end
        end)
    end
end

----------------------
-- BUSINESS
----------------------
function getBusinessOrSocietyMoney(businessName, businessId)
    dbg.info("Getting business or society money. `%s`", businessName)

    if isBusinessJobEnabled(businessId) then
        return getSocietyMoney(businessName)
    end

    return getBusinessMoney(businessName)
end

function getBusinessMoney(businessName)
    dbg.info("Getting business money. `%s`", businessName)
    local result = MySQL.Sync.fetchAll("SELECT money FROM rcore_tattoos_business WHERE name='" .. businessName .. "'")

    return result[1] and result[1].money or 0
end

function setBusinessMoney(businessName, money)
    dbg.info("Setting business money. `%s, %s`", businessName, money)
    MySQL.Async.execute('UPDATE `rcore_tattoos_business` SET money = @money WHERE name = @name',
        {
            ["@name"] = businessName,
            ["@money"] = money,
        }
    )
end

function addBusinessMoney(businessName, money)
    dbg.info("Adding business money. `%s, %s`", businessName, money)
    local currentMoney = getBusinessMoney(businessName)
    local newMoney = currentMoney + money

    setBusinessMoney(businessName, newMoney)
    return true
end

function removeBusinessMoney(businessName, money)
    dbg.info("Removing business money. `%s, %s`", businessName, money)
    local currentMoney = getBusinessMoney(businessName)
    local newMoney = currentMoney - money

    if newMoney >= 0 then
        setBusinessMoney(businessName, newMoney)
        return true
    end
end

local PlayersDepositingMoney = {}

registerCallback(triggerName('depositBusinessMoney'), function(source, cb, businessName, money)
    local _source = source
    dbg.info("Handling deposit business money callback. `%s, %s, %s`", _source, businessName, money)

    if PlayersDepositingMoney[_source] then
        dbg.security("Possible money duplication attempt blocked: There is already an ongoing deposit from player `%s`",
            _source)
        cb(false)
        return
    end

    local player = ESX.GetPlayerFromId(_source)

    if player then
        PlayersDepositingMoney[_source] = true

        local playerMoney = player.getMoney()

        if playerMoney == nil then
            cb(false)
            PlayersDepositingMoney[_source] = false
            return
        end

        if money > playerMoney then
            cb(false)
            PlayersDepositingMoney[_source] = false
            return
        end

        if money <= 0 then
            cb(false)
            PlayersDepositingMoney[_source] = false
            return
        end

        if
            pcall(addBusinessMoney, businessName, money) and
            pcall(player.removeMoney, money)
        then
            cb(true)
        end

        PlayersDepositingMoney[_source] = false
    end
end)

local OngoingBusinessWithdrawals = {}

registerCallback(triggerName('withdrawBusinessMoney'), function(source, cb, businessName, money)
    local _source = source
    dbg.info("Handling withdraw business money callback. `%s, %s, %s`", _source, businessName, money)

    if OngoingBusinessWithdrawals[businessName] then
        dbg.security(
            "Possible money duplication attempt blocked: There is already an ongoing business withdrawal for business `%s` by player `%s`",
            businessName, _source)
        cb(false)
        return
    end

    local player = ESX.GetPlayerFromId(_source)

    if player then
        OngoingBusinessWithdrawals[businessName] = true

        local businessMoney = getBusinessMoney(businessName)

        if businessMoney == nil then
            cb(false)
            OngoingBusinessWithdrawals[businessName] = false
            return
        end

        if money > businessMoney then
            cb(false)
            OngoingBusinessWithdrawals[businessName] = false
            return
        end

        if money <= 0 then
            cb(false)
            OngoingBusinessWithdrawals[businessName] = false
            return
        end

        if
            pcall(removeBusinessMoney, businessName, money) and
            pcall(player.addMoney, money)
        then
            cb(true)
        end

        OngoingBusinessWithdrawals[businessName] = false
    end
end)

registerCallback(triggerName('getBusinessMoney'), function(source, cb, businessName)
    local _source = source
    dbg.info("Handling get business money callback. `%s, %s`", _source, businessName)
    local money = getBusinessMoney(businessName)

    if money ~= nil then
        cb(money)
        return
    end

    cb(nil)
end)

registerCallback(triggerName('getPlayerMoney'), function(source, cb)
    local _source = source
    dbg.info("Handling get player money callback. `%s`", _source)
    local player = ESX.GetPlayerFromId(_source)

    if player then
        local money = player.getMoney()

        if money ~= nil then
            cb(money)
            return
        end
    end

    cb(nil)
end)

registerCallback(triggerName('getBusinessOrSocietyMoney'), function(source, cb, businessName, businessId)
    local _source = source
    dbg.info("Handling get business or society money callback. `%s, %s`", _source, businessName)
    local money = getBusinessOrSocietyMoney(businessName, businessId)

    if money ~= nil then
        cb(money)
        return
    end

    cb(nil)
end)
