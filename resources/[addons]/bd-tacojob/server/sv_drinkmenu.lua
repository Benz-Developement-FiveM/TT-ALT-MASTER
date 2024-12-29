local QBCore = exports['qb-core']:GetCoreObject()
local ox_inventory = exports.ox_inventory

if Config.InventorySystem == 'ox' then
  -- ORANG TANG --
  RegisterNetEvent('bd-tacojob:server:makeOrangTang', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if not ox_inventory:RemoveItem(src, 'th_oranges', 2, false) then
      lib.notify(source, {
        id = 'taco_job',
        title = 'Taco Hut',
        description = 'You need 2x Oranges to make a Orang-O-Tang',
        showDuration = false,
        position = 'top-right',
        style = {
          backgroundColor = '#141517',
          color = '#FA8072',
          ['.description'] = {
              color = '#909296'
          }
      },
        icon = 't',
        iconColor = '#FA8072'
      }) return end
      ox_inventory:AddItem(src, 'th_orangotang', 2)
      exports['sd_skills']:IncreasePlayerXP(source, 'TACO', 10)
      lib.notify(source, {
        id = 'taco_job',
        title = 'Taco Hut',
        description = 'You have poured 2x Orang-O-Tang',
        showDuration = false,
        position = 'top-right',
        style = {
          backgroundColor = '#141517',
          color = '#FA8072',
          ['.description'] = {
              color = '#909296'
          }
      },
        icon = 't',
        iconColor = '#FA8072'
      })
  end)
  -- SPRUNK --
  RegisterNetEvent('bd-tacojob:server:makeSprunk', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if not ox_inventory:RemoveItem(src, 'th_carbonated_water', 2, false) then
      lib.notify(source, {
        id = 'taco_job',
        title = 'Taco Hut',
        description = 'You need 2x Carbonated Water to make Sprunk',
        showDuration = false,
        position = 'top-right',
        style = {
          backgroundColor = '#141517',
          color = '#FA8072',
          ['.description'] = {
              color = '#909296'
          }
      },
        icon = 't',
        iconColor = '#FA8072'
      }) return end
      ox_inventory:AddItem(src, 'th_sprunk', 2)
      exports['sd_skills']:IncreasePlayerXP(source, 'TACO', 10)
      lib.notify(source, {
        id = 'taco_job',
        title = 'Taco Hut',
        description = 'You have poured 2x Sprunk',
        showDuration = false,
        position = 'top-right',
        style = {
          backgroundColor = '#141517',
          color = '#FA8072',
          ['.description'] = {
              color = '#909296'
          }
      },
        icon = 't',
        iconColor = '#FA8072'
      })
  end)
  -- ECOLA --
  RegisterNetEvent('bd-tacojob:server:makeEcola', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if not ox_inventory:RemoveItem(src, 'th_carbonated_water', 2, false) then
      lib.notify(source, {
        id = 'taco_job',
        title = 'Taco Hut',
        description = 'You need 2x Carbonated Water to make Ecola',
        showDuration = false,
        position = 'top-right',
        style = {
          backgroundColor = '#141517',
          color = '#FA8072',
          ['.description'] = {
              color = '#909296'
          }
      },
        icon = 't',
        iconColor = '#FA8072'
      }) return end
      ox_inventory:AddItem(src, 'th_ecola', 2)
      exports['sd_skills']:IncreasePlayerXP(source, 'TACO', 10)
      lib.notify(source, {
        id = 'taco_job',
        title = 'Taco Hut',
        description = 'You have poured 2x Ecola',
        showDuration = false,
        position = 'top-right',
        style = {
          backgroundColor = '#141517',
          color = '#FA8072',
          ['.description'] = {
              color = '#909296'
          }
      },
        icon = 't',
        iconColor = '#FA8072'
      })
  end)
elseif Config.InventorySystem == 'qb' then
  ----- | MAKE Orang O Tang | -----
  RegisterNetEvent('bd-tacojob:server:makeOrangTang', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if not exports['qb-inventory']:RemoveItem(src, 'th_oranges', 2, false) then
      lib.notify(source, {
        id = 'taco_job',
        title = 'Taco Hut',
        description = 'You need Oranges to make a Orang-O-Tang',
        showDuration = false,
        position = 'top-right',
        style = {
          backgroundColor = '#141517',
          color = '#FA8072',
          ['.description'] = {
              color = '#909296'
          }
      },
        icon = 't',
        iconColor = '#FA8072'
      }) return end
    exports['qb-inventory']:AddItem(src, 'th_orangotang', 2, false, false)
    TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items['th_orangotang'], 'add', 2)
    exports['sd_skills']:IncreasePlayerXP(source, 'TACO', 10)
    lib.notify(source, {
      id = 'taco_job',
      title = 'Taco Hut',
      description = 'You have poured a Orang-O-Tang',
      showDuration = false,
      position = 'top-right',
      style = {
        backgroundColor = '#141517',
        color = '#FA8072',
        ['.description'] = {
            color = '#909296'
        }
    },
      icon = 't',
      iconColor = '#FA8072'
    })
  end)
  ----- | MAKE SPRUNK | -----
  RegisterNetEvent('bd-tacojob:server:makeSprunk', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if not exports['qb-inventory']:RemoveItem(src, 'th_carbonated_water', 2, false) then
      lib.notify(source, {
        id = 'taco_job',
        title = 'Taco Hut',
        description = 'You need Carbonated Water to make a Sprunk.',
        showDuration = false,
        position = 'top-right',
        style = {
          backgroundColor = '#141517',
          color = '#FA8072',
          ['.description'] = {
              color = '#909296'
          }
      },
        icon = 't',
        iconColor = '#FA8072'
      }) return end
    exports['qb-inventory']:AddItem(src, 'th_sprunk', 2, false, false)
    TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items['th_sprunk'], 'add', 2)
    exports['sd_skills']:IncreasePlayerXP(source, 'TACO', 10)
    lib.notify(source, {
      id = 'taco_job',
      title = 'Taco Hut',
      description = 'You have poured a Sprunk',
      showDuration = false,
      position = 'top-right',
      style = {
        backgroundColor = '#141517',
        color = '#FA8072',
        ['.description'] = {
            color = '#909296'
        }
    },
      icon = 't',
      iconColor = '#FA8072'
    })
  end)
  ----- | MAKE ECOLA | -----
  RegisterNetEvent('bd-tacojob:server:makeEcola', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if not exports['qb-inventory']:RemoveItem(src, 'th_carbonated_water', 2, false) then
      lib.notify(source, {
        id = 'taco_job',
        title = 'Taco Hut',
        description = 'You need Carbonated Water to make a Ecola',
        showDuration = false,
        position = 'top-right',
        style = {
          backgroundColor = '#141517',
          color = '#FA8072',
          ['.description'] = {
              color = '#909296'
          }
      },
        icon = 't',
        iconColor = '#FA8072'
      }) return end
    exports['qb-inventory']:AddItem(src, 'th_ecola', 2, false, false)
    TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items['th_ecola'], 'add', 2)
    exports['sd_skills']:IncreasePlayerXP(source, 'TACO', 10)
    lib.notify(source, {
      id = 'taco_job',
      title = 'Taco Hut',
      description = 'You have poured a Ecola',
      showDuration = false,
      position = 'top-right',
      style = {
        backgroundColor = '#141517',
        color = '#FA8072',
        ['.description'] = {
            color = '#909296'
        }
    },
      icon = 't',
      iconColor = '#FA8072'
    })
  end)
end
