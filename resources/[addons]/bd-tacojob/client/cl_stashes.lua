local QBCore = exports['qb-core']:GetCoreObject()
local ox_inventory = exports.ox_inventory

----- | CREATING INVENTORIES | -----
if Config.TargetSystem == 'ox' then
	-- FRONT COUNTER --
	exports.ox_target:addBoxZone({
		coords = vec4(10.77, -1604.91, 29.49, 222.49),
		size = vec3(2, 2, 2),
		rotation = 45,
		debug = drawZones,
		options = {
			{
				name = 'tacohut_fronttray1',
				event = 'bd-tacojob:client:frontTray1',
				icon = 'fa-solid fa-equals',
				label = 'Counter',
			},
		}
	})
	-- FRIDGE --
	exports.ox_target:addBoxZone({
		coords = vec4(12.39, -1600.8, 29.38, 222.49),
		size = vec3(2, 2, 2),
		rotation = 45,
		debug = drawZones,
		options = {
			{
				name = 'tacohut_jobfridge',
				event = 'bd-tacojob:client:jobFridge',
				icon = 'fa-solid fa-temperature-empty',
				label = 'Fridge',
				groups = {
					taco = 0
				},
			},
		}
	})
	-- STORAGE --
	exports.ox_target:addBoxZone({
		coords = vec4(20.75, -1601.4, 29.38, 222.49),
		size = vec3(2, 2, 2),
		rotation = 45,
		debug = drawZones,
		options = {
			{
				name = 'tacohut_jobStorage',
				event = 'bd-tacojob:client:jobStorage',
				icon = 'fa-solid fa-temperature-empty',
				label = 'Storage',
				groups = {
					taco = 0
				},
			},
		}
	})
	-- SHOP --
	exports.ox_target:addBoxZone({
		coords = vec4(17.45, -1599.1, 29.29, 143.94),
		size = vec3(2, 2, 2),
		rotation = 45,
		debug = drawZones,
		options = {
			{
				name = 'tacohut_shop',
				icon = 'fa-solid fa-shopping-basket',
				label = 'Ingredient Shop',
				groups = {
					taco = 0
				},
				onSelect = function ()
					exports.ox_inventory:openInventory('shop', {type = 'thshop'})
				end
			},
		},
	})
elseif Config.TargetSystem == 'qb' then
	-- FRONT COUNTER --
	exports['qb-target']:AddBoxZone("TacoJobFrontTray1", vector3(10.77, -1604.91, 29.37), 0.9, 0.9, {
		name = "TacoJobFrontTray1",
		heading = 347.27,
		debugPoly = false,
		minZ = 29.37 - 2,
		maxZ = 29.37 + 2,
	}, {
		options = {
			{
				type = "client",
				event = "bd-tacojob:client:frontTray1",
				icon = "fa-solid fa-equals",
				label = "Counter",
			},
		},
		distance = 2.5
	})
	-- FRIDGE --
	exports['qb-target']:AddBoxZone("TacoJobJobFridge", vector3(12.39, -1600.8, 29.38), 0.9, 0.9, {
		name = "TacoJobJobFridge",
		heading = 347.27,
		debugPoly = false,
		minZ = 29.38 - 2,
		maxZ = 29.38 + 2,
	}, {
		options = {
			{
				type = "client",
				event = "bd-tacojob:client:jobFridge",
				icon = "fa-solid fa-temperature-empty",
				label = "Fridge",
				job = "taco",
			},
		},
		distance = 2.5
	})
	-- STORAGE --
	exports['qb-target']:AddBoxZone("TacoJobJobStorage", vector3(20.75, -1601.4, 29.38), 0.9, 0.9, {
		name = "TacoJobJobStorage",
		heading = 347.27,
		debugPoly = false,
		minZ = 29.38 - 2,
		maxZ = 29.38 + 2,
	}, {
		options = {
			{
				type = "client",
				event = "bd-tacojob:client:jobStorage",
				icon = "fa-solid fa-box",
				label = "Storage",
				job = "taco",
			},
		},
		distance = 2.5
	})
	-- SHOP --
	exports['qb-target']:AddBoxZone("TacoJobShop", vector3(17.23, -1599.24, 29.38), 0.9, 0.9, {
		name = "TacoJobShop",
		heading = 347.27,
		debugPoly = false,
		minZ = 29.38 - 2,
		maxZ = 29.38 + 2,
	}, {
		options = {
			{
				type = "client",
				event = "bd-tacojob:client:ingredientShop",
				icon = "fa-solid fa-basket-shopping",
				label = "Ingredients",
				job = "taco",
			},
		},
		distance = 2.5
	})
end

if Config.InventorySystem == 'ox' then
	-- FRONT COUNTER --
	RegisterNetEvent('bd-tacojob:client:frontTray1', function()
		if ox_inventory:openInventory('stash', 'frontTray') == false then
			TriggerServerEvent('ox:frontTray')
			ox_inventory:openInventory('stash', 'frontTray')
		end
	end)
	-- FRIDGE --
	RegisterNetEvent('bd-tacojob:client:jobFridge', function()
		if ox_inventory:openInventory('stash', 'jobFridge') == false then
			TriggerServerEvent('ox:jobFridge')
			ox_inventory:openInventory('stash', 'jobFridge')
		end
	end)
	-- STORAGE --
	RegisterNetEvent('bd-tacojob:client:jobStorage', function()
		if ox_inventory:openInventory('stash', 'jobStorage') == false then
			TriggerServerEvent('ox:jobStorage')
			ox_inventory:openInventory('stash', 'jobStorage')
		end
	end)
elseif Config.InventorySystem == 'qb' then
	-- FRONT COUNTER --
	RegisterNetEvent("bd-tacojob:client:frontTray1", function()
		TriggerServerEvent('bd-tacojob:server:frontTray1')
	end)
	-- FRIDGE --
	RegisterNetEvent("bd-tacojob:client:jobFridge", function()
		TriggerServerEvent('bd-tacojob:server:jobFridge')
	end)
	-- STORAGE --
	RegisterNetEvent("bd-tacojob:client:jobStorage", function()
		TriggerServerEvent('bd-tacojob:server:jobStorage')
	end)
	-- SHOP --
	RegisterNetEvent("bd-tacojob:client:ingredientShop", function()
		TriggerServerEvent('bd-tacojob:server:ingredientShop')
	end)
end
