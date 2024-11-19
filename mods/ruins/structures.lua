local modname = "ruins"
local modpath = minetest.get_modpath(modname)

-- Clear existing decorations if needed
-- minetest.clear_registered_decorations() -- Uncomment if required

-- Store Ruins Decorations IDs
local ruins = {
    decorationIDs = {}
}

-- Utility function to register a ruin
local function register_ruin(name, place_on, sidelen, noise_params, biomes, y_min, y_max, schematic, flags, rotation)
    local decoration = minetest.register_decoration({
        name = name,
        deco_type = "schematic",
        place_on = place_on,
        sidelen = sidelen,
        noise_params = noise_params,
        biomes = biomes,
        y_min = y_min,
        y_max = y_max,
        schematic = schematic,
        flags = flags,
        rotation = rotation,
    })
    table.insert(ruins.decorationIDs, decoration)
end

-- Define noise parameters for reuse
local noise_defaults = {
    spread = {x = 100, y = 100, z = 100},
    octaves = 2,
    persist = 0.6
}

-- Register various ruins

-- Small Ruin (Dryland)
register_ruin(
    "ruins:ruin",
    {"ws_core:dirt_dry"},
    36,
    {
        offset = 0.0001,
        scale = 0.0008,
        seed = 2,
        spread = noise_defaults.spread,
        octaves = 3,
        persist = 0.6
    },
    {"dryland", "dry_forest"},
    2,
    80,
    modpath.."/schematics/ruin1.mts",
    "place_center_x, place_center_z, force_placement",
    "random"
)

-- Small Ruin (Sandland)
register_ruin(
    "ruins:ruin1",
    {"ws_core:sandy_dirt"},
    46,
    {
        offset = 0.0001,
        scale = 0.001,
        seed = 2,
        spread = noise_defaults.spread,
        octaves = 3,
        persist = 0.6
    },
    {"sandland"},
    2,
    16,
    modpath.."/schematics/ruin1_sand.mts",
    "place_center_x, place_center_z, force_placement",
    "random"
)

-- Large Ruin (Dryland)
register_ruin(
    "ruins:ruin_large",
    {"ws_core:dirt_dry"},
    80,
    {
        offset = 0.00004,
        scale = 0.0004,
        seed = 8,
        spread = noise_defaults.spread,
        persist = 0.8
    },
    {"dryland", "dry_forest"},
    2,
    80,
    modpath.."/schematics/ruin_large.mts",
    "place_center_x, place_center_z",
    "random"
)

-- Large Ruin (Sandland)
register_ruin(
    "ruins:ruin_large_sand",
    {"ws_core:sandy_dirt"},
    80,
    {
        offset = 0.00004,
        scale = 0.0008,
        seed = 8,
        spread = noise_defaults.spread,
        persist = 0.8
    },
    {"sandland"},
    2,
    80,
    modpath.."/schematics/ruin_large_sand.mts",
    "place_center_x, place_center_z",
    "random"
)

-- Ramshackle Shelter
register_ruin(
    "ruins:ramshackle_shelter",
    {"ws_core:dirt_dry"},
    80,
    {
        offset = 0.00004,
        scale = 0.0001,
        seed = 12,
        spread = noise_defaults.spread,
        persist = 0.2
    },
    {"dryland", "dry_forest"},
    2,
    80,
    modpath.."/schematics/ramshackle_shelter.mts",
    "place_center_x, place_center_z, force_placement",
    "random"
)

-- Derelict Factory (Empty)
register_ruin(
    "ruins:derelict_factory_empty",
    {"ws_core:dirt_dry"},
    80,
    {
        offset = 0.00004,
        scale = 0.0001,
        seed = 12,
        spread = noise_defaults.spread,
        persist = 0.2
    },
    {"dryland"},
    2,
    80,
    modpath.."/schematics/derelict_factory_empty.mts",
    "place_center_x, place_center_z, force_placement",
    "random"
)

-- Ruin Build
register_ruin(
    "ruins:ruin_build",
    {"ws_core:clay_dirt", "ws_core:sandy_dirt"},
    80,
    {
        offset = 0.00004,
        scale = 0.0001,
        seed = 12,
        spread = noise_defaults.spread,
        persist = 0.2
    },
    {"claylands", "dryland"},
    2,
    80,
    modpath.."/schematics/ruin_build.mts",
    "place_center_x, place_center_z, force_placement",
    "random"
)
