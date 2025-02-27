local gameName = GetGameName()

---TAKEN FROM rcore framework
---https://githu.com/Isigar/relisoft_core
---https://docs.rcore.cz
local dbg = RDebug()

local markersV2 = {}
local nearMarkersV2 = {}
local isNearSomething = false

local getPed = PlayerPedId
local getCoords = GetEntityCoords

--Only near
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.CheckPlayerPosition or 750)
        isNearSomething = false
        local ped = getPed()
        local coords = getCoords(ped)
        for i, self in pairs(markersV2) do
            local distance = #(coords - self.position)
            if distance < Config.HelpPointRenderDistance then
                nearMarkersV2[self.id] = self
                isNearSomething = true
            else
                self.rendering = false
                markersV2[i] = self
                nearMarkersV2[self.id] = nil
            end
        end
    end
end)

----Position thread
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(300)
        if not isNearSomething then
            Wait(500)
        end

        local ped = getPed()
        local coords = getCoords(ped)
        for i, self in pairs(nearMarkersV2) do
            local distance = #(coords - self.position)
            if distance <= self.renderDistance and not self.destroyed then
                self.rendering = true
                if distance <= self.inRadius then
                    if self.isIn == false then
                        if self.onEnter ~= nil then
                            local status, err = pcall(self.onEnter)
                            if err then
                                dbg.critical('Cannot call onEnter because %s %s', status, err)
                            end
                        end
                    end
                    self.isIn = true
                else
                    if self.isIn then
                        if self.onLeave ~= nil then
                            local status, err = pcall(self.onLeave)
                            if err then
                                dbg.critical('Cannot call onLeave because %s %s', status, err)
                            end
                        end
                        self.isIn = false
                    end
                end
            else
                self.rendering = false
            end
            nearMarkersV2[i] = self
        end
    end
end)

function decimalToHex(num)
    num = tonumber(num)

    if num == 0 then
        return '0'
    end

    local neg = false
    if num < 0 then
        neg = true
        num = num * -1
    end
    local hexstr = "0123456789ABCDEF"
    local result = ""

    while num > 0 do
        local n = math.fmod(num, 16)
        result = string.sub(hexstr, n + 1, n + 1) .. result
        num = math.floor(num / 16)
    end
    if neg then
        result = '-' .. result
    end
    return result
end

--Render thread
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if not isNearSomething then
            Wait(400)
        end
        for i, self in pairs(nearMarkersV2) do
            if self.rendering and not self.destroyed and not self.stopRendering then
                if self.isIn then
                    for _, key in pairs(self.keys) do
                        if IsControlJustReleased(0, key) then
                            if self.onKey ~= nil then
                                local status, err = pcall(self.onKey, key)
                                if err then
                                    dbg.critical('Cannot call onKey because %s %s', status, err)
                                end
                            end
                        end
                    end
                end

                if gameName == GameType.REDM then
                    Citizen.InvokeNative(0x2A32FAA57B937173,
                        self.type,
                        self.position.x,
                        self.position.y,
                        self.position.z,
                        self.dir.x,
                        self.dir.y,
                        self.dir.z,
                        self.rot.x,
                        self.rot.y,
                        self.rot.z,
                        self.scale.x,
                        self.scale.y,
                        self.scale.z,
                        self.color.r,
                        self.color.g,
                        self.color.b,
                        self.color.a,
                        false,
                        self.faceCamera,
                        2,
                        self.rotation, nil, nil, false)
                elseif gameName == GameType.FIVEM then
                    DrawMarker(
                        self.type,
                        self.position.x,
                        self.position.y,
                        self.position.z,
                        self.dir.x,
                        self.dir.y,
                        self.dir.z,
                        self.rot.x,
                        self.rot.y,
                        self.rot.z,
                        self.scale.x,
                        self.scale.y,
                        self.scale.z,
                        self.color.r,
                        self.color.g,
                        self.color.b,
                        self.color.a,
                        false,
                        self.faceCamera,
                        2,
                        self.rotation, nil, nil, false
                    )
                end
            end
        end
    end
end)

function createMarker(id, res)
    if markersV2[id] ~= nil then
        pcall(markersV2[id].destroy)
    end

    local self = {}
    self.id = id
    self.type = 1
    self.faceCamera = true
    self.firstUpdate = false
    self.resource = res
    self.renderDistance = 20
    self.position = vector3(0, 0, 0)
    self.dir = vector3(0, 0, 0)
    self.rot = vector3(0, 0, 0)
    self.scale = vector3(1, 1, 1)
    self.rotation = false
    self.rendering = false
    self.stopRendering = false
    self.keys = {}
    self.onEnter = nil
    self.onLeave = nil
    self.onKey = nil
    self.isIn = false
    self.inRadius = 1.5
    self.color = {
        r = 255,
        g = 255,
        b = 255,
        a = 255
    }
    self.setId = function(param)
        self.id = param
        self.update()
    end
    self.getId = function()
        return self.id
    end
    self.setType = function(param)
        self.type = tonumber(param)
        self.update()
    end
    self.getType = function()
        return self.type
    end
    self.setPosition = function(pos)
        self.position = pos
        self.update()
        return self
    end
    self.getPosition = function()
        return self.position
    end
    self.setDir = function(param)
        self.dir = param
        self.update()
    end
    self.getDir = function()
        return self.dir
    end
    self.setScale = function(param)
        self.scale = param
        self.update()
    end
    self.getScale = function()
        return self.scale
    end
    self.setColor = function(param)
        self.color = param
        self.update()
    end
    self.getColor = function()
        return self.color
    end
    self.setAlpha = function(param)
        self.color.a = param
        self.update()
    end
    self.getAlpha = function()
        return self.color.a
    end
    self.setRed = function(param)
        self.color.r = param
        self.update()
    end
    self.getRed = function()
        return self.color.r
    end
    self.setGreen = function(param)
        self.color.g = param
        self.update()
    end
    self.getGreen = function()
        return self.color.g
    end
    self.setBlue = function(param)
        self.color.b = param
        self.update()
    end
    self.getBlue = function()
        return self.color.b
    end
    self.setRenderDistance = function(distance)
        self.renderDistance = distance
        self.update()
        return self
    end
    self.getRenderDistance = function()
        return self.renderDistance
    end
    self.setRotationBool = function(param)
        self.rotation = param
        self.update()
    end
    self.setFaceCamera = function(param)
        self.faceCamera = param
        self.update()
    end
    self.setRotation = function(param)
        self.rot = param
        self.update()
    end
    self.getRotation = function()
        return self.rotation
    end
    self.setInRadius = function(param)
        self.inRadius = param
        self.update()
    end
    self.getInRadius = function()
        return self.inRadius
    end
    self.render = function()
        dbg.debug('Start render marker id %s', self.getId())
        self.stopRendering = false
        self.rendering = true;
        self.firstUpdate = false
        self.update()
        return self
    end
    self.stopRender = function()
        self.stopRendering = true
        self.rendering = false
        self.update()
    end
    self.destroy = function()
        self.stopRendering = true
        self.rendering = false
        self.destroyed = true
        self.update(true)
        dbg.debug('Deleted marker V2 %s', self.getId())
    end
    self.isRendering = function()
        return self.rendering
    end
    self.setKeys = function(keys)
        self.keys = keys
        self.update()
        return self
    end
    self.getKeys = function()
        return self.keys
    end
    self.on = function(type, cb)
        if string.lower(type) == 'enter' then
            self.onEnter = cb
        elseif string.lower(type) == 'leave' then
            self.onLeave = cb
        elseif string.lower(type) == 'key' then
            self.onKey = cb
        else
            RDebug.critical('Cannot create on state at 3D text because invalid state %s', self.state)
        end
        self.update()
    end
    self.update = function(destroy)
        if self.firstUpdate then
            dbg.debug('First update ending')
            return
        end

        if destroy then
            for ind, v in pairs(nearMarkersV2) do
                if v.getId() == self.getId() then
                    nearMarkersV2[ind] = nil
                    dbg.debug('Deleted %s text from near table', self.getId())
                end
            end

            for ind, v in pairs(markersV2) do
                if v.getId() == self.getId() then
                    markersV2[ind] = nil
                    dbg.debug('Deleted %s text from master table', self.getId())
                end
            end
        else
            for ind, v in pairs(markersV2) do
                if v.getId() == self.getId() then
                    markersV2[ind] = v
                end
            end
        end
    end
    dbg.debug('Create new marker V2 %s', self.getId())
    table.insert(markersV2, self)
    return self
end

exports('createMarker', createMarker)

AddEventHandler('onResourceStop', function(res)
    for i, v in pairs(markersV2) do
        if v.resource == res then
            v.destroy()
        end
    end
end)
