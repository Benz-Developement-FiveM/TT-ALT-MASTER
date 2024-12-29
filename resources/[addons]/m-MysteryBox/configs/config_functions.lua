local QBCore = exports[Config.Utility.CoreName]:GetCoreObject()

function Notify(msg)
    QBCore.Functions.Notify(msg)
end

function progressBar()
    QBCore.Functions.Progressbar("AbrirMysteryBox", Language.OpenMystery, 2500, false, true, {disableMovement = true,disableCarMovement = true,disableMouse = false,
    disableCombat = true}, {animDict = "mp_arresting",anim = "a_uncuff",flags = 49}, {}, {}, function() end)
end
