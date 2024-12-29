----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local MenuName = Config.CoreSettings.MenuName
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

--<!>-- MENUS START --<!>--
-- Main menu
local MainMenu = {
    {
        header = Language.Stores['smokeshopheader'],
        txt = Language.Stores['smokeshopheadertext'],
        icon = Language.Stores['smokeshopheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.Stores['smokeshopsellheader'],
        txt = Language.Stores['smokeshopsellheadertext'],
        icon = Language.Stores['smokeshopsellheadericon'],
        params = {
            event = 'boii-weed:cl:SellingMenu',
        }
    },
    {
        header = Language.Stores['smokeshopbrowseheader'],
        txt = Language.Stores['smokeshopbrowseheadertext'],
        icon = Language.Stores['smokeshopbrowseheadericon'],
        params = {
            event = 'boii-weed:cl:OpenShop'
        }
    },
    {
        header = Language.Shared['exitmenu'],
        icon = Language.Shared['exitmenuicon'],
        params = {
            event = 'boii-weed:cl:StopMenu'
        }
    },
}

-- Selling menu
local SellingMenu = {
    {
        header = Language.Stores['smokeshopsellheader'],
        txt = Language.Stores['smokeshopsellheadertext'],
        icon = Language.Stores['smokeshopsellheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.Stores['strain1header'],
        txt = Language.Stores['strain1headertext'],
        icon = Language.Stores['strainheadericon'],
        params = {
            event = 'boii-weed:sv:SellBags',
            isServer = true,
            args = 1
        }
    },
    {
        header = Language.Stores['strain2header'],
        txt = Language.Stores['strain2headertext'],
        icon = Language.Stores['strainheadericon'],
        params = {
            event = 'boii-weed:sv:SellBags',
            isServer = true,
            args = 2
        }
    },
    {
        header = Language.Stores['strain3header'],
        txt = Language.Stores['strain3headertext'],
        icon = Language.Stores['strainheadericon'],
        params = {
            event = 'boii-weed:sv:SellBags',
            isServer = true,
            args = 3
        }
    },
    {
        header = Language.Stores['strain4header'],
        txt = Language.Stores['strain4headertext'],
        icon = Language.Stores['strainheadericon'],
        params = {
            event = 'boii-weed:sv:SellBags',
            isServer = true,
            args = 4
        }
    },
    {
        header = Language.Stores['strain5header'],
        txt = Language.Stores['strain5headertext'],
        icon = Language.Stores['strainheadericon'],
        params = {
            event = 'boii-weed:sv:SellBags',
            isServer = true,
            args = 5
        }
    },
    {
        header = Language.Stores['strain6header'],
        txt = Language.Stores['strain6headertext'],
        icon = Language.Stores['strainheadericon'],
        params = {
            event = 'boii-weed:sv:SellBags',
            isServer = true,
            args = 6
        }
    },
    {
        header = Language.Stores['strain7header'],
        txt = Language.Stores['strain7headertext'],
        icon = Language.Stores['strainheadericon'],
        params = {
            event = 'boii-weed:sv:SellBags',
            isServer = true,
            args = 7
        }
    },
    {
        header = Language.Stores['strain8header'],
        txt = Language.Stores['strain8headertext'],
        icon = Language.Stores['strainheadericon'],
        params = {
            event = 'boii-weed:sv:SellBags',
            isServer = true,
            args = 8
        }
    }, -- Add more options here
    {
        header = Language.Shared['returnmenu'],
        icon = Language.Shared['returnmenuicon'],
        params = {
            event = 'boii-weed:cl:SmokeShopMenu'
        }
    },
}
--<!>-- MENUS END --<!>--

--<!>-- EVENTS START --<!>--
-- Mainmenu event
RegisterNetEvent('boii-weed:cl:SmokeShopMenu', function()
    if Config.Stores.Weed.SmokeShop.UseTimes == true then
        if GetClockHours() >= Config.Stores.Weed.SmokeShop.StartTime and GetClockHours() <= Config.Stores.Weed.SmokeShop.EndTime then 
            exports[MenuName]:openMenu(MainMenu)
        else 
            TriggerEvent('boii-weed:notify', Language.Stores['timer'], 'error')
        end
    else
        exports[MenuName]:openMenu(MainMenu)
    end 
end)

-- Selling menu event
RegisterNetEvent('boii-weed:cl:SellingMenu', function()
    exports[MenuName]:openMenu(SellingMenu)
end)
--<!>-- EVENTS END --<!>--