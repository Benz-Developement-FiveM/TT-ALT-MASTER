--[[
    Need help with the script ? Go into the Discord support server  https://discord.gg/aKF3DX8yPx
]]

Config = {
    npcs = {
        --[[
            Template:
            {
                position = vector4(x, y, z, heading), -- NPC position X, Y, Z, Heading
                model = "modelName", -- NPC model (here is a list of all models https://wiki.rage.mp/index.php?title=Peds)
                animation = { -- Animation list : https://s1nyx.github.io/animations-list/ (dict in bold, animation name in regular)
                    enable = true, -- Activate the animation for the NPC
                    dict = "dictName", -- Dictionary associated to the animation
                    name = "animationName" -- Animation's name
                },
                props = {
                    enable = true, -- Activate the use of a prop for the NPC
                    list = {
                        {
                            model = "propName", -- Model of the prop
                            position = vec3(x, y, z), -- Position of the prop relative to the NPC
                            rotation = vec3(x, y, z) -- Rotation of the prop relative to the NPC
                        },
                    }
                }
            },
        ]]
        {
            position = vector4(-267.52, -959.14, 31.22, 215.89), -- NPC position X, Y, Z, Heading
            model = "s_m_y_airworker", -- NPC model (here is a list of all models https://wiki.rage.mp/index.php?title=Peds)
            animation = { -- Animation list : https://s1nyx.github.io/animations-list/ (dict in bold, animation name in regular)
                enable = true, -- Activate the animation for the NPC
                dict = "missheistdockssetup1clipboard@base", -- Dictionary associated to the animation
                name = "base" -- Animation's name
            },
            props = {
                enable = true, -- Activate the use of a prop for the NPC
                list = {
                    {
                        model = "prop_notepad_01", -- Model of the prop
                        bone = 18905, -- Bone associated to the prop
                        position = vec3(0.1, 0.02, 0.05), -- Position of the prop relative to the NPC
                        rotation = vec3(10.0, 0.0, 0.0) -- Rotation of the prop relative to the NPC
                    },
                    {
                        model = "prop_pencil_01", -- Model of the prop
                        bone = 58866, -- Bone associated to the prop
                        position = vec3(0.11, -0.02, 0.001), -- Position of the prop relative to the NPC
                        rotation = vec3(-120.0, 0.0, 0.0) -- Rotation of the prop relative to the NPC
                    },
                }
            }
        },
    }
}
