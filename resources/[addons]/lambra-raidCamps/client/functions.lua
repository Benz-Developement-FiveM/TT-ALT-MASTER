function onPlayerEnterZone(zoneId)
    --This code will be executed everytime a player enter's the range
end

function onPlayerLootCrate(zoneId, otherPlayers)
    --This code will be executed everytime the player loot's the crate

    --otherPlayers (must have the expRadius ON for that zone otherwise it wont return anything)
end

function onAnnounce(isOnCreate, zoneId)
    --Enable disable at Config.Announces

    if isOnCreate then 
        QBCore.Functions.Notify(Locales["onCreate"]..Config.Camps[zoneId].name)
    else
        QBCore.Functions.Notify(Locales["onFinished"]..Config.Camps[zoneId].name)
    end
end

function onPedCreation(ped)
    --Apply here extra properties to the peds

end