local QBCore = exports['qb-core']:GetCoreObject()
local ox_inventory = exports.ox_inventory

if Config.TargetSystem == 'ox' then
	----- | CREATING COOK MENU LOCATION | -----
	exports.ox_target:addBoxZone({
		coords = vec4(10.9, -1598.95, 29.38, 222.49),
		size = vec3(2, 2, 2),
		rotation = 45,
		debug = drawZones,
		options = {
			{
				name = 'TacoJobCookMenu',
				event = 'bd-tacojob:client:OpenCookMenu',
				icon = 'fa-solid fa-fire-burner',
				label = 'Cook Menu',
				groups = {
					taco = 0
				},
			},
		}
	})
elseif Config.TargetSystem == 'qb' then
	----- | CREATING COOK MENU LOCATION | -----
	exports['qb-target']:AddBoxZone("TacoJobCookMenu", vector3(10.9, -1598.95, 29.38), 0.9, 0.9, {
		name = "TacoJobCookMenu",
		heading = 347.27,
		debugPoly = false,
		minZ = 29.38 - 2,
		maxZ = 29.38 + 2,
	}, {
		options = {
			{
				type = "client",
				event = "bd-tacojob:client:OpenCookMenu",
				icon = "fa-solid fa-fire-burner",
				label = "Cook Menu",
				job = "taco",
			},
		},
		distance = 2.5
	})
end
----- | CREATING COOK MENU | -----
lib.registerContext({
	id = 'taco_cook_menu',
	title = 'Cook Menu',
	options = {
	  {
		title = '2x Beef Burritos',
		description = 'You need 2x Tortillas',
		icon = 'utensils',
		iconColor = 'Salmon',
		event = 'bd-tacojob:client:makeBeefBurrito'
	  },
	  {
		title = '2x Beef Enchilada',
		description = 'You need 2x Tortillas',
		icon = 'utensils',
		iconColor = 'Salmon',
		event = 'bd-tacojob:client:makeBeefEnchilada'
	  },
	  {
		title = '2x Beef Taco',
		description = 'You need 2x Raw Ground Beef',
		icon = 'utensils',
		iconColor = 'Salmon',
		event = 'bd-tacojob:client:makeBeefTaco'
	  },
	  {
		title = '2x Chicken Burrito',
		description = 'You need 2x Tortillas',
		icon = 'utensils',
		iconColor = 'Salmon',
		event = 'bd-tacojob:client:makeChickenBurrito'
	  },
	  {
		title = '2x Chicken Caesar Wrap',
		description = 'You need 2x Tortillas',
		icon = 'utensils',
		iconColor = 'Salmon',
		event = 'bd-tacojob:client:makeChickenCaesarWrap'
	  },
	  {
		title = '2x Chicken Taco',
		description = 'You need 2x Raw Chicken',
		icon = 'utensils',
		iconColor = 'Salmon',
		event = 'bd-tacojob:client:makeChickenTaco'
	  },
	  {
		title = '2x Greek Veggie Wrap',
		description = 'You need 2x Tortillas',
		icon = 'utensils',
		iconColor = 'Salmon',
		event = 'bd-tacojob:client:makeVeggieWrap'
	  },
	  {
		title = '2x Nachos',
		description = 'You need 2x Tortilla Chips',
		icon = 'utensils',
		iconColor = 'Salmon',
		event = 'bd-tacojob:client:makeNachos'
	  },
	  {
		title = '2x Quesadilla',
		description = 'You need 4x Tortillas',
		icon = 'utensils',
		iconColor = 'Salmon',
		event = 'bd-tacojob:client:makeQuesadilla'
	  },
	}
  })
----- | REGISTERING MENU TO 'OpenCookMenu' | -----
RegisterNetEvent('bd-tacojob:client:OpenCookMenu', function()
    lib.showContext('taco_cook_menu')
end)

RegisterNetEvent('bd-tacojob:client:makeBeefBurrito', function()
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
		TriggerServerEvent('bd-tacojob:server:makeBeefBurrito')
	else
	end
end)
RegisterNetEvent('bd-tacojob:client:makeBeefEnchilada', function()
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
		TriggerServerEvent('bd-tacojob:server:makeBeefEnchilada')
	else
	end
end)
RegisterNetEvent('bd-tacojob:client:makeBeefTaco', function()
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
		TriggerServerEvent('bd-tacojob:server:makeBeefTaco')
	else
	end
end)
RegisterNetEvent('bd-tacojob:client:makeChickenBurrito', function()
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
		TriggerServerEvent('bd-tacojob:server:makeChickenBurrito')
	else
	end
end)
RegisterNetEvent('bd-tacojob:client:makeChickenCaesarWrap', function()
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
		TriggerServerEvent('bd-tacojob:server:makeChickenCaesarWrap')
	else
	end
end)
RegisterNetEvent('bd-tacojob:client:makeChickenTaco', function()
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
		TriggerServerEvent('bd-tacojob:server:makeChickenTaco')
	else
	end
end)
RegisterNetEvent('bd-tacojob:client:makeVeggieWrap', function()
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
		TriggerServerEvent('bd-tacojob:server:makeVeggieWrap')
	else
	end
end)
RegisterNetEvent('bd-tacojob:client:makeNachos', function()
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
		TriggerServerEvent('bd-tacojob:server:makeNachos')
	else
	end
end)
RegisterNetEvent('bd-tacojob:client:makeQuesadilla', function()
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
		TriggerServerEvent('bd-tacojob:server:makeQuesadilla')
	else
	end
end)
RegisterNetEvent('bd-tacojob:client:OpenCookMenu', function()
    lib.showContext('taco_cook_menu')
end)
