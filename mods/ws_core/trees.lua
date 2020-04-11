--
-- dead_tree
--
local modname = "ws_core"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")
-- internationalization boilerplate
local S = minetest.get_translator(minetest.get_current_modname())

--
-- Decoration
--

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ws_core:dirt_dry"},
	fill_ratio = 0.001,
	biomes = {"dirtland"},
	y_min = 2,
	y_max = 80,
	decoration = "ws_core:log_dead",
	height = 2,
	height_max = 5,
})

-- minetest.register_alias("ws_core:dead_tree", "ws_core:log_dead")

minetest.register_decoration({
	name = "ws_core:dead_tree_fallen",
	deco_type = "schematic",
	place_on = {"ws_core:dirt_dry"},
	sidelen = 2,
	noise_params = {
		offset = 0.0001,
		scale = 0.00004,
		spread = {x = 200000, y = 200000, z = 200000},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"dirtland"},
	y_min = 2,
	y_max = 80,
	schematic = modpath.."/schematics/tree_dead_fallen.mts",
	flags = "place_center_x, place_center_z,  force_placement",
	rotation = "random",
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ws_core:dirt_dry_forest"},
	fill_ratio = 0.001,
	biomes = {"forest"},
	y_min = 2,
	y_max = 80,
	decoration = "ws_core:log_balsa",
	height = 4,
	height_max = 7,
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ws_core:clay_dirt"},
	fill_ratio = 0.001,
	biomes = {"claylands"},
	y_min = 2,
	y_max = 80,
	decoration = "ws_core:log_oak",
	height = 4,
	height_max = 5,
})
