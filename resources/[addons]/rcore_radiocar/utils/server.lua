ESX = nil
CachedOwners = {}

if Config.FrameWork == 1 then
    ESX = GetEsxObject()
end

if Config.FrameWork == 2 then
    QBCore = Config.GetQBCoreObject()
    ESX = {}

    ESX.GetPlayerFromId = function(source)
        local xPlayer = {}
        local qbPlayer = QBCore.Functions.GetPlayer(source)
        ---------
        xPlayer.identifier = qbPlayer.PlayerData.citizenid
        ---------
        return xPlayer
    end
end

RegisterNetEvent("rcore_radiocar:fetchPermission")
AddEventHandler("rcore_radiocar:fetchPermission", function()
    TriggerClientEvent("rcore_radiocar:fetchPermission", source, IsPlayerAceAllowed(source, "radiocar.use"))
end)

function IsVehiclePlayer(source, licensePlate, cb)
    licensePlate = Trim(licensePlate)

    if Config.FrameWork == 0 then
        cb(true)
        return true
    end

    local sql = "SELECT * FROM player_vehicles WHERE plate = @spz"

    if Config.FrameWork == 1 then
        sql = "SELECT * FROM owned_vehicles WHERE plate = @spz"
    end

    MySQLAsyncfetchAll(sql, {
        ['@spz'] = licensePlate,
    }, function(result)
        if #result == 0 then
            cb(false)
        else
            cb(true)
        end
    end)
end

-- check vehicle SPZ, does it have radio ? yes -> lets open UI
-- or is vehicle stolen ? or bought -> open UI
RegisterNetEvent("rcore_radiocar:openUI")
AddEventHandler("rcore_radiocar:openUI", function(spz)
    local player = source
    local xPlayer

    spz = Trim(spz)

    if ESX then
        xPlayer = ESX.GetPlayerFromId(player)
    end

    if Config.OnlyCarWhoHaveRadio then
        if HasCarRadio(spz) then
            TriggerClientEvent("rcore_radiocar:openUI", player, GetCarRadioStyle(spz))
        end
        return
    end
    if Config.OnlyOwnerOfTheCar then
        if ESX then
            if not CachedOwners[spz] then
                local sql = "SELECT * FROM owned_vehicles WHERE plate = @plate AND owner = @identifier"
                if Config.FrameWork == 2 then
                    sql = "SELECT * FROM player_vehicles WHERE plate = @plate AND citizenid = @identifier"
                end

                local result = MySQLSyncfetchAll(sql, { ['@plate'] = spz, ['@identifier'] = xPlayer.identifier })
                if #result ~= 0 then
                    TriggerClientEvent("rcore_radiocar:openUI", player)
                end
                CachedOwners[spz] = result[1] or result
            else
                if Config.FrameWork == 2 then
                    if CachedOwners[spz].plate == spz and CachedOwners[spz].citizenid == xPlayer.identifier then
                        TriggerClientEvent("rcore_radiocar:openUI", player)
                    end
                else
                    if CachedOwners[spz].plate == spz and CachedOwners[spz].owner == xPlayer.identifier then
                        TriggerClientEvent("rcore_radiocar:openUI", player)
                    end
                end
            end
        else
            TriggerClientEvent("rcore_radiocar:openUI", player)
        end
    else
        if ESX then
            if not CachedOwners[spz] then
                local sql = "SELECT * FROM owned_vehicles WHERE plate = @plate"
                if Config.FrameWork == 2 then
                    sql = "SELECT * FROM player_vehicles WHERE plate = @plate"
                end

                local result = MySQLSyncfetchAll(sql, { ['@plate'] = spz })
                if #result ~= 0 then
                    TriggerClientEvent("rcore_radiocar:openUI", player)
                end
                CachedOwners[spz] = result[1] or result
            else
                if CachedOwners[spz].plate == spz then
                    TriggerClientEvent("rcore_radiocar:openUI", player)
                end
            end
        else
            TriggerClientEvent("rcore_radiocar:openUI", player)
        end
    end
end)

if Config.MysqlType ~= 0 then
    MysqlInit(function()
        CreateThread(function()
            MySQLSyncexecute([[ CREATE TABLE IF NOT EXISTS `radiocar_music`(`id` INT(11) NOT NULL AUTO_INCREMENT ,`label` VARCHAR(64) NOT NULL ,  `url` VARCHAR(256) NOT NULL ,`plate` VARCHAR(32) NOT NULL , PRIMARY KEY (`id`)) CHARACTER SET utf8 COLLATE utf8_general_ci; ]], {})

            MySQLSyncexecute([[CREATE TABLE IF NOT EXISTS `radiocar_owned`(`id` INT(11) NOT NULL AUTO_INCREMENT , `spz` VARCHAR(32) NOT NULL , `style` INT(11) NOT NULL ,PRIMARY KEY (`id`)) CHARACTER SET utf8 COLLATE utf8_general_ci;]], {})

            local result = {}

            for k, v in pairs(MySQLSyncfetchAll("SHOW COLUMNS FROM radiocar_owned", {})) do
                result[v.Field] = v
            end

            if not result.style then
                MySQLSyncexecute([[ ALTER TABLE `radiocar_owned` ADD `style` INT(11) NOT NULL DEFAULT '1'; ]], {})
            end

            MySQLSyncexecute([[CREATE TABLE IF NOT EXISTS `radiocar_playlist` (`id` INT(11) NOT NULL AUTO_INCREMENT ,`playlist` TEXT NOT NULL , `plate` VARCHAR(32) NOT NULL ,  PRIMARY KEY (`id`)) CHARACTER SET utf8 COLLATE utf8_general_ci; ]], {})
        end)
    end)
end

if Config.Debug then
    RegisterCommand("dumpradio", function()
        print("cachedCars")
        dump(cachedCars)

        print("CachedRadiosInCar")
        dump(CachedRadiosInCar)

        print("QueMusicCache")
        dump(QueMusicCache)

        print("CachedVolumeMusic")
        dump(CachedVolumeMusic)
    end)
end