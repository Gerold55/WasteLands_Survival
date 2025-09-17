local modname = "ws_core"
local modpath = minetest.get_modpath(modname)

-- ---------------------------------------------------------------------------------------
-- Water level & helpers
-- ---------------------------------------------------------------------------------------
local WATER_LEVEL = tonumber(minetest.get_mapgen_setting("water_level") or "1") or 1

local function is_water(name)
    return minetest.get_item_group(name, "water") > 0
end

local function is_buildable(pos)
    local n = minetest.get_node(pos)
    local def = minetest.registered_nodes[n.name]
    return (n.name == "air") or (def and def.buildable_to)
end

-- ---------------------------------------------------------------------------------------
-- Mapgen aliases (keep lava/water sources from your pack)
-- ---------------------------------------------------------------------------------------
local filler = "air"

-- Essentials
minetest.register_alias("mapgen_stone",        "ws_core:stone")
minetest.register_alias("mapgen_water_source", "ws_core:water_source_toxic")
minetest.register_alias("mapgen_lava_source",  "ws_core:lava_source")

-- Terrain
minetest.register_alias("mapgen_dirt",               "ws_core:dirt_dry")
minetest.register_alias("mapgen_dirt_with_grass",    "ws_core:dirt_dry")
minetest.register_alias("mapgen_sand",               "ws_core:clay_dirt")
minetest.register_alias("mapgen_gravel",             "ws_core:gravel")
minetest.register_alias("mapgen_desert_stone",       "ws_core:stone")
minetest.register_alias("mapgen_desert_sand",        "ws_core:sandy_dirt")
minetest.register_alias("mapgen_dirt_with_snow",     "ws_core:dirt_dry_forest")
minetest.register_alias("mapgen_snowblock",          filler)
minetest.register_alias("mapgen_snow",               filler)
minetest.register_alias("mapgen_ice",                filler)

-- Flora (disable default trees/leaves)
minetest.register_alias("mapgen_tree",             filler)
minetest.register_alias("mapgen_leaves",           filler)
minetest.register_alias("mapgen_apple",            filler)
minetest.register_alias("mapgen_jungletree",       filler)
minetest.register_alias("mapgen_jungleleaves",     filler)
minetest.register_alias("mapgen_junglegrass",      filler)
minetest.register_alias("mapgen_pine_tree",        filler)
minetest.register_alias("mapgen_pine_needles",     filler)

-- Dungeons
minetest.register_alias("mapgen_cobble",            "ws_core:cobble")
minetest.register_alias("mapgen_stair_cobble",      "stairs:stair_cobble")
minetest.register_alias("mapgen_mossycobble",       "ws_core:cobble")
minetest.register_alias("mapgen_stair_desert_stone","stairs:stair_cobble")

-- ---------------------------------------------------------------------------------------
-- Ores (clean pass; keep your choices, just grouped)
-- ---------------------------------------------------------------------------------------
local function register_ores()
    -- Blobs in sand/stone
    minetest.register_ore({
        ore_type        = "blob",
        ore             = "ws_core:clay",
        wherein         = {"ws_core:sandy_dirt"},
        clust_scarcity  = 16 * 16 * 16,
        clust_size      = 5,
        y_max           = WATER_LEVEL + 1,
        y_min           = WATER_LEVEL - 15,
        noise_params    = {
            offset = 0.5, scale = 0.2, spread = {x=5,y=5,z=5}, seed = -316, octaves = 1, persist = 0.0
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
            offset = 0.5, scale = 0.2, spread = {x=5,y=5,z=5}, seed = 2316, octaves = 1, persist = 0.0
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
            offset = 0.5, scale = 0.2, spread = {x=5,y=5,z=5}, seed = 766, octaves = 1, persist = 0.0
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
        ore            = "ws_core:stone_with_coal_dense",
        wherein        = "ws_core:stone",
        clust_scarcity = 8 * 8 * 8,
        clust_num_ores = 8,
        clust_size     = 3,
        y_max          = 64,
        y_min          = -31000,
    })

    -- Metals/gems (blob-style pockets)
    local function ore_blob(defname, y_max, y_min)
        minetest.register_ore({
            ore_type = "blob",
            ore = "ws_core:"..defname,
            wherein = "ws_core:stone",
            noise_threshold = 0.5,
            noise_params = {
                offset = 0.5, scale = 0.2, spread = {x=5,y=5,z=5}, seed = -316, octaves = 1, persist = 0.0,
            },
            y_max = y_max, y_min = y_min,
            column_height = 5,
            cluster_size = 5,
        })
    end
    ore_blob("iron",    20, -30)
    ore_blob("gold",    20, -30)
    ore_blob("diamond", 20, -30)
end
register_ores()

-- ---------------------------------------------------------------------------------------
-- BIOMES
-- Goal: a clean shoreline using a dedicated beach "shore" biome at water level
-- ---------------------------------------------------------------------------------------
minetest.clear_registered_biomes()

-- 1) Shoreline / beach band hugging the water level
minetest.register_biome({
    name = "shore",
    node_top = "ws_core:sandy_dirt",
    depth_top = 1,
    node_filler = "ws_core:sandy_dirt",
    depth_filler = 3,
    node_riverbed = "ws_core:sandy_dirt",
    depth_riverbed = 2,
    -- Keep this band narrow around the water line for crisp beaches
    y_max = WATER_LEVEL + 1,
    y_min = WATER_LEVEL - 3,
    heat_point = 60,
    humidity_point = 30,
})

-- 2) Inland dryland (just above shore, up to mountains)
minetest.register_biome({
    name = "dryland",
    node_top = "ws_core:dry_dirt",
    depth_top = 1,
    node_filler = "ws_core:dry_dirt",
    depth_filler = 3,
    node_riverbed = "ws_core:sandy_dirt",
    depth_riverbed = 2,
    y_max = 31000,
    y_min = WATER_LEVEL + 2,
    heat_point = 50,
    humidity_point = 20,
})

-- 3) Sandland (hot, arid flats)
minetest.register_biome({
    name = "sandland",
    node_top = "ws_core:sandy_dirt",
    depth_top = 1,
    node_filler = "ws_core:sandy_dirt",
    depth_filler = 3,
    node_riverbed = "ws_core:sandy_dirt",
    depth_riverbed = 2,
    y_max = 31000,
    y_min = WATER_LEVEL + 2,
    heat_point = 80,
    humidity_point = 10,
})

-- 4) Basalt hills
minetest.register_biome({
    name = "basalt_hills",
    node_top = "ws_core:basalt",
    depth_top = 1,
    node_filler = "ws_core:basalt",
    depth_filler = 3,
    node_riverbed = "ws_core:basalt",
    depth_riverbed = 2,
    y_max = 31000,
    y_min = WATER_LEVEL + 8,
    heat_point = 10,
    humidity_point = 30,
})

-- 5) Dry forest
minetest.register_biome({
    name = "dry_forest",
    node_top = "ws_core:dirt_dry",
    depth_top = 1,
    node_filler = "ws_core:dirt_dry",
    depth_filler = 3,
    node_riverbed = "ws_core:dirt_dry",
    depth_riverbed = 2,
    y_max = 31000,
    y_min = WATER_LEVEL + 2,
    heat_point = 60,
    humidity_point = 30,
})

-- ---------------------------------------------------------------------------------------
-- DECORATIONS: Shoreline plants (Cattails & Dry Papyrus)
-- Cattails: only where base is sandy_dirt at WATER_LEVEL-1, water directly above.
-- Papyrus: dry shore (sandy_dirt at WATER_LEVEL), adjacent to water (spawn_by).
-- ---------------------------------------------------------------------------------------
minetest.clear_registered_decorations()

-- Cattails: use the rooted node as placed decoration; its on_construct (or the LBM below)
-- creates the top and keeps water intact.
minetest.register_decoration({
    name = "ws_core:cattails",
    deco_type = "simple",
    place_on = {"ws_core:sandy_dirt"},
    sidelen = 4,
    noise_params = {
        offset = -0.02,
        scale  = 0.05,
        spread = {x = 25, y = 25, z = 25},
        seed   = 7711,
        octaves= 3,
        persist= 0.6,
    },
    biomes = {"shore"},
    y_min = WATER_LEVEL - 2,   -- place roots in sand
    y_max = WATER_LEVEL - 2,
    place_offset_y = 0,
    spawn_by = "group:water",  -- requires water above
    num_spawn_by = 1,
    decoration = "ws_core:sand_with_cattails",
    flags = "force_placement",
    param2 = 16,
})

-- Dry Papyrus: on dry shore, adjacent to water, not submerged.
-- 1) Decoration: only at exact waterline height, on sandy dirt, near water
minetest.register_decoration({
    name = "ws_core:dry_papyrus_deco",
    deco_type = "simple",
    place_on = {"ws_core:sandy_dirt"},
    sidelen = 4,
    noise_params = {
        offset = -0.02,
        scale  = 0.04,
        spread = {x=25,y=25,z=25},
        seed   = 2257,
        octaves= 3,
        persist= 0.6,
    },
    biomes = {"shore"},
    y_min = WATER_LEVEL,       -- exact shoreline band
    y_max = WATER_LEVEL,
    place_offset_y = 0,
    spawn_by = "group:water",  -- needs water nearby (any direction)
    num_spawn_by = 1,
    decoration = "ws_core:dry_papyrus",
})

-- ---------------------------------------------------------------------------------------
-- LBM Safety Net (ensures cattail tops exist & water condition holds after mapgen)
-- ---------------------------------------------------------------------------------------
-- Ensure cattail tops exist after mapgen/decorations
minetest.register_lbm({
    name = "ws_core:cattails_finalize",
    nodenames = {"ws_core:sand_with_cattails"},
    run_at_every_load = false, -- run once per mapblock
    action = function(pos, node)
        -- Root should be one below waterline
        if pos.y ~= WATER_LEVEL - 2 then return end

        local water_pos = {x=pos.x, y=pos.y+1, z=pos.z}
        local top_pos   = {x=pos.x, y=pos.y+2, z=pos.z}

        -- must have water directly above the root
        local n_water = minetest.get_node(water_pos)
        if minetest.get_item_group(n_water.name, "water") <= 0 then
            return
        end

        -- top space must be free or buildable_to
        local n_top = minetest.get_node(top_pos)
        local def_top = minetest.registered_nodes[n_top.name]
        if n_top.name ~= "air" and not (def_top and def_top.buildable_to) then
            return
        end

        -- place the missing top
        if n_top.name ~= "ws_core:cattail_top" then
            minetest.set_node(top_pos, {name = "ws_core:cattail_top"})
        end
    end
})
