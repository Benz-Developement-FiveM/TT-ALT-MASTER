RegisterServerEvent('sky_dailyrewards:giveVehicle')
AddEventHandler('sky_dailyrewards:giveVehicle', function(vehicleProps, garage)
  local _source = source
  local xPlayer = Sky.GetPlayer(_source)
  if qbCore then
    MySQL.Async.insert(
        'INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state, garage) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
        {xPlayer.PlayerData.license, xPlayer.PlayerData.citizenid, vehicleProps.name, vehicleProps.model,
         json.encode(vehicleProps), vehicleProps.plate, 1, 'pillboxgarage'})
  else
    MySQL.Async.execute(
        'INSERT INTO owned_vehicles (owner, plate, vehicle, stored) VALUES (@owner, @plate, @vehicle, @stored)', {
          ['@owner'] = xPlayer.identifier,
          ['@plate'] = vehicleProps.plate,
          ['@vehicle'] = json.encode(vehicleProps),
          ['@stored'] = 1
        }, function()
          -- TriggerClientEvent("notifications", _source, "#f2c900", "SHOP", "The vehicle is now in your garage")
        end)

  end
end)

Sky.RegisterCallback('sky_dailyrewards:isPlateTaken', function(source, cb, plate, garage)
  if qbCore then
    local result = MySQL.Sync.fetchScalar('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
    cb(result)
  else
    MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE plate = @plate', {
      ['@plate'] = plate
    }, function(result)
      cb(result[1] ~= nil)
    end)
  end
end)
