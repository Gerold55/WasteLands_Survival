local modname = "ruins"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")
-- internationalization boilerplate
local S = minetest.get_translator(minetest.get_current_modname())

minetest.register_decoration({
		name = "ruins:ruin",
		deco_type = "schematic",
		place_on = {"ws_core:dirt_dry"},
		sidelen = 1,
		noise_params = {
			offset = 0.0001,
			scale = 0.00004,
			spread = {x = 200000, y = 200000, z = 200000},
			seed = 2,
			octaves = 3,
			persist = 5
		},
		biomes = {"dirtland"},
		y_min = 2,
		y_max = 80,
		schematic = modpath.."/schematics/ruin1.mts",
		flags = "place_center_x, place_center_z,  force_placement",
		rotation = "random",
	})
	
	minetest.register_decoration({
		name = "ruins:ruin1",
		deco_type = "schematic",
		place_on = {"ws_core:sandy_dirt"},
		sidelen = 2,
		noise_params = {
			offset = 0.0001,
			scale = 0.00004,
			spread = {x = 300000, y = 300000, z = 300000},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"desert"},
		y_min = 4,
		y_max = 5,
		schematic = modpath.."/schematics/ruin1_sand.mts",
		flags = "place_center_x, place_center_z,  force_placement",
		rotation = "random",
	})