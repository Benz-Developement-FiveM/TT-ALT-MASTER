Config = {
    framework = 'QBCORE', --[[
        CHOOSE FRAMEWORK - this is needed to get player data

        ESX - supports esx legacy,
        QBCORE - it's just qbcore,
        STANDALONE - if you choose this option the name steam will be displayed instead of the first and last name in the scoreboard
    ]]
    throw_distance = 10.0, -- max distance from board to throw dart
    draw_dui_distance = 10.0,
    max_throws = 10,

    dui_offset = vector3(-0.678, -0.355, 0.455),

    throwing_force = function()
        return math.random(11, 13) -- dont touch if u dont know how it works
    end,

    notification = function(msg)
        -- here u can add your function to show notification
        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0, 1)
    end,
}

STRINGS = {
    JOIN       = 'Press ~INPUT_PICKUP~ to ~g~join ~w~the game\nPlayers in game: ~g~%s',
    LEAVE       = 'Press ~INPUT_PICKUP~ to ~g~left ~w~the game\nPress ~INPUT_DETONATE~ to ~g~clear ~w~board',
    STATISTIC  = 'Points: ~g~%s\n~w~Bullseyes: ~g~%s',
    END_THROW  = 'End',
    AIM        = 'Aim',
    THROW      = 'Throw',
    MAX_THROWS = 'You have used ~g~all ~w~%s ~g~throws',
    LEAVE_GAME = 'You ~g~left ~w~the game',
    MISSED     = 'You ~r~missed~w~!',
    PULLED_OUT = 'You pulled ~g~darts ~w~out of the board',
    TOO_FAR    = 'You are too far from the board',
    POINTS     = 'You hit for ~g~%s ~w~points'
}

MODELS = {
    BOARDS = {
        "prop_dart_bd_cab_01",
        "prop_dart_bd_01"
    },
    DARTS = {
        'prop_dart_1',
        'prop_dart_2'
    }
}

ANIMS = {
    AIM = { 
        { 'anim@amb@clubhouse@mini@darts@', 'intro' },
        { 'anim@amb@clubhouse@mini@darts@', 'throw_idle_a_up' },
    },

    THROW = { 'anim@amb@clubhouse@mini@darts@', 'throw_underlay' },

    FAIL = {
        { 'anim@amb@clubhouse@mini@darts@', 'retrieve_fail_a' },
        { 'anim@amb@clubhouse@mini@darts@', 'retrieve_fail_b' },
    },

    WIN = { 'anim@amb@clubhouse@mini@darts@', 'retrieve_win_a' },

    CLEAR = { 'anim@amb@clubhouse@mini@darts@', 'retrieve_to_wait' }
}

CONTROLS = {
    NOT_IN_GAME = {
        JOIN_EXIT = {
            key = 38,
            button = '~INPUT_PICKUP~',
        },
        CLEAR_BOARD = {
            key = 47,
            button = '~INPUT_DETONATE~',
        },
    },
    IN_GAME = {
        THROW = {
            key = 49,
            button = '~INPUT_ARREST~',
            label = STRINGS.THROW
        },
        AIM = {
            key = 142,
            button = '~INPUT_SKIP_CUTSCENE~',
            label = STRINGS.AIM
        },
    }
}