local modname = "ruins"
local modpath = minetest.get_modpath(modname)

ruins.decorationIDs = {}

local r
r = minetest.register_decoration({
	name = "ruins:ruin",
	deco_type = "schematic",
	place_on = {"ws_core:dirt_dry"},
	sidelen = 36,
	noise_params = {
		offset = 0.0001,
		scale = 0.0008,
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
	replacements = replacements,
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
	y_max = 16,
	schematic = modpath.."/schematics/ruin1_sand.mts",
	flags = "place_center_x, place_center_z,  force_placement",
	rotation = "random",
	replacements = replacements,
})
table.insert(ruins.decorationIDs,r)

r = minetest.register_decoration({
	name = "ruins:ruin_large",
	deco_type = "schematic",
	place_on = {"ws_core:dirt_dry"},
	sidelen = 80,
	noise_params = {
		offset = 0.00004,
		scale = 0.0004,
		spread = {x = 100, y = 100, z = 100},
		seed = 8,
		octaves = 2,
		persist = 0.8
	},
	biomes = {"dirtland","forest"},
	y_min = 2,
	y_max = 80,
	schematic = modpath.."/schematics/ruin_large.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
	replacements = replacements,
})
table.insert(ruins.decorationIDs,r)

r = minetest.register_decoration({
	name = "ruins:ruin_large_sand",
	deco_type = "schematic",
	place_on = {"ws_core:sandy_dirt"},
	sidelen = 80,
	noise_params = {
		offset = 0.00004,
		scale = 0.0008,
		spread = {x = 100, y = 100, z = 100},
		seed = 8,
		octaves = 2,
		persist = 0.8
	},
	biomes = {"desert"},
	y_min = 2,
	y_max = 80,
	schematic = modpath.."/schematics/ruin_large_sand.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
	replacements = replacements,
})
table.insert(ruins.decorationIDs,r)

r = minetest.register_decoration({
	name = "ruins:ramshackle_shelter",
	deco_type = "schematic",
	place_on = {"ws_core:dirt_dry"},
	sidelen = 80,
	noise_params = {
		offset = 0.00004,
		scale = 0.0001,
		spread = {x = 100, y = 100, z = 100},
		seed = 12,
		octaves = 2,
		persist = 0.2
	},
	biomes = {"dirtland","forest"},
	y_min = 2,
	y_max = 80,
	schematic = modpath.."/schematics/ramshackle_shelter.mts",
	flags = "place_center_x, place_center_z, force_placement",
	rotation = "random",
	replacements = replacements,
})
table.insert(ruins.decorationIDs,r)

r = minetest.register_decoration({
  name = "ruins:derilict_factory_empty",
  deco_type = "schematic",
  place_on = {"ws_core:dirt_dry"},
  sidelen = 80,
  noise_params = {
    offset = 0.00004,
    scale = 0.0001,
    spread = {x = 100, y = 100, z = 100},
    seed = 12,
    octaves = 2,
    persist = 0.2
  },
  biomes = {"dirtland"},
  y_min = 2,
  y_max = 80,
  schematic = modpath.."/schematics/derilict_factory_empty.mts",
  flags = "place_center_x, place_center_z, force_placement",
  rotation = "random",
  replacements = replacements,
})
table.insert(ruins.decorationIDs,r)

r = minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"ws_core:clay_dirt", "ws_core:sandy_dirt"},
	fill_ratio = 0.0001,
	biomes = {"claylands", "dirtlands"},
	y_min = 2,
	y_max = 80,
	place_offset_y = -7,
	schematic = modpath.."/schematics/ruin_build.mts",
	flags = "place_center_x, place_center_z,  force_placement",
	rotation = "random",
})
table.insert(ruins.decorationIDs,r)
