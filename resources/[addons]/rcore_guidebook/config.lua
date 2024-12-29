Config = {
    Debug = false,
    DebugLevel = {
        'INFO',
        'CRITICAL',
        'SUCCESS',
        'ERROR',
        'DEBUG',
    },

    Framework = 0, --[ 0 = Automatic detection, 1 = ESX / 2 = QBCore / 3 = Other ] Choose your framework
    LicenseType = 'license',
    Locale = 'en',

    Commands = {
        Help = 'help',
        SendHelp = 'sendhelp',
        Admin = 'helpadmin',
        Navigate = 'pointgps',
    },

    Keys = {
        OpenGuidebook = 'F9',
        HelpPointOpen = Keys.E,
    },

    HelpPointRenderDistance = 50,

    MarkerOffset = {
        ['default'] = vector3(0.0, 0.0, -1.0),
    },

    DisablePageContentCopy = false,         -- Disables text highlight and Ctrl+C of page content
    DisableDataPermissions = false,         -- Disables (job) restrictions for categories, pages and help points (if disabled, all previously restricted data will be visible to everyone)
    DisableDataPermissionsForAdmin = false, -- If true, admin will see all data regardless of permissions

    SearchCooldown = 3,                     -- Cooldown in seconds for searching in guidebook

    UseFrameworkNotify = false,             -- If true, framework notification will be used instead of guidebook notifications

    -- Do not edit if you don't know what you are doing
    FrameworkTriggers = {
        resourceName = '', -- [ ESX = 'es_extended' / QBCore = 'qb-core' ] Set the resource name, if left blank, automatic detection will be performed
        load = '',         --[ ESX = 'esx:getSharedObject' / QBCore = 'QBCore:GetObject' ] Set the shared object event, if left blank, default will be used (deprecated for QBCore)
        notify = '',       -- [ ESX = 'esx:showNotification' / QBCore = 'QBCore:Notify' ] Set the notification event, if left blank, default will be used
    },

    Experimental = {
        --❗❗ NO SUPPORT WILL BE PROVIDED, USE AT YOUR OWN RISK - All experimental features may not work as expected
        IFrameInsertIntoPage = false, -- If true, you will be able to add iframe (embed website) to guidebook pages
    },
}
