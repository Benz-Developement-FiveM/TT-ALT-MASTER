----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

# BOII | DEVELOPMENT - UTILITY: SKILLS MENU

Here we have a simple skills menu to diplay player qbcore player metadata.
Menu displays both skills and job reputation.
Enjoy :) 

### INSTALL ###

1) Customise `skillsmenu.lua` to display the meta data information you require
2) Drag and drop `boii-skillsmenu` into your server resources
3) Add `ensure boii-skillsmenu` into your `server.cfg` ensuring load order is correct
4) Press F8 and type `refresh; ensure boii-skillsmenu` or restart your server

### USAGE ###
- The menu uses your players meta data
- Add any additional meta data you wish to use into `qb-core/server/player.lua`
- An example is provided below for `drugxp` & `mining`

- Adding skills
- Insert the following into your `qb-core/server/player.lua`

PlayerData.metadata['drugxp'] = PlayerData.metadata['drugxp'] or 0 -- Added for drugs

- Insert the following into `skillsmenu.lua`

    {
        header = 'Drug Manufacturing',
        txt = 'Current Experience: '..pData.metadata['drugxp'],
        icon = 'fa-solid fa-capsules',
    },

- Adding jobs
- Insert the following into your `qb-core/server/player.lua`

PlayerData.metadata['jobrep']['mining'] = PlayerData.metadata['jobrep']['mining'] or 0

- Insert the following into `skillsmenu.lua`

    {
        header = 'Mining',
        txt = 'Current Reputation: '..pData.metadata['jobrep']['mining'],
        icon = 'fa-solid fa-cubes',
    },

### PREVIEW ###
coming soon

### SUPPORT ###
https://discord.gg/MUckUyS5Kq
