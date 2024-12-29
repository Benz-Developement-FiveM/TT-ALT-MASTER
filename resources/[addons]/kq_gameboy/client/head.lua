ESX = nil

if Config.esx.enabled then
    Citizen.CreateThread(function()
        if Config.esx.useNewESXExport then
            ESX = exports['es_extended']:getSharedObject()
        else
            Citizen.CreateThread(function()
                while ESX == nil do
                    TriggerEvent('esx:getSharedObject', function(obj)
                        ESX = obj
                    end)
                    Citizen.Wait(0)
                end
            end)
        end
    end)
end

function PlayGameboyAnimation()
    TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_STAND_MOBILE', -1, true)
end

function StopPlayingGameboyAnimation()
    ClearPedTasks(PlayerPedId())
end
