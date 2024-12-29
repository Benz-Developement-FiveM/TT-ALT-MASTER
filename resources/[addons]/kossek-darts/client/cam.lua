cameras = {}

CreateCam = function(name, pos, rot, fov)
    fov = fov or 60.0
    rot = rot or vector3(0, 0, 0)
    local cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", pos.x, pos.y, pos.z, rot.x, rot.y, rot.z, fov, false, 0)
    local try = 0
    while cam == -1 or cam == nil do
        Citizen.Wait(10)
        cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", pos.x, pos.y, pos.z, rot.x, rot.y, rot.z, fov, false, 0)
        try = try + 1
        if try > 20 then
            return nil
        end
    end

    local self = {}

    self.cam = cam
    self.position = pos
    self.rotation = rot
    self.fov = fov
    self.name = name
    self.lastPointTo = nil

    self.pointTo = function(pos)
        self.lastPointTo = pos
        PointCamAtCoord(self.cam, pos.x, pos.y, pos.z)
    end

    self.render = function()
        SetCamActive(self.cam, true)
        RenderScriptCams(true, true, 500, true, true)
    end

    self.attach = function(entity, offset)
        AttachCamToEntity(self.cam, entity, offset[1], offset[2], offset[3], true)
    end

    self.destroy = function()
        SetCamActive(self.cam, false)
        DestroyCam(self.cam)
        cameras[name] = nil
    end

    cameras[name] = self
    return self
end

StopRendering = function()
    RenderScriptCams(false, true, 500, true, true)
end
