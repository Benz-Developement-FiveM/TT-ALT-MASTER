-- This config is used to define permissions of tattoos
-- 👉 https://documentation.rcore.cz/paid-resources/rcore_tattoos/tattoo-permissions

ConfigPermissions = {
    MP_Airraces_Tattoo_001_M = {
        -- Limit tattoo to players with certain jobs
        jobs = {
            { -- Available for 'police' job, from grade 1 
              name = "police",
              grade = 1
            },
            { -- Also avaiable for 'taxi' job, any grade
              name = "taxi"
            },
        },

        -- Limit tattoo to certain players
        identifiers = {
            -- 'db123456abcdefghij7890', -- example
        },
    },
}