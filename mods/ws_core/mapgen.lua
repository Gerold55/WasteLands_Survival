local modname = "ws_core"
local modpath = minetest.get_modpath(modname)

-- Register aliases based on mapgen type
local filler = "air"

-- Essential
minetest.register_alias("mapgen_stone", "ws_core:stone")
minetest.register_alias("mapgen_water_source", "ws_core:water_source_toxic")
minetest.register_alias("mapgen_lava_source", "ws_core:lava_source")

-- Terrain
minetest.register_alias("mapgen_dirt", "ws_core:dirt_dry")
minetest.register_alias("mapgen_dirt_with_grass", "ws_core:dirt_dry")
minetest.register_alias("mapgen_sand", "ws_core:clay_dirt")
minetest.register_alias("mapgen_gravel", "ws_core:gravel")
minetest.register_alias("mapgen_desert_stone", "ws_core:stone")
minetest.register_alias("mapgen_desert_sand", "ws_core:sandy_dirt")
minetest.register_alias("mapgen_dirt_with_snow", "ws_core:dirt_dry_forest")
minetest.register_alias("mapgen_snowblock", filler)
minetest.register_alias("mapgen_snow", filler)
minetest.register_alias("mapgen_ice", filler)

-- Flora
minetest.register_alias("mapgen_tree", filler)
minetest.register_alias("mapgen_leaves", filler)
minetest.register_alias("mapgen_apple", filler)
minetest.register_alias("mapgen_jungletree", filler)
minetest.register_alias("mapgen_jungleleaves", filler)
minetest.register_alias("mapgen_junglegrass", filler)
minetest.register_alias("mapgen_pine_tree", filler)
minetest.register_alias("mapgen_pine_needles", filler)

-- Dungeons
minetest.register_alias("mapgen_cobble", "ws_core:cobble")
minetest.register_alias("mapgen_stair_cobble", "stairs:stair_cobble")
minetest.register_alias("mapgen_mossycobble", "ws_core:cobble")
minetest.register_alias("mapgen_stair_desert_stone", "stairs:stair_cobble")

-- Function to place gorse
local function place_gorse(x, y, z)
    local node_below = minetest.get_node({x = x, y = y - 1, z = z})
    local node_here = minetest.get_node({x = x, y = y, z = z})

    if node_below.name == "ws_core:sandy_dirt" and node_here.name == "air" then
        -- Place the gorse node at the specified position
        minetest.set_node({x = x, y = y, z = z}, {name = "ws_core:gorse"})
    end
end

-- Register Ores
function ws_core.register_ores()

    -- Blob ores
    minetest.register_ore({
        ore_type        = "blob",
        ore             = "ws_core:clay",
        wherein         = {"ws_core:sandy_dirt"},
        clust_scarcity  = 16 * 16 * 16,
        clust_size      = 5,
        y_max           = 2,
        y_min           = -15,
        noise_params    = {
            offset = 0.5,
            scale = 0.2,
            spread = {x = 5, y = 5, z = 5},
            seed = -316,
            octaves = 1,
            persist = 0.0
        }
    })

    minetest.register_ore({
        ore_type        = "blob",
        ore             = "ws_core:sandy_dirt",
        wherein         = {"ws_core:stone"},
        clust_scarcity  = 64 * 64 * 64,
        clust_size      = 5,
        y_max           = 30,
        y_min           = -31,
        noise_params    = {
            offset = 0.5,
            scale = 0.2,
            spread = {x = 5, y = 5, z = 5},
            seed = 2316,
            octaves = 1,
            persist = 0.0
        }
    })

    minetest.register_ore({
        ore_type        = "blob",
        ore             = "ws_core:gravel",
        wherein         = {"ws_core:stone", "ws_core:dirt_dry"},
        clust_scarcity  = 16 * 16 * 16,
        clust_size      = 5,
        y_max           = 31000,
        y_min           = -31000,
        noise_params    = {
            offset = 0.5,
            scale = 0.2,
            spread = {x = 5, y = 5, z = 5},
            seed = 766,
            octaves = 1,
            persist = 0.0
        }
    })

    minetest.register_ore({
        ore_type        = "blob",
        ore             = "ws_core:dirt_dry",
        wherein         = {"ws_core:stone"},
        clust_scarcity  = 16 * 16 * 16,
        clust_size      = 5,
        y_max           = -2,
        y_min           = -31,
        noise_params    = {
            offset = 0.5,
            scale = 0.2,
            spread = {x = 5, y = 5, z = 5},
            seed = 17676,
            octaves = 1,
            persist = 0.0
        }
    })

    minetest.register_ore({
        ore_type        = "blob",
        ore             = "ws_core:dirt_coarse",
        wherein         = {"ws_core:dirt_dry"},
        clust_scarcity  = 16 * 16 * 16,
        clust_size      = 5,
        y_max           = 200,
        y_min           = -40,
        noise_params    = {
            offset = 0.5,
            scale = 0.2,
            spread = {x = 5, y = 5, z = 5},
            seed = 17676,
            octaves = 1,
            persist = 0.0
        }
    })

    minetest.register_ore({
        ore_type        = "blob",
        ore             = "ws_core:dirt_rocky",
        wherein         = {"ws_core:dirt_dry"},
        clust_scarcity  = 16 * 16 * 16,
        clust_size      = 5,
        y_max           = 200,
        y_min           = -40,
        noise_params    = {
            offset = 0.5,
            scale = 0.2,
            spread = {x = 5, y = 5, z = 5},
            seed = 17676,
            octaves = 1,
            persist = 0.0
        }
    })

    -- Scatter ores
    minetest.register_ore({
        ore_type       = "scatter",
        ore            = "ws_core:stone_with_coal",
        wherein        = "ws_core:stone",
        clust_scarcity = 8 * 8 * 8,
        clust_num_ores = 8,
        clust_size     = 3,
        y_max          = 64,
        y_min          = -31000,
    })

    minetest.register_ore({
        ore_type       = "scatter",
        ore            = "ws_core:stone_with_coal",
        wherein        = "ws_core:stone",
        clust_scarcity = 24 * 24 * 24,
        clust_num_ores = 27,
        clust_size     = 6,
        y_max          = 0,
        y_min          = -31000,
    })

    minetest.register_ore({
        ore_type       = "scatter",
        ore            = "ws_core:stone_with_coal_dense",
        wherein        = "ws_core:stone",
        clust_scarcity = 8 * 8 * 8,
        clust_num_ores = 8,
        clust_size     = 3,
        y_max          = 64,
        y_min          = -31000,
    })

    minetest.register_ore({
        ore_type       = "scatter",
        ore            = "ws_core:stone_with_coal_dense",
        wherein        = "ws_core:stone",
        clust_scarcity = 24 * 24 * 24,
        clust_num_ores = 27,
        clust_size     = 6,
        y_max          = 0,
        y_min          = -31000,
    })

    minetest.register_ore({
        ore_type       = "scatter",
        ore            = "ws_core:stone_with_iron",
        wherein        = "ws_core:stone",
        clust_scarcity = 14 * 14 * 14,
        clust_num_ores = 8,
        clust_size     = 4,
        y_max          = 0,
        y_min          = -31000,
    })

    minetest.register_ore({
        ore_type       = "scatter",
        ore            = "ws_core:stone_with_gold",
        wherein        = "ws_core:stone",
        clust_scarcity = 8 * 8 * 8,
        clust_num_ores = 6,
        clust_size     = 4,
        y_max          = 0,
        y_min          = -31000,
    })

    minetest.register_ore({
        ore_type       = "scatter",
        ore            = "ws_core:stone_with_gold",
        wherein        = "ws_core:stone",
        clust_scarcity = 16 * 16 * 16,
        clust_num_ores = 12,
        clust_size     = 6,
        y_max          = 0,
        y_min          = -31000,
    })

    minetest.register_ore({
        ore_type       = "scatter",
        ore            = "ws_core:stone_with_diamond",
        wherein        = "ws_core:stone",
        clust_scarcity = 16 * 16 * 16,
        clust_num_ores = 8,
        clust_size     = 4,
        y_max          = 16,
        y_min          = -31000,
    })

    minetest.register_ore({
        ore_type       = "scatter",
        ore            = "ws_core:stone_with_diamond",
        wherein        = "ws_core:stone",
        clust_scarcity = 32 * 32 * 32,
        clust_num_ores = 16,
        clust_size     = 6,
        y_max          = 0,
        y_min          = -31000,
    })

end

-- Register ores
ws_core.register_ores()

-- Clear existing biomes
minetest.clear_registered_biomes()

-- Register Biomes
minetest.register_biome({
    name = "dryland",
    node_top = "ws_core:dry_dirt",
    depth_top = 1,
    node_filler = "ws_core:dry_dirt",
    depth_filler = 3,
    node_riverbed = "ws_core:sandy_dirt",
    depth_riverbed = 2,
    y_max = 31000,
    y_min = 4,
    heat_point = 50,
    humidity_point = 20,
})

minetest.register_biome({
    name = "sandland",
    node_top = "ws_core:sandy_dirt",
    depth_top = 1,
    node_filler = "ws_core:sandy_dirt",
    depth_filler = 3,
    node_riverbed = "ws_core:sandy_dirt",
    depth_riverbed = 2,
    y_max = 31000,
    y_min = 4,
    heat_point = 80,
    humidity_point = 10,
})

minetest.register_biome({
    name = "basalt_hills",
    node_top = "ws_core:basalt",
    depth_top = 1,
    node_filler = "ws_core:basalt",
    depth_filler = 3,
    node_riverbed = "ws_core:basalt",
    depth_riverbed = 2,
    y_max = 31000,
    y_min = 4,
    heat_point = 10,
    humidity_point = 30,
})

minetest.register_biome({
    name = "dry_forest",
    node_top = "ws_core:dirt_dry",
    depth_top = 1,
    node_filler = "ws_core:dirt_dry",
    depth_filler = 3,
    node_riverbed = "ws_core:dirt_dry",
    depth_riverbed = 2,
    y_max = 31000,
    y_min = 4,
    heat_point = 60,
    humidity_point = 30,
})

minetest.register_biome({
    name = "claylands",
    node_top = "ws_core:clay_dirt",
    depth_top = 1,
    node_filler = "ws_core:clay_dirt",
    depth_filler = 3,
    node_riverbed = "ws_core:clay_dirt",
    depth_riverbed = 2,
    y_max = 31000,
    y_min = 4,
    heat_point = 30,
    humidity_point = 60,
})

-- World Generation Hook
minetest.register_on_generated(function(minp, maxp, seed)
    local mapgen_area = {x = minp.x, y = minp.y, z = minp.z}
    local mapgen_size = {x = maxp.x - minp.x, y = maxp.y - minp.y, z = maxp.z - minp.z}

    -- Function to generate lava bodies
    local function generate_lava_bodies(minp, maxp)
        -- Lava generation logic here
    end

    -- Call the function to generate lava bodies
    generate_lava_bodies(minp, maxp)
end)
