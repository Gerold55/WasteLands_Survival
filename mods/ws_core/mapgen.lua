local modname = "ws_core"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")

--
-- Aliases for map generators
--

-- for mapgen aliases for which we don't have an apropriate substitute
local filler = "air"

-- TODO: many of these aliases should be updated once more nodes are defined
if mg_name == "v6" then
	-- Terrain
	minetest.register_alias("mapgen_stone", "ws_core:stone")
	minetest.register_alias("mapgen_water_source", "ws_core:water_source_toxic")
	minetest.register_alias("mapgen_lava_source", "ws_core:lava_source")
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
else
	-- Essential
	minetest.register_alias("mapgen_stone", "ws_core:stone")
	minetest.register_alias("mapgen_water_source", "ws_core:water_source_toxic")
	-- minetest.register_alias("mapgen_river_water_source", filler)
	-- Fallback
	minetest.register_alias("mapgen_lava_source", "ws_core:lava_source")
	minetest.register_alias("mapgen_cobble", "ws_core:cobble")
end
--
-- Register ores
--

-- Mgv6

function ws_core.register_mgv6_ores()

	-- Blob ore
	-- These first to avoid other ores in blobs
	--Clay
	
	minetest.register_ore({
		ore_type        = "blob",
		ore             = "ws_core:clay",
		wherein         = {"ws_core:sandy_dirt"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 2,
		y_min           = -15,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = -316,
			octaves = 1,
			persist = 0.0
		},
	})
	
	-- Sand

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "ws_core:sandy_dirt",
		wherein         = {"ws_core:stone"},
		clust_scarcity  = 64 * 64 * 64,
		clust_size      = 5,
		y_max           = 30,
		y_min           = -31,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 2316,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Gravel

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "ws_core:gravel",
		wherein         = {"ws_core:stone", "ws_core:dirt_dry"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 31000,
		y_min           = -31000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 766,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Scatter ores

	--dry dirt
	minetest.register_ore({
		ore_type        = "blob",
		ore             = "ws_core:dirt_dry",
		wherein         = {"ws_core:stone"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = -2,
		y_min           = -31,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 17676,
			octaves = 1,
			persist = 0.0
		},
	})

	--more dirt

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "ws_core:dirt_coarse",
		wherein         = {"ws_core:dirt_dry"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 200,
		y_min           = -40,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 17676,
			octaves = 1,
			persist = 0.0
		},
	})

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "ws_core:dirt_rocky",
		wherein         = {"ws_core:dirt_dry"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 200,
		y_min           = -40,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 17676,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Coal

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

	-- Iron

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "ws_core:stone_with_iron",
		wherein        = "ws_core:stone",
		clust_scarcity = 7 * 7 * 7,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = 0,
		y_min          = -31000,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "ws_core:stone_with_iron",
		wherein        = "ws_core:stone",
		clust_scarcity = 24 * 24 * 24,
		clust_num_ores = 27,
		clust_size     = 6,
		y_max          = -64,
		y_min          = -31000,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "ws_core:stone_with_iron_dense",
		wherein        = "ws_core:stone",
		clust_scarcity = 7 * 7 * 7,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = 0,
		y_min          = -31000,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "ws_core:stone_with_iron_dense",
		wherein        = "ws_core:stone",
		clust_scarcity = 24 * 24 * 24,
		clust_num_ores = 27,
		clust_size     = 6,
		y_max          = -64,
		y_min          = -31000,
	})

	-- Copper

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "ws_core:stone_with_copper",
		wherein        = "ws_core:stone",
		clust_scarcity = 12 * 12 * 12,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = -16,
		y_min          = -63,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "ws_core:stone_with_copper",
		wherein        = "ws_core:stone",
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -64,
		y_min          = -31000,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "ws_core:stone_with_copper_dense",
		wherein        = "ws_core:stone",
		clust_scarcity = 12 * 12 * 12,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = -16,
		y_min          = -63,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "ws_core:stone_with_copper_dense",
		wherein        = "ws_core:stone",
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -64,
		y_min          = -31000,
	})

	-- Gold

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "ws_core:stone_with_gold",
		wherein        = "ws_core:stone",
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 3,
		clust_size     = 2,
		y_max          = -64,
		y_min          = -255,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "ws_core:stone_with_gold",
		wherein        = "ws_core:stone",
		clust_scarcity = 13 * 13 * 13,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -256,
		y_min          = -31000,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "ws_core:stone_with_gold_dense",
		wherein        = "ws_core:stone",
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 3,
		clust_size     = 2,
		y_max          = -64,
		y_min          = -255,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "ws_core:stone_with_gold_dense",
		wherein        = "ws_core:stone",
		clust_scarcity = 13 * 13 * 13,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -256,
		y_min          = -31000,
	})
end


-- All mapgens except mgv6

function ws_core.register_ores()

	-- Blob ore.
	-- These before scatter ores to avoid other ores in blobs.

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "ws_core:clay",
		wherein         = {"ws_core:dirt_dry"},
		clust_scarcity  = 20 * 20 * 20,
		clust_size      = 5,
		y_max           = 200,
		y_min           = -40,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 17676,
			octaves = 1,
			persist = 0.0
		},
	})
	
	minetest.register_ore({
		ore_type        = "blob",
		ore             = "ws_core:dirt_coarse",
		wherein         = {"ws_core:dirt_dry"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 200,
		y_min           = -40,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 17676,
			octaves = 1,
			persist = 0.0
		},
	})

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "ws_core:dirt_rocky",
		wherein         = {"ws_core:dirt_dry"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 200,
		y_min           = -40,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 17676,
			octaves = 1,
			persist = 0.0
		},
	})
	
	minetest.register_ore({
		ore_type        = "blob",
		ore             = "ws_core:basalt",
		wherein         = {"ws_core:lava"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 31000,
		y_min           = -40,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 17676,
			octaves = 1,
			persist = 0.0
		},
	})
	
	-- Granite
	
	minetest.register_ore({
		ore_type        = "blob",
		ore             = "ws_core:granite",
		wherein         = {"ws_core:stone"},
		clust_scarcity = 8 * 8 * 8,
		clust_num_ores = 8,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = -31000,
	})
	
	-- Diorite
	
	minetest.register_ore({
		ore_type        = "blob",
		ore             = "ws_core:diorite",
		wherein         = {"ws_core:stone"},
		clust_scarcity = 8 * 8 * 8,
		clust_num_ores = 8,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = -31000,
	})
	
	-- Andesite
	
	minetest.register_ore({
		ore_type        = "blob",
		ore             = "ws_core:andesite",
		wherein         = {"ws_core:stone"},
		clust_scarcity = 8 * 8 * 8,
		clust_num_ores = 8,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = -31000,
	})
	
	-- Slate
	
	minetest.register_ore({
		ore_type        = "blob",
		ore             = "ws_core:slate",
		wherein         = {"ws_core:stone"},
		clust_scarcity = 8 * 8 * 8,
		clust_num_ores = 8,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = -31000,
		biomes = {"dirtland"},
	})

	-- Gravel

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "ws_core:gravel",
		wherein         = {"ws_core:stone"},
		clust_scarcity = 8 * 8 * 8,
		clust_num_ores = 8,
		clust_size     = 3,
		y_max          = 64,
		y_min          = -127,
	})

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "ws_core:gravel",
		wherein         = {"ws_core:dirt_dry"},
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 8,
		clust_size     = 3,
		y_max          = 64,
		y_min          = -127,
	})

	-- Scatter ores

	-- Oil

	minetest.register_ore({
		ore             = "ws_core:oil_source",
		wherein         = {"ws_core:stone"},
		clust_scarcity = 20 * 20 * 20,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = 4,
		y_min          = -31000,
	})
	
	-- Lava

	minetest.register_ore({
		ore             = "ws_core:lava_source",
		wherein         = {"ws_core:stone"},
		clust_scarcity = 16 * 16 * 16,
		clust_num_ores = 10,
		clust_size     = 3,
		y_max          = -10000,
		y_min          = -31000,
	})

	-- Bones

	minetest.register_ore({
		ore             = "ws_core:bone",
		wherein         = {"ws_core:stone"},
		clust_scarcity = 60 * 60 * 60,
		clust_num_ores = 2,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = -31000,
	})

	minetest.register_ore({
		ore             = "ws_core:bone",
		wherein         = {"ws_core:dirt_dry"},
		clust_scarcity = 25 * 25 * 25,
		clust_num_ores = 2,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = -31000,
	})

	-- Coal

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "ws_core:stone_with_coal",
		wherein        = "ws_core:stone",
		clust_scarcity = 8 * 8 * 8,
		clust_num_ores = 8,
		clust_size     = 3,
		y_max          = 64,
		y_min          = -127,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "ws_core:stone_with_coal",
		wherein        = "ws_core:stone",
		clust_scarcity = 12 * 12 * 12,
		clust_num_ores = 30,
		clust_size     = 5,
		y_max          = -128,
		y_min          = -31000,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "ws_core:stone_with_coal_dense",
		wherein        = "ws_core:stone",
		clust_scarcity = 18 * 18 * 18,
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

	-- Copper

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "ws_core:stone_with_copper",
		wherein        = "ws_core:stone",
		clust_scarcity = 12 * 12 * 12,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = -64,
		y_min          = -127,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "ws_core:stone_with_copper",
		wherein        = "ws_core:stone",
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -128,
		y_min          = -31000,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "ws_core:stone_with_copper_dense",
		wherein        = "ws_core:stone",
		clust_scarcity = 18 * 18 * 18,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = -16,
		y_min          = -63,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "ws_core:stone_with_copper_dense",
		wherein        = "ws_core:stone",
		clust_scarcity = 18 * 18 * 18,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -64,
		y_min          = -31000,
	})

	-- Iron

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "ws_core:stone_with_iron",
		wherein        = "ws_core:stone",
		clust_scarcity = 7 * 7 * 7,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -128,
		y_min          = -255,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "ws_core:stone_with_iron",
		wherein        = "ws_core:stone",
		clust_scarcity = 12 * 12 * 12,
		clust_num_ores = 29,
		clust_size     = 5,
		y_max          = -256,
		y_min          = -31000,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "ws_core:stone_with_iron_dense",
		wherein        = "ws_core:stone",
		clust_scarcity = 18 * 18 * 18,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = 0,
		y_min          = -31000,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "ws_core:stone_with_iron_dense",
		wherein        = "ws_core:stone",
		clust_scarcity = 24 * 24 * 24,
		clust_num_ores = 27,
		clust_size     = 6,
		y_max          = -64,
		y_min          = -31000,
	})

	-- Gold

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "ws_core:stone_with_gold",
		wherein        = "ws_core:stone",
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 3,
		clust_size     = 2,
		y_max          = -256,
		y_min          = -511,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "ws_core:stone_with_gold",
		wherein        = "ws_core:stone",
		clust_scarcity = 13 * 13 * 13,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -512,
		y_min          = -31000,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "ws_core:stone_with_gold_dense",
		wherein        = "ws_core:stone",
		clust_scarcity = 18 * 18 * 18,
		clust_num_ores = 3,
		clust_size     = 2,
		y_max          = -64,
		y_min          = -255,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "ws_core:stone_with_gold_dense",
		wherein        = "ws_core:stone",
		clust_scarcity = 18 * 18 * 18,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -256,
		y_min          = -31000,
	})
end


--
-- Register biomes
--

-- All mapgens except mgv6

function ws_core.register_biomes()

	-- Grassland

	minetest.register_biome({
		name = "dirtland",
		node_top = "ws_core:dirt_dry",
		depth_top = 3,
		node_filler = "ws_core:dirt_dry",
		depth_filler = 3,
		node_riverbed = "ws_core:sandy_dirt",
		depth_riverbed = 4,
		y_max = 200,
		y_min = -40,
		heat_point = 50,
		humidity_point = 35,
	})

	-- Forest

	minetest.register_biome({
		name = "forest_dunes",
		node_top = "ws_core:sandy_dirt",
		depth_top = 3,
		node_filler = "ws_core:sandy_dirt",
		depth_filler = 3,
		node_riverbed = "ws_core:sandy_dirt",
		depth_riverbed = 4,
		vertical_blend = 1,
		y_max = 5,
		y_min = 4,
		heat_point = 40,
		humidity_point = 50,
	})

	minetest.register_biome({
		name = "forest",
		node_top = "ws_core:dirt_dry_forest",
		depth_top = 1,
		node_filler = "ws_core:dirt_dry",
		depth_filler = 4,
		node_riverbed = "ws_core:sandy_dirt",
		depth_riverbed = 4,
		y_max = 500,
		y_min = -40,
		heat_point = 40,
		humidity_point = 50,
	})


	-- Spruce Forest

	minetest.register_biome({
		name = "spruce_forest",
		node_top = "ws_core:dirt_dry_forest",
		depth_top = 1,
		node_filler = "ws_core:dirt_dry",
		depth_filler = 4,
		node_riverbed = "ws_core:sandy_dirt",
		depth_riverbed = 4,
		y_max = 500,
		y_min = -40,
		heat_point = 10,
		humidity_point = 50,
	})

	-- Desert

	minetest.register_biome({
		name = "desert",
		node_top = "ws_core:sandy_dirt",
		depth_top = 3,
		node_filler = "ws_core:sandy_dirt",
		depth_filler = 3,
		node_stone = "ws_core:stone",
		node_riverbed = "ws_core:sandy_dirt",
		depth_riverbed = 6,
		y_max = 300,
		y_min = 4,
		heat_point = 92,
		humidity_point = 16,
	})


		-- ClayLands

	minetest.register_biome({
		name = "claylands",
		node_top = "ws_core:clay_dirt",
		depth_top = 3,
		node_filler = "ws_core:clay_dirt",
		depth_filler = 3,
		node_riverbed = "ws_core:sandy_dirt",
		depth_riverbed = 4,
		y_max = 500,
		y_min = 1,
		heat_point = 55,
		humidity_point = 40,
	})	

	    -- VolcanicZone

	minetest.register_biome({
		name = "volcaniczone",
		node_top = "ws_core:basalt",
		depth_top = 3,
		node_filler = "ws_core:dirt_dry",
		depth_filler = 3,
		node_riverbed = "ws_core:dirt_dry",
		depth_riverbed = 4,
		y_max = 500,
		y_min = 1,
		heat_point = 60,
		humidity_point = 70,
	})
end

--
-- Register decorations
--

function ws_core.register_decorations()

	-- Papyrus
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"ws_core:dirt_dry", "ws_core:sandy_dirt", "ws_core:clay_dirt"},
		sidelen = 16,
		noise_params = {
			offset = -0.3,
			scale = 0.7,
			spread = {x = 200, y = 200, z = 200},
			seed = 354,
			octaves = 3,
			persist = 0.7
		},
		biomes = {"dirtland", "desert", "claylands"},
		y_max = 1,
		y_min = 1,
		spawn_by = "ws_core:water_source_toxic",
		num_spawn_by = 1,
		decoration = "ws_core:dry_papyrus",
		height = 2,
		height_max = 4,
	})

	-- Dry shrub
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"ws_core:dirt_dry", "ws_core:sandy_dirt"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.02,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"dirtland", "desert"},
		y_max = 31000,
		y_min = 0,
		decoration = "ws_core:dry_shrub",
		param2 = 4,
	})

	-- Gorse
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"ws_core:clay_dirt",
			"ws_core:clay_dirt"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.02,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"claylands"},
		y_max = 31000,
		y_min = 0,
		decoration = "ws_core:gorse",
		param2 = 4,
	})

	-- Stalactites
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"ws_core:stone",
			"ws_core:stone"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 2,
			spread = {x = 100, y = 100, z = 100},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		-- biomes = {"dirtland", "desert", "claylands"},
		y_max = 0,
		y_min = -31000,
		decoration = "ws_core:stalactites",
		flags = "all_ceilings",
		param2 = 4,
	})
end


minetest.clear_registered_biomes()
minetest.clear_registered_ores()
minetest.clear_registered_decorations()

if mg_name == "v6" then
	ws_core.register_mgv6_ores()
else
	ws_core.register_biomes()
	ws_core.register_ores()
end

ws_core.register_decorations()
