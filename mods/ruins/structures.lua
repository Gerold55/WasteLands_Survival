local modname = "ruins"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")
-- internationalization boilerplate
local S = minetest.get_translator(minetest.get_current_modname())

ruins.decorationIDs = {}

local r
r = minetest.register_decoration({
	name = "ruins:ruin",
	deco_type = "schematic",
	place_on = {"ws_core:dirt_dry"},
	sidelen = 36,
	noise_params = {
		offset = 0.0001,
		scale = 0.003,
		spread = {x = 100, y = 100, z = 100},
		seed = 2,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"dirtland","forest"},
	y_min = 2,
	y_max = 80,
	schematic = modpath.."/schematics/ruin1.mts",
	flags = "place_center_x, place_center_z,  force_placement",
	rotation = "random",
})
table.insert(ruins.decorationIDs,r)

r = minetest.register_decoration({
	name = "ruins:ruin1",
	deco_type = "schematic",
	place_on = {"ws_core:sandy_dirt"},
	sidelen = 46,
	noise_params = {
		offset = 0.0001,
		scale = 0.001,
		spread = {x = 100, y = 100, z = 100},
		seed = 2,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"desert"},
	y_min = 2,
	y_max = 6,
	schematic = modpath.."/schematics/ruin1_sand.mts",
	flags = "place_center_x, place_center_z,  force_placement",
	rotation = "random",
})
table.insert(ruins.decorationIDs,r)
