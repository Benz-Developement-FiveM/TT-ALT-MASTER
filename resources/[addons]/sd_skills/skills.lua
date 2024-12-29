return { -- table of skills
--[[    ["LOCKPICKING"] = { -- Identifier
        -- XP required to progress from the current level to the next level.
        -- Starting level is 1.
        -- The first entry corresponds to the XP needed to go from Level 1 to Level 2.
        -- For example:
        -- Total XP to reach Level 3 is cumulative:
        -- - Level 1 to Level 2 requires 100 XP (first entry).
        -- - Level 2 to Level 3 requires 150 XP (second entry).
        -- - Therefore, total XP to reach Level 3 is 100 (to reach Level 2) + 150 (to reach Level 3) = 250 XP.
        -- Note:
        -- - Each level requires the specified amount of XP to progress from the previous level.
        -- - The XP required for each level is not just an incremental increase over the previous level's requirement.
        -- - For instance, Level 3 requires 150 XP more than Level 2, not just an additional 50 XP over Level 2's requirement.
        xpPerLevel = {
            1000, -- Level 1 to Level 2 requires 100 XP
            10000, -- Level 2 to Level 3 requires 150 XP
            20000, -- Level 3 to Level 4 requires 200 XP
            30000, -- Level 4 to Level 5 requires 250 XP
            40000, -- Level 5 to Level 6 requires 300 XP
            50000, -- Level 6 to Level 7 requires 350 XP
            60000, -- Level 7 to Level 8 requires 400 XP
            70000, -- Level 8 to Level 9 requires 450 XP
            80000, -- Level 9 to Level 10 requires 500 XP
            90000,
            100000,
            -- The number of entries determines the maximum level attainable.
            -- In this case, maximum level is Level 10 (starting from Level 1).
        },
    },]]--
    ["CONSTRUCTION"] = {
        xpPerLevel = {
            1000, 10000, 20000, 30000, 40000, 50000, 60000, 70000, 80000, 90000, 100000,
        },
    },
    ["TRUCKING"] = {
        xpPerLevel = {
            1000, 10000, 20000, 30000, 40000, 50000, 60000, 70000, 80000, 90000, 100000,
        },
    },
    ["BUTCHER"] = {
        xpPerLevel = {
            1000, 10000, 20000, 30000, 40000, 50000, 60000, 70000, 80000, 90000, 100000,
        },
    },
    ["FARMING"] = {
        xpPerLevel = {
            1000, 10000, 20000, 30000, 40000, 50000, 60000, 70000, 80000, 90000, 100000,
        },
    },
    ["LUMBERJACK"] = {
        xpPerLevel = {
            1000, 10000, 20000, 30000, 40000, 50000, 60000, 70000, 80000, 90000, 100000,
        },
    },
    ["BUS DRIVER"] = {
        xpPerLevel = {
            1000, 10000, 20000, 30000, 40000, 50000, 60000, 70000, 80000, 90000, 100000,
        },
    },
    ["GARBAGE MAN"] = {
        xpPerLevel = {
            1000, 10000, 20000, 30000, 40000, 50000, 60000, 70000, 80000, 90000, 100000,
        },
    },
    ["HOTDOG SELLING"] = {
        xpPerLevel = {
            1000, 10000, 20000, 30000, 40000, 50000, 60000, 70000, 80000, 90000, 100000,
        },
    },
    ["TAXI DRIVER"] = {
        xpPerLevel = {
            1000, 10000, 20000, 30000, 40000, 50000, 60000, 70000, 80000, 90000, 100000,
        },
    },
    ["TOW TRUCK DRIVER"] = {
        xpPerLevel = {
            1000, 10000, 20000, 30000, 40000, 50000, 60000, 70000, 80000, 90000, 100000,
        },
    },
    ["WINE MAKER"] = {
        xpPerLevel = {
            1000, 10000, 20000, 30000, 40000, 50000, 60000, 70000, 80000, 90000, 100000,
        },
    },
    ["PLANE PILOT"] = {
        xpPerLevel = {
            1000, 10000, 20000, 30000, 40000, 50000, 60000, 70000, 80000, 90000, 100000,
        },
    },
    ["MINING"] = {
        xpPerLevel = {
            1000, 10000, 20000, 30000, 40000, 50000, 60000, 70000, 80000, 90000, 100000,
        },
    },
    ["TACO"] = {
        xpPerLevel = {
            1000, 10000, 20000, 30000, 40000, 50000, 60000, 70000, 80000, 90000, 100000,
        },
    },
}
