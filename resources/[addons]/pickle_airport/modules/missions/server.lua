RegisterNetEvent("pickle_airport:finishedMission", function(index)
    local source = source
    if (PermissionCheck(source, "pilot_mission")) then
        local data = Config.Missions.Sequences[index]
        local rewards = data.Rewards
        for i=1, #rewards do 
            local amount = GetRandomInt(rewards[i].min, rewards[i].max)
            AddItem(source, rewards[i].name, amount)
            exports['sd_skills']:IncreasePlayerXP(source, 'PLANE PILOT', 150)
        end
    else
        ShowNotification(source, U.permission_denied)
    end
end)