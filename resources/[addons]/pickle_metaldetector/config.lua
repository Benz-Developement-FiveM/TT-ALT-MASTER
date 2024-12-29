Config = {}

Config.Language = "en"

Config.Debug = true

Config.RenderDistance = 100.0

Config.IgnoreGroups = false -- Doesn't scan people who can see scan results.

Config.ScannerLocations = {
    {
        location = vec3(439.7059, -982.7385, 29.6896),
        heading = 86.5372,
        hideObject = false, -- Don't show the scanner prop (Useful for scanners already on the map).
    }
}

Config.MetalItems = { -- List of Detected Items
    "chain_parts",
    "scrap_brass",
    "scrap_iron",
    "spring",
    "steel_parts",
    "metalscrap",
    "copper",
    "iron",
    "steel",
    "goldearring",
    "diamond_earring",
    "goldchain",
    "treasurekey",
    "burriedtreasure",
    "aluminiumcan",
    "smallmysterybox",
    "mediummysterybox",
    "largemysterybox",
    "brokenphone",
    "steelcan",
    "gold_ring",
    "can",
    "hubcap",
    "silver_nugget",
}

Config.Scanner = {
    model = `ch_prop_ch_metal_detector_01a`,
    displayItems = true, -- Display all detected items found on the person, or just detect metal.
    failBeepCount = 8, -- Beeps for finding metal
    successBeepCount = 1, -- Beeps for not finding metal
    notifyDistance = 3.0, -- Display Text Distance
    flashDistance = 20.0, -- Object Flash Distance
    groups = { -- Groups that see the display text
        ["police"] = 0,
    },
    items = Config.MetalItems -- Items the scanner can detect
}

Config.Wand = {
    item = "metal_wand",
    model = `bv_scannerhand`,
    displayItems = false, -- Display all detected items found on the person, or just detect metal.
    failBeepCount = 8, -- Beeps for finding metal
    successBeepCount = 1, -- Beeps for not finding metal
    searchTime = 10000, -- Time for scanning
    boneID = 60309,
    offset = {
        pos = vec3(0.0, 0.0, 0.0),
        rot = vec3(0.0, -60.0, 180.0000),
    },
    animation = {"amb@world_human_security_shine_torch@male@idle_b", "idle_e"},
    --animation = {"missheist_agency2aig_4", "look_plan_a_worker2"},
    items = Config.MetalItems -- Items the scanner can detect
}
