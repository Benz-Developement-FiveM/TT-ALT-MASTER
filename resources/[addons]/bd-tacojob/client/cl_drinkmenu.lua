local QBCore = exports['qb-core']:GetCoreObject()
local ox_inventory = exports.ox_inventory

if  Config.TargetSystem == 'ox' then
  ----- | CREATING DRINK MENU LOCATION | -----
  exports.ox_target:addBoxZone({
		coords = vec4(13.32, -1595.9, 29.38, 222.49),
		size = vec3(2, 2, 2),
		rotation = 45,
		debug = drawZones,
		options = {
			{
				name = 'tacojobdrinkmenu',
				event = 'bd-tacojob:client:OpenDrinkMenu',
				icon = 'fa-solid fa-faucet-drip',
				label = 'Drinks Menu',
				groups = {
					taco = 0
				},
			},
		}
	})
elseif Config.TargetSystem == 'qb' then
  ----- | CREATING DRINK MENU LOCATION | -----
  exports['qb-target']:AddBoxZone("TacoJobDrinkMenu", vector3(13.32, -1595.9, 29.38), 0.9, 0.9, {
    name = "TacoJobDrinkMenu",
    heading = 347.27,
    debugPoly = false,
    minZ = 29.38 - 2,
    maxZ = 29.38 + 2,
  }, {
    options = {
      {
              type = "client",
              event = "bd-tacojob:client:OpenDrinkMenu",
        icon = "fa-solid fa-faucet-drip",
        label = "Drink Menu",
        job = "taco",
      },
    },
    distance = 2.5
  })
end

----- | CREATING DRINK MENU | -----
lib.registerContext({
    id = 'taco_drink_menu',
    title = 'Drink Menu',
    options = {
      /*{
        title = '2x Ecola',
        description = 'You need 2x Carbonated Water',
        icon = 'faucet',
        iconColor = 'Red',
        event = 'bd-tacojob:client:makeEcola'
      }, UN COMMENT THIS IF YOU WANT TO ADD ECOLA */
      {
        title = '2x Sprunk',
        description = 'You need 2x Carbonated Water',
        icon = 'faucet',
        iconColor = 'SpringGreen',
        event = 'bd-tacojob:client:makeSprunk'
      },
      {
        title = '2x Orang-O-Tang',
        description = 'You need 2x Oranges',
        icon = 'faucet',
        iconColor = 'DarkOrange',
        event = 'bd-tacojob:client:makeOrangTang'
      },
    }
})
----- | REGISTERING MENU TO 'OpenDrinkMenu' | -----
RegisterNetEvent('bd-tacojob:client:OpenDrinkMenu', function()
    lib.showContext('taco_drink_menu')
end)

RegisterNetEvent('bd-tacojob:client:makeOrangTang', function()
  if lib.progressCircle({
    duration = 1250,
    position = 'bottom',
    useWhileDead = false,
    canCancel = true,
    disable = {
      move = true,
      car = true,
      combat = true,
    },
    anim = {
      dict = 'mini@repair',
      clip = 'fixing_a_player',
      scenario = 'mini@repair',
    },
  }) then
    TriggerServerEvent('bd-tacojob:server:makeOrangTang')
  else
  end
end)

RegisterNetEvent('bd-tacojob:client:makeSprunk', function()
  if lib.progressCircle({
    duration = 1250,
    position = 'bottom',
    useWhileDead = false,
    canCancel = true,
    disable = {
      move = true,
      car = true,
      combat = true,
    },
    anim = {
      dict = 'mini@repair',
      clip = 'fixing_a_player',
      scenario = 'mini@repair',
    },
  }) then
    TriggerServerEvent('bd-tacojob:server:makeSprunk')
  else
  end
end)

RegisterNetEvent('bd-tacojob:client:makeEcola', function()
  if lib.progressCircle({
    duration = 1250,
    position = 'bottom',
    useWhileDead = false,
    canCancel = true,
    disable = {
      move = true,
      car = true,
      combat = true,
    },
    anim = {
      dict = 'mini@repair',
      clip = 'fixing_a_player',
      scenario = 'mini@repair',
    },
  }) then
    TriggerServerEvent('bd-tacojob:server:makeEcola')
  else
  end
end)

