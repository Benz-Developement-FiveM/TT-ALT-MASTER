----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local MenuName = Config.CoreSettings.MenuName
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

local MainMenu = {
    {
        header = 'Skills & Reputation',
        txt = 'View your skills or job reputation here!',
        icon = 'fa-solid fa-arrow-up-right-dots',
        isMenuHeader = true
    },
    {
        header = 'Skills',
        txt = 'View your skill progression here!',
        icon = 'fa-regular fa-thumbs-up',
        params = {
            event = 'boii-simpleskills:cl:SkillMenus',
            args = 1
        }
    },
    {
        header = 'Job Reputation',
        txt = 'View your job reputation here!',
        icon = 'fa-solid fa-briefcase',
        params = {
            event = 'boii-simpleskills:cl:SkillMenus',
            args = 2
        }
    },
    {
        header = 'Exit',
        icon = 'fa-solid fa-circle-xmark',
        params = {
            event = 'boii-drugs:cl:StopMenu'
        }
    }
}

-- Skills



-- Events
RegisterNetEvent('boii-simpleskills:cl:SkillMenu', function()
    exports[MenuName]:openMenu(MainMenu)
end)

RegisterNetEvent('boii-simpleskills:cl:SkillMenus', function(args)
    local pData = Core.Functions.GetPlayerData()
    local args = tonumber(args)
    if args == 1 then
        local Skills = {
            {
                header = 'Skills',
                txt = 'View your current experience here!',
                icon = 'fa-solid fa-arrow-up-right-dots',
                isMenuHeader = true
            },
            {
                header = 'Crafting',
                txt = 'Current Experience: '..pData.metadata['craftingrep'],
                icon = 'fa-solid fa-pen-ruler',
            },
            {
                header = 'Attachment Crafting',
                txt = 'Current Experience: '..pData.metadata['attachmentcraftingrep'],
                icon = 'fa-solid fa-compass-drafting',
            },
            {
                header = 'Return',
                icon = 'fa-solid fa-backward',
                params = {
                    event = 'boii-simpleskills:cl:SkillMenu'
                }
            }
        }
        exports[MenuName]:openMenu(Skills)
    elseif args == 2 then
        local JobRep = {
            {
                header = 'Job Reputation',
                txt = 'View your job reputation here!',
                icon = 'fa-solid fa-arrow-up-right-dots',
                isMenuHeader = true
            },
            {
                header = 'Towing',
                txt = 'Current Reputation: '..pData.metadata['jobrep']['tow'],
                icon = 'fa-solid fa-truck-pickup',
            },
            {
                header = 'Trucker',
                txt = 'Current Reputation: '..pData.metadata['jobrep']['trucker'],
                icon = 'fa-solid fa-truck-front',
            },
            {
                header = 'Taxi',
                txt = 'Current Reputation: '..pData.metadata['jobrep']['taxi'],
                icon = 'fa-solid fa-taxi',
            },
            {
                header = 'Hot Dog',
                txt = 'Current Reputation: '..pData.metadata['jobrep']['hotdog'],
                icon = 'fa-solid fa-hotdog',
            },
            {
                header = 'Return',
                icon = 'fa-solid fa-backward',
                params = {
                    event = 'boii-simpleskills:cl:SkillMenu'
                }
            }
        }
        exports[MenuName]:openMenu(JobRep)
    end
end)
