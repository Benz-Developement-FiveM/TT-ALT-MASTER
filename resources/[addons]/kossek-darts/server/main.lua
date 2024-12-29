local Games = {}

if Config.framework:lower() == 'esx' then
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
elseif Config.framework:lower() == 'qbcore' then
    QBCore = exports['qb-core']:GetCoreObject()
end

RegisterServerEvent('kossek-darts:joinGame')
AddEventHandler('kossek-darts:joinGame', function(board)
    local src = source

    if not Games[1] then
        table.insert(Games, {
            board = board,
            players = { 
                {
                    src = src,
                    name = GetPlayerData(src),
                    points = 0,
                    bullseyes = 0,
                },
            }
        })
    else
        for gameid, data in pairs(Games) do
            if data.board == board then
                table.insert(data.players, {
                    src = src,
                    name = GetPlayerData(src),
                    points = 0,
                    bullseyes = 0,
                })
            else
                table.insert(Games, {
                    board = board,
                    players = { 
                        {
                            src = src,
                            name = GetPlayerData(src),
                            points = 0,
                            bullseyes = 0,
                        }
                    }
                })
                break
            end
        end
    end

    TriggerClientEvent('kossek-darts:updateData', -1, Games)
end)

RegisterServerEvent('kossek-darts:leaveGame')
AddEventHandler('kossek-darts:leaveGame', function(board)
    local src = source
    
    for _, data in pairs(Games) do
        if data.board == board then
            for index, val in ipairs(data.players) do
                if val.src == src then
                    table.remove(data.players, index)
                end
            end
        end
    end

    TriggerClientEvent('kossek-darts:updateData', -1, Games)
end)

RegisterServerEvent('kossek-darts:updatePoints')
AddEventHandler('kossek-darts:updatePoints', function(board, points, bullseyes)
    local src = source
    
    for _, data in pairs(Games) do
        if data.board == board then
            for __, val in ipairs(data.players) do
                if val.src == src then
                    val.points = val.points + points
                    val.bullseyes = val.bullseyes + bullseyes
                end
            end
        end
    end

    TriggerClientEvent('kossek-darts:updateData', -1, Games)
end)

GetPlayerData = function(src)
    local found = nil

    if Config.framework:lower() == 'esx' then
        local xPlayer = ESX.GetPlayerFromId(src)

        found = xPlayer.getName()
    elseif Config.framework:lower() == 'qbcore' then
        local xPlayer = QBCore.Functions.GetPlayer(src)

        found = xPlayer.charinfo.firstname .. ' ' .. xPlayer.charinfo.lastname
    else
        found = GetPlayerName(src)
    end

    return found
end