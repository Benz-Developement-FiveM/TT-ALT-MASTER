----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local MenuName = Config.CoreSettings.MenuName
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

-- Checks player job against service jobs in config
function ServiceJob()
    local pJob = Core.Functions.GetPlayerData().job
    for i = 1, #Config.Plants.Outdoor.Services.Job, 1 do
        if pJob.name == Config.Plants.Outdoor.Services.Job[i].name then
            return true
        else 
            return false
        end
    end
end

-- Plant menu event
RegisterNetEvent('boii-weed:cl:PlantMenus', function(closestplant, plantdata)
    local Alive = {
        { 
            header = 'Plant ID: '..closestplant,
            txt = 'Strain: '..plantdata.strain..'</p>Gender: '..plantdata.gender..'</p>Hunger: '..math.floor(plantdata.hunger)..'%</p>Thirst: '..math.floor(plantdata.thirst)..'%</p>Quality: '..math.floor(plantdata.quality)..'%</p>Growth: '..math.floor(plantdata.growth)..'%',
            icon = 'fa-solid fa-cannabis',
            isMenuHeader = true
        },
        {
            header = 'Feed Plant',
            icon = 'fa-solid fa-bottle-water',
            params = {
                event = 'boii-weed:cl:Feed'
            }
        },
        {
            header = 'Water Plant',
            icon = 'fa-solid fa-droplet',
            params = {
                event = 'boii-weed:cl:Water'
            }
        },
        {
            header = 'Destroy Plant',
            icon = 'fa-solid fa-fire',
            params = {
                event = 'boii-weed:cl:Destroy',
            }
        },
        {
            header = 'Exit',
            icon = 'fa-solid fa-circle-xmark',
            params = {
                event = 'boii-weed:cl:StopMenu'
            }
        },
    }
    local Harvest = {
        { 
            header = 'Plant ID: '..closestplant,
            txt = 'Strain: '..plantdata.strain..'</p>Gender: '..plantdata.gender..'</p>Hunger: '..math.floor(plantdata.hunger)..'%</p>Thirst: '..math.floor(plantdata.thirst)..'%</p>Quality: '..math.floor(plantdata.quality)..'%</p>Growth: '..math.floor(plantdata.growth)..'%',
            icon = 'fa-solid fa-cannabis',
            isMenuHeader = true
        },
        {
            header = 'Harvest Plant',
            icon = 'fa-solid fa-scissors',
            params = {
                event = 'boii-weed:cl:Harvest',
            }
        },
        {
            header = 'Destroy Plant',
            icon = 'fa-solid fa-fire',
            params = {
                event = 'boii-weed:cl:Destroy',
            }
        },
        {
            header = 'Exit',
            icon = 'fa-solid fa-circle-xmark',
            params = {
                event = 'boii-weed:cl:StopMenu'
            }
        },
    }
    local Destroy = {
        { 
            header = 'Plant ID: '..closestplant,
            txt = 'Strain: '..plantdata.strain..'</p>Gender: '..plantdata.gender..'</p>Hunger: '..math.floor(plantdata.hunger)..'%</p>Thirst: '..math.floor(plantdata.thirst)..'%</p>Quality: '..math.floor(plantdata.quality)..'%</p>Growth: '..math.floor(plantdata.growth)..'%',
            icon = 'fa-solid fa-cannabis',
            isMenuHeader = true
        },
        {
            header = 'Destroy Plant',
            icon = 'fa-solid fa-fire',
            params = {
                event = 'boii-weed:cl:Destroy',
            }
        },
        {
            header = 'Exit',
            icon = 'fa-solid fa-circle-xmark',
            params = {
                event = 'boii-weed:cl:StopMenu'
            }
        },
    }
    if ServiceJob() then
        exports[MenuName]:openMenu(Destroy)
        return
    end
    if plantdata.growth >= 95 then -- If plant growth is above amount shown then harvest menu will open
        exports[MenuName]:openMenu(Harvest)
        return
    end
    if plantdata.hunger < 3 or plantdata.thirst < 3 or plantdata.quality < 3 then -- If plant hunger/water/quality is below amount shown then dead menu will open
        exports[MenuName]:openMenu(Destroy)
    else
        exports[MenuName]:openMenu(Alive)
    end
end)