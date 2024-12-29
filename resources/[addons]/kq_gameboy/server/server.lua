ESX = nil

if Config.esx.enabled then

    if Config.esx.useNewESXExport then
        ESX = exports['es_extended']:getSharedObject()
    else
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end

    ESX.RegisterUsableItem(Config.esx.itemName, function(source)
        local xPlayer = ESX.GetPlayerFromId(source)
        TriggerClientEvent('kq_gameboy:use', source)
    end)
end

QBCore = nil

if Config.qb.enabled then
    if Config.qb.useNewQBExport then
        QBCore = exports['qb-core']:GetCoreObject()
    end

    QBCore.Functions.CreateUseableItem(Config.qb.itemName, function(source)
        TriggerClientEvent('kq_gameboy:use', source)
    end)
end