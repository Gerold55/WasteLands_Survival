--
-- dead_tree
--
local modname = "ws_core"
local modpath = minetest.get_modpath(modname)

-- Dry Balsa
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ws_core:dirt_dry_forest", "ws_core:dirt_dry"},
	sidelen = 2,
	noise_params = {
		offset = 0.0001,
		scale = 0.00004,
		spread = {x = 200000, y = 200000, z = 200000},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"forest", "dirtland"},
	y_min = 2,
	y_max = 80,
	decoration = "ws_core:log_balsa_dry",
	height = 1,
	height_max = 7,
})

minetest.register_decoration({
	name = "ws_core:dead_balsa_tree_fallen",
	deco_type = "schematic",
	place_on = {"ws_core:dirt_dry", "ws_core:sandy_dirt"},
	sidelen = 2,
	noise_params = {
		offset = 0.0001,
		scale = 0.00004,
		spread = {x = 200000, y = 200000, z = 200000},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"dirtland", "desert"},
	y_min = 2,
	y_max = 80,
	schematic = modpath.."/schematics/tree_balsa_fallen.mts",
	flags = "place_center_x, place_center_z,  force_placement",
	rotation = "random",
})

-- Dry Oak
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ws_core:clay_dirt", "ws_core:dirt_dry"},
	sidelen = 2,
	noise_params = {
		offset = 0.0001,
		scale = 0.00004,
		spread = {x = 200000, y = 200000, z = 200000},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"claylands", "dirtland"},
	y_min = 2,
	y_max = 80,
	decoration = "ws_core:log_oak_dry",
	height = 1,
	height_max = 5,
})

minetest.register_decoration({
	name = "ws_core:dead_tree_fallen",
	deco_type = "schematic",
	place_on = {"ws_core:dirt_dry", "ws_core:sandy_dirt"},
	sidelen = 2,
	noise_params = {
		offset = 0.0001,
		scale = 0.00004,
		spread = {x = 200000, y = 200000, z = 200000},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"dirtland", "desert"},
	y_min = 2,
	y_max = 80,
	schematic = modpath.."/schematics/tree_oak_fallen.mts",
	flags = "place_center_x, place_center_z,  force_placement",
	rotation = "random",
})
