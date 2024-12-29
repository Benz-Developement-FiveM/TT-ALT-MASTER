----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

Language = {
    Debug = {
        ['targetmissingdata'] = 'Someone targeted a plant and the data could not be found!' -- Debug server side print
    },
    XP = {
        ['commandtext'] = 'Displays your current drug manufacturing xp.', -- Command text
        ['xplevelnotif'] = 'Drug Manufacturing:', -- Notification
    },
    Targeting = {
        ['plantsicon'] = 'fa-solid fa-cannabis', -- Icon used by qb-target for hydrochloric location visit; https://fontawesome.com to change
        ['plantslabel'] = 'Check Plant', -- Label used by qb-target for hydrochloric location
    },
    Planting = {
        ['tooclose'] = 'You are too close to another plant..', -- Notification
        ['wrongsoil'] = 'You cant plant here look for some more fertile land..', -- Notification
        ['plantedseednoxp'] = 'You planted a seed successfully!', -- Notification
        ['plantedseedxp'] = 'You successfully planted a seed and earned some xp!', -- Notification
        ['notrowel'] = 'You cant plant seeds without a '..Config.Plants.Outdoor.Actions.Plant.Required.label..'..', -- Notification
        ['nofertilizer'] = 'You cant feed plants without '..Config.Plants.Outdoor.Actions.Feed.Required.label..'..', -- Notification
        ['nowater'] = 'You cant water plants without '..Config.Plants.Outdoor.Actions.Water.Required.label..'..', -- Notification
        ['noshears'] = 'You cant trim plants without '..Config.Plants.Outdoor.Actions.Harvest.Required.label..'..', -- Notification
        ['harvestxp'] = 'You successfully harvested a plant and earned some xp!', -- Notification
        ['harvestnoxp'] = 'You successfully harvested a plant!', -- Notification
        ['destroyedplant'] = 'You successfully destroyed a plant!', -- Notification
        ['harvestplant'] = 'Harvesting Plant..', -- Progressbar
        ['destroyplant'] = 'Destroying Plant..', -- Progressbar
        ['feedplant'] = 'Feeding Plant..', -- Progressbar
        ['waterplant'] = 'Watering Plant..', -- Progressbar
        ['plantseed'] = 'Planting Seed..', -- Progressbar
    },
    Trimming = {
        ['noshears'] = 'You cant trim plants without a pair of '..Config.Plants.Outdoor.Actions.Trimming.Required['1'].label..'..', -- Notification
        ['noscales'] = 'You cant trim plants without a set of '..Config.Plants.Outdoor.Actions.Trimming.Required['2'].label..'..', -- Notification
        ['enoughbags'] = 'You dont have enough '..Config.Plants.Outdoor.Actions.Trimming.Required['3'].label..'..', -- Notification
        ['nobags'] = 'You dont have any '..Config.Plants.Outdoor.Actions.Trimming.Required['3'].label..'..', -- Notification
        ['trimxp'] = 'You successfully trimmed some weed and earned some xp!', -- Notification
        ['trimnoxp'] = 'You successfully trimmed some weed!', -- Notification
        ['trimweed'] = 'Trimming Weed..', -- Progressbar
    },
    Rolling = {
        ['nogrinder'] = 'You cant roll joints without a '..Config.Plants.Outdoor.Actions.Rolling.Required['1'].label..'..', -- Notification
        ['nopapers'] = 'You cant roll joints without '..Config.Plants.Outdoor.Actions.Rolling.Required['2'].label..'..', -- Notification
        ['enoughpapers'] = 'You dont have enough '..Config.Plants.Outdoor.Actions.Rolling.Required['2'].label..'..', -- Notification
        ['rollxp'] = 'You successfully rolled some joints and earned some xp!', -- Notification
        ['norollxp'] = 'You successfully rolled some joints!', -- Notification
        ['rolljoint'] = 'Rolling Joints..', -- Progressbar
    },
    Smoking = {
        ['nolighter'] = 'You cant smoke without a '..Config.Plants.Outdoor.Actions.Smoking.Required.label..'..', -- Notification
        ['smokedjoint'] = 'You smoked a joint!', -- Notification
        ['smokejoint'] = 'Hitting Blunt..', -- Progressbar
    },
    Stores = {
        -- Main
        ['smokeshopheader'] = 'Smoke On The Water', -- Menu header   
        ['smokeshopheadertext'] = 'Buy your smoke gear or sell us some stuff!', -- Menu header
        ['smokeshopheadericon'] = 'fa-solid fa-shop', -- Store header
        -- Sell
        ['smokeshopsellheader'] = 'Sell To Store!', -- Menu header   
        ['smokeshopsellheadertext'] = 'Here you can sell your bags for cash!', -- Menu header
        ['smokeshopsellheadericon'] = 'fas fa-cannabis', -- Store header
        ['nobags'] = 'You dont have any bags to sell..', -- Notification
        -- Browse
        ['smokeshopbrowseheader'] = 'Browse The Store!', -- Menu header   
        ['smokeshopbrowseheadertext'] = 'Here you can purchase smoking equipment!', -- Menu header
        ['smokeshopbrowseheadericon'] = 'fa-solid fa-basket-shopping', -- Store header
        -- Timer
        ['timer'] = 'Dude my shift hasnt started yet. Come back between '..Config.Stores.Weed.SmokeShop.StartTime..' and '..Config.Stores.Weed.SmokeShop.EndTime..'..', -- Notification
        -- Strains
        ['strainheadericon'] = 'fas fa-cannabis', -- Strain header icon
        ['strain1header'] = 'Skunk', -- Store header
        ['strain1headertext'] = '$'..Config.Stores.Weed.SmokeShop.Drugs.Bags['weed_skunk']..' per 2g baggy.', -- Store header text
        ['strain2header'] = 'OG-Kush', -- Store header
        ['strain2headertext'] = '$'..Config.Stores.Weed.SmokeShop.Drugs.Bags['weed_og-kush']..' per 2g baggy.', -- Store header text
        ['strain3header'] = 'White-Widow', -- Store header
        ['strain3headertext'] = '$'..Config.Stores.Weed.SmokeShop.Drugs.Bags['weed_white-widow']..' per 2g baggy.', -- Store header text
        ['strain4header'] = 'AK47', -- Store header
        ['strain4headertext'] = '$'..Config.Stores.Weed.SmokeShop.Drugs.Bags['weed_ak47']..' per 2g baggy.', -- Store header text
        ['strain5header'] = 'Amnesia', -- Store header
        ['strain5headertext'] = '$'..Config.Stores.Weed.SmokeShop.Drugs.Bags['weed_amnesia']..' per 2g baggy.', -- Store header text
        ['strain6header'] = 'Purple-Haze', -- Store header
        ['strain6headertext'] = '$'..Config.Stores.Weed.SmokeShop.Drugs.Bags['weed_purple-haze']..' per 2g baggy.', -- Store header text
        ['strain7header'] = 'Gelato', -- Store header
        ['strain7headertext'] = '$'..Config.Stores.Weed.SmokeShop.Drugs.Bags['weed_gelato']..' per 2g baggy.', -- Store header text
        ['strain8header'] = 'Zkittlez', -- Store header
        ['strain8headertext'] = '$'..Config.Stores.Weed.SmokeShop.Drugs.Bags['weed_zkittlez']..' per 2g baggy.', -- Store header text
    },
    Shared = {
        ['returnmenu'] = 'Return', -- Menu header
		['returnmenuicon'] = 'fa-solid fa-backward', -- Menu header icon
        ['exitmenu'] = 'Exit', -- Menu header
		['exitmenuicon'] = 'fa-solid fa-circle-xmark', -- Menu header icon
        ['cancelled'] = 'Action cancelled..', -- Notification
        ['noinvent'] = 'Looks like your pockets are full..', -- Notification
        ['outrange'] = 'Looks like you are too far away..', -- Notification  
    }
}