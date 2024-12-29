Darts = {
	Player 		   = nil,
	PlayerPos 	   = vector3(0.0, 0.0, 0.0),

	Games	 	   = {},
	InBoard        = {},
	Raycast 	   = {},
	Objects 	   = {},

	Board 		   = nil,
	Dart  	       = nil,

	IsAiming       = nil,
	LastPoint      = nil,
	CurrentPoints  = nil,

	DuiObject 	   = nil,
	DuiReady 	   = false,

	InGame         = false,

	ThrowCount     = 0,
	Bullseyes 	   = 0,
	Points 		   = 0,
	TrianglePoints = {
        [0] = 20,
        [10] = 3,
        [1] = 1,
        [11] = 19,
        [2] = 18,
        [12] = 7,
        [3] = 4,
        [13] = 16,
        [4] = 13,
        [14] = 8,
        [5] = 6,
        [15] = 11,
        [6] = 10,
        [16] = 14,
        [7] = 15,
        [17] = 9,
        [8] = 2,
        [18] = 12,
        [9] = 17,
        [19] = 5,
        [20] = 20
    }
}

CreateThread(function()
	for i, model in pairs(MODELS.BOARDS) do
		MODELS.BOARDS[i] = GetHashKey(model)
	end

	for i, model in pairs(MODELS.DARTS) do
		MODELS.DARTS[i] = GetHashKey(model)
	end

	while true do
		Darts.Player = PlayerPedId()
		Darts.PlayerPos = GetEntityCoords(Darts.Player)
		Wait(500)
	end
end)

CreateThread(function()
	Darts.LoadAnim('anim@amb@clubhouse@mini@darts@')

    while true do
		local sleep = 500
        local closestDart = Darts.GetClosestDart(0.7)

        if closestDart then
			sleep = 3

			Darts.Board = closestDart

			if not Darts.InGame then
				local count = Darts.GetPlayersInGame(Darts.Board)

				Darts.DisplayHelpText(STRINGS.JOIN:format(count))
			else
				Darts.DisplayHelpText(STRINGS.LEAVE)
			end

			if IsDisabledControlJustPressed(0, CONTROLS.NOT_IN_GAME.JOIN_EXIT.key) then
				if not Darts.InGame then
					TriggerServerEvent('kossek-darts:joinGame', GetEntityCoords(Darts.Board))
					Darts.Setup()
				else
					TriggerServerEvent('kossek-darts:leaveGame', GetEntityCoords(Darts.Board))
					Darts.LeaveGame()
				end
			elseif IsDisabledControlJustPressed(0, CONTROLS.NOT_IN_GAME.CLEAR_BOARD.key) and Darts.InGame then
				Darts.ClearBoard()
			end
		end

        Citizen.Wait(sleep)
    end
end)

CreateThread(function()
	while true do
		local sleep = 500

		if Darts.InGame then
			sleep = 3

			Darts.Instruction(CONTROLS.IN_GAME)

			if IsDisabledControlJustPressed(0, CONTROLS.IN_GAME.THROW.key) and Darts.IsAiming then
				if Darts.ThrowCount < Config.max_throws then
					Darts.PlayAnim(ANIMS.THROW[1], ANIMS.THROW[2])
					Citizen.Wait(1300)
					Darts.Throw()
					Darts.IsAiming = false
					Darts.ThrowCount = Darts.ThrowCount + 1
				else
					Darts.ShowNotification((STRINGS.MAX_THROWS):format(Config.max_throws))
				end
			elseif IsDisabledControlJustPressed(0, CONTROLS.IN_GAME.AIM.key) and not Darts.IsAiming then
				Darts.IsAiming = true
				
				Darts.PlayAnim(ANIMS.AIM[1][1], ANIMS.AIM[1][2])
				Citizen.Wait(550)
				Darts.AttachEntity(Darts.Dart, 57005, { 0.13, 0.0, -0.01 }, { -58.0, 37.0, 2.0 })
				Citizen.Wait(2000)
				Darts.PlayAnim(ANIMS.AIM[2][1], ANIMS.AIM[2][2])

				cam = CreateCam('throw_cam', Darts.PlayerPos, GetEntityRotation(Darts.Player))
				cam.render()
				cam.attach(Darts.Player, vec3(-0.18, 0.1, 0.7))
			end
		end

		Citizen.Wait(sleep)
	end
end)

CreateThread(function()
	while true do
		local sleep = 500

		if Darts.IsAiming then
			sleep = 3

			local hit, coords, entity = RayCastCamera(20.0)

			Darts.Raycast = {
				hit = hit, 
				coords = vec3(coords.x, coords.y, coords.z),
				entity = entity
			}
			
			if cameras['throw_cam'] then
				cameras['throw_cam'].pointTo(Darts.Raycast.coords)
			end
		end

		Citizen.Wait(sleep)
	end
end)

CreateThread(function()
    while not NetworkIsSessionStarted() do Wait(50) end

	local scaleformName = 'dart_scaleform'
	SFHandle = RequestScaleformMovie(scaleformName)
	while not HasScaleformMovieLoaded(SFHandle) do
		Wait(33)
	end
end)

local URL = ('nui://%s/html/index.html'):format(GetCurrentResourceName())

CreateThread(function()
    while true do
		Wait(500)

		if Darts.InGame then
			local closestDart = Darts.GetClosestDart(Config.draw_dui_distance)

			if closestDart then
				if GetEntityCoords(closestDart) == GetEntityCoords(Darts.Board) then
					if SFHandle then
						Darts.DuiObject = CreateDui(URL, 1280, 720)
						while not IsDuiAvailable(Darts.DuiObject) do
							Wait(0)
						end

						local dui = GetDuiHandle(Darts.DuiObject)
						CreateRuntimeTextureFromDuiHandle(CreateRuntimeTxd('video'), 'test', dui)

						PushScaleformMovieFunction(SFHandle, 'SET_TEXTURE')
						PushScaleformMovieMethodParameterString('video')
						PushScaleformMovieMethodParameterString('test')

						PushScaleformMovieFunctionParameterInt(0)
						PushScaleformMovieFunctionParameterInt(0)
						PushScaleformMovieFunctionParameterInt(1920)
						PushScaleformMovieFunctionParameterInt(1080)

						PopScaleformMovieFunctionVoid()

						Darts.DuiReady = true

						while #(Darts.PlayerPos - GetEntityCoords(closestDart)) <= Config.draw_dui_distance and Darts.InGame do
							Wait(0)
							DrawScaleformMovie_3dSolid(SFHandle, GetOffsetFromEntityInWorldCoords(closestDart, Config.dui_offset.x, Config.dui_offset.y, Config.dui_offset.z), 0.0, GetEntityHeading(closestDart) * -1, -30.0, 2.0, 2.0, 2.0, 0.052 * 1, 0.052 * (9 / 16), 1, 2)
						end

						local dst = #(Darts.PlayerPos - GetEntityCoords(Darts.Board))

						if dst >= Config.draw_dui_distance then
							DestroyDui(Darts.DuiObject)
							Darts.LeaveGame()
						end
					end
				end
			end
		end
    end
end)

RegisterNetEvent('kossek-darts:updateData')
AddEventHandler('kossek-darts:updateData', function(Games)
	Darts.Games = Games

	if Darts.InGame then
		for _, data in pairs(Darts.Games) do
			if data.board == GetEntityCoords(Darts.Board) then

				while not Darts.DuiReady do
					Wait(1000)
				end

				local nui = {}
				local players = Darts.TableSort(data.players)
				
				for _, val in pairs(players) do
					local color = 'rgb(255, 255, 255)'

					if val.src == GetPlayerServerId(PlayerId()) then
						color = '#38ef7d'
					end

					table.insert(nui, [[
						<div class='scoreboard-player-card'> 
							<p class='scoreboard-player-name' style='color:]] .. color .. [[;'>]] .. val.name .. [[</p> 
							<p class='scoreboard-player-bullseyes'>]] .. val.bullseyes .. [[</p> 
							<p class='scoreboard-player-points'>]] .. val.points .. [[</p> 
						</div>
					]])
				end

				SendDuiMessage(Darts.DuiObject, json.encode({
					type = 'update-scoreboard',
					nui = nui
				}))
			end
		end
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		if DoesEntityExist(Darts.Dart) then
			DeleteEntity(Darts.Dart)
		end

		for _, v in pairs(Darts.Objects) do
			if DoesEntityExist(v) then
				DeleteEntity(v)
			end
		end
	end
end)

Darts.GetClosestDart = function(dist)
    local nearObject = nil

    if not nearObject then
		for _, model in ipairs(MODELS.BOARDS) do
			local objHandle = GetClosestObjectOfType(Darts.PlayerPos, dist, model, false)
			if DoesEntityExist(objHandle) then
				nearObject = objHandle
			end
		end
    end
    return nearObject
end

Darts.Throw = function()
	ClearPedTasks(Darts.Player)

	local dst = #(Darts.PlayerPos - GetEntityCoords(Darts.Board))

	if dst <= Config.throw_distance then
		DetachEntity(Darts.Dart, false)
		Citizen.Wait(10)
		FreezeEntityPosition(Darts.Dart, false)

		local force = Config.throwing_force()
		local rot = GetEntityRotation(Darts.Dart)
		SetEntityVelocity(Darts.Dart, GetEntityForwardX(Darts.Player) * force, GetEntityForwardY(Darts.Player) * force, 1.1)
		cam.destroy()
		StopRendering()

	    local tick = 150
		while true do
			Citizen.Wait(0)
			local dartCoords = GetEntityCoords(Darts.Dart)
			local boardCoords = GetEntityCoords(Darts.Board)
			local dst = #(dartCoords - boardCoords)
			if dst <= 0.5 then
				SetEntityCoordsNoOffset(Darts.Dart, Darts.Raycast.coords.x, Darts.Raycast.coords.y, Darts.Raycast.coords.z)
				SetEntityRotation(Darts.Dart, rot.x, rot.y, rot.z)
				FreezeEntityPosition(Darts.Dart, true)
				table.insert(Darts.Objects, Darts.Dart)

				Darts.UpdatePoints()

				local model = MODELS.DARTS[math.random(1, #MODELS.DARTS)]
				Darts.LoadModel(model)
				Darts.Dart = CreateObject(model, Darts.PlayerPos, true, true, true)
				Darts.AttachEntity(Darts.Dart, 18905, { 0.12, 0.03, 0.02 }, { 38.0, -4.0, 0.0 })
				break
			else
				tick = tick - 1

				if tick <= 0 then
					table.insert(Darts.Objects, Darts.Dart)
					local anim = ANIMS.FAIL[math.random(1, #ANIMS.FAIL)]

					Darts.PlayAnim(anim[1], anim[2], 1500)
					Darts.ShowNotification(STRINGS.MISSED)

					local model = MODELS.DARTS[math.random(1, #MODELS.DARTS)]

					Darts.LoadModel(model)
					Darts.Dart = CreateObject(model, Darts.PlayerPos, true, true, true)
					Darts.AttachEntity(Darts.Dart, 18905, { 0.12, 0.03, 0.02 }, { 38.0, -4.0, 0.0 })
					break
				end
			end
		end
	else
		Darts.ShowNotification(STRINGS.TOO_FAR)
	end

	table.wipe(Darts.Raycast)
end

Darts.UpdatePoints = function()
	local realOffset = GetOffsetFromEntityGivenWorldCoords(Darts.Board, GetEntityCoords(Darts.Dart))
	local offset = vector3(realOffset.x + 0.0041, realOffset.y, realOffset.z + 0.0002)
	local distance = math.sqrt((offset.x * offset.x) + (offset.z * offset.z))
	local angle = GetAngleBetween_2dVectors(0.0, 1.0, offset.x, offset.z)

	local points = 0
	local pointsMultiplier = 1
	if distance < 0.009 then
		points = 50
		Darts.Bullseyes = Darts.Bullseyes + 1
	elseif distance < 0.021 then
		points = 25
	elseif distance > 0.3 then
		points = 0
	elseif distance >= 0.226 then
		points = 0
	else
		if distance > 0.1285 and distance < 0.1405 then
			pointsMultiplier = 3
		elseif distance > 0.2132 and distance < 0.226 then
			pointsMultiplier = 2
		else
			pointsMultiplier = 1
		end

		if realOffset.x < 0 then
			angle = 360 - angle
		end

		local a = 0
		local triangle = 0
		while triangle < 21 do
			if angle >= (a - 9.0) and angle < (a + 9.0) then
				points = Darts.TrianglePoints[triangle] * pointsMultiplier
			end
			a = a + 18.0
			triangle = triangle + 1
		end
	end

	Darts.Points = Darts.Points + points
	Darts.ShowNotification(STRINGS.POINTS:format(points))

	TriggerServerEvent('kossek-darts:updatePoints', GetEntityCoords(Darts.Board), Darts.Points, Darts.Bullseyes)
end

Darts.Setup = function()
	Darts.InGame = true

	local model = MODELS.DARTS[math.random(1, #MODELS.DARTS)]
	Darts.LoadModel(model)
	
	Darts.Dart = CreateObject(model, Darts.PlayerPos, true, true, true)
	Darts.AttachEntity(Darts.Dart, 18905, { 0.12, 0.03, 0.02 }, { 38.0, -4.0, 0.0 })
end

Darts.LeaveGame = function()
	Darts.InGame = false
	Darts.DuiReady = false
	Darts.IsAiming = false
	Darts.ThrowCount = 0

	TriggerServerEvent('kossek-darts:leaveGame', GetEntityCoords(Darts.Board))

	if DoesEntityExist(Darts.Dart) then
		DeleteEntity(Darts.Dart)
	end

	if cameras['throw_cam'] then
		cameras['throw_cam'].destroy()
		StopRendering()
	end

	Darts.ShowNotification(STRINGS.LEAVE_GAME)
end

Darts.AttachEntity = function(entity, bone, offsets, rotation)
	if IsEntityAttached(entity) then
		DetachEntity(entity)
	end

	bone = GetPedBoneIndex(Darts.Player, bone)

	AttachEntityToEntity(entity, Darts.Player, bone, offsets[1], offsets[2], offsets[3], rotation[1], rotation[2], rotation[3], true, true, false, false, 1, true)
end

Darts.Instruction = function(steeringButtons)
	local instructionScaleform = RequestScaleformMovie("instructional_buttons")

	while not HasScaleformMovieLoaded(instructionScaleform) do
		Wait(0)
	end

	PushScaleformMovieFunction(instructionScaleform, "CLEAR_ALL")
	PushScaleformMovieFunction(instructionScaleform, "TOGGLE_MOUSE_BUTTONS")
	PushScaleformMovieFunctionParameterBool(0)
	PopScaleformMovieFunctionVoid()
	
	local index = 1
	for _, data in pairs(steeringButtons) do
		PushScaleformMovieFunction(instructionScaleform, "SET_DATA_SLOT")
		PushScaleformMovieFunctionParameterInt(index - 1)

		PushScaleformMovieMethodParameterButtonName(data.button)
		PushScaleformMovieFunctionParameterString(data.label)
		PopScaleformMovieFunctionVoid()

		DisableControlAction(0, data.key, true)

		index = index + 1
	end

	PushScaleformMovieFunction(instructionScaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
	PushScaleformMovieFunctionParameterInt(-1)
	PopScaleformMovieFunctionVoid()
	DrawScaleformMovieFullscreen(instructionScaleform, 255, 255, 255, 255)
end

Darts.ClearBoard = function()
	Darts.ThrowCount = 0

	Darts.PlayAnim(ANIMS.CLEAR[1], ANIMS.CLEAR[2], 1500)
	Darts.ShowNotification(STRINGS.PULLED_OUT)

	local pool = GetGamePool('CObject')

	for _, object in ipairs(pool) do
		for _, model in ipairs(MODELS.DARTS) do
			if GetEntityModel(object) == model and not IsEntityAttachedToEntity(object, Darts.Player) then
				local objCoords = GetEntityCoords(object)

				if #(Darts.PlayerPos - objCoords) <= 2.0 then
					SetEntityAsMissionEntity(object, true, true)
					NetworkRequestControlOfEntity(object)
					while not NetworkHasControlOfEntity(object) do
						Citizen.Wait(0)
					end

					DeleteEntity(object)
				end
			end
		end
	end
end

Darts.GetPlayersInGame = function(board)
	board = GetEntityCoords(board)

	for _, data in pairs(Darts.Games) do
		if data.board == board then
			return #data.players
		end
	end

	return 0
end

Darts.DisplayHelpText = function(str)
	BeginTextCommandDisplayHelp("STRING")
	AddTextComponentSubstringPlayerName(str)
	EndTextCommandDisplayHelp(0, 0, 1, -1)
end

Darts.ShowNotification = function(msg)
	Config.notification(msg)
end

Darts.LoadAnim = function(lib)
	while not HasAnimDictLoaded(lib) do
		RequestAnimDict(lib)
		Citizen.Wait(5)
	end
end

Darts.LoadModel = function(model)
	model = type(model) == 'number' and model or GetHashKey(model)
	
	while not HasModelLoaded(model) do
		RequestModel(model)
		Citizen.Wait(50)
	end
end

Darts.PlayAnim = function(lib, anim, time)
	ClearPedTasks(Darts.Player)
	
	TaskPlayAnim(Darts.Player, lib, anim, 8.0, -8, -1, 51, false, false, false, false)
	if time then
		Citizen.Wait(time)
		ClearPedTasks(Darts.Player)
	end
end

Darts.TableSort = function(t)
	table.sort(t, function(a, b)
		return a.points > b.points
	end)
	
	return t
end