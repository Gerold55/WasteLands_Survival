--
-- dead_tree
--
local modname = "ws_core"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")
-- internationalization boilerplate
local S = minetest.get_translator(minetest.get_current_modname())

-- dead_tree
local function grow_new_ws_core_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(240, 600))
		return
	end

	minetest.place_schematic({x = pos.x-2, y = pos.y, z = pos.z+2}, modpath.."/schematics/dead_tree.mts", "0", nil, true)
end
--
-- Decoration
--

	minetest.register_decoration({
		name = "ws_core:dead_tree",
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
		schematic = modpath.."/schematics/dead_tree.mts",
		flags = "place_center_x, place_center_z,  force_placement",
		rotation = "random",
	})
	
	minetest.register_decoration({
		name = "ws_core:dead_tree1",
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
		biomes = {"grassland"},
		y_min = 2,
		y_max = 80,
		schematic = modpath.."/schematics/dead_tree1.mts",
		flags = "place_center_x, place_center_z,  force_placement",
		rotation = "random",
	})
	
	minetest.register_decoration({
		name = "ws_core:dead_tree2",
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
		biomes = {"grassland"},
		y_min = 2,
		y_max = 80,
		schematic = modpath.."/schematics/dead_tree2.mts",
		flags = "place_center_x, place_center_z,  force_placement",
		rotation = "random",
	})
	
	minetest.register_decoration({
		name = "ws_core:dead_tree3",
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
		biomes = {"grassland"},
		y_min = 2,
		y_max = 80,
		schematic = modpath.."/schematics/dead_tree3.mts",
		flags = "place_center_x, place_center_z,  force_placement",
		rotation = "random",
	})
	
	minetest.register_decoration({
		name = "ws_core:dead_tree4",
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
		biomes = {"grassland"},
		y_min = 2,
		y_max = 80,
		schematic = modpath.."/schematics/dead_tree4.mts",
		flags = "place_center_x, place_center_z,  force_placement",
		rotation = "random",
	})
	
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
		biomes = {"grassland"},
		y_min = 2,
		y_max = 80,
		schematic = modpath.."/schematics/dead_tree_fallen.mts",
		flags = "place_center_x, place_center_z,  force_placement",
		rotation = "random",
	})
	
	minetest.register_decoration({
		name = "ws_core:tree",
		deco_type = "schematic",
		place_on = {"ws_core:dirt"},
		sidelen = 2,
		noise_params = {
			offset = 0.0001,
			scale = 0.00004,
			spread = {x = 200000, y = 200000, z = 200000},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"grassland"},
		y_min = 2,
		y_max = 80,
		schematic = modpath.."/schematics/tree.mts",
		flags = "place_center_x, place_center_z,  force_placement",
		rotation = "random",
	})
	
	minetest.register_decoration({
		name = "ws_core:tree1",
		deco_type = "schematic",
		place_on = {"ws_core:dirt"},
		sidelen = 2,
		noise_params = {
			offset = 0.0001,
			scale = 0.00004,
			spread = {x = 200000, y = 200000, z = 200000},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"grassland"},
		y_min = 2,
		y_max = 80,
		schematic = modpath.."/schematics/tree1.mts",
		flags = "place_center_x, place_center_z,  force_placement",
		rotation = "random",
	})
--
-- Nodes
--

--
-- Craftitems
--

--
-- Recipes
--

minetest.register_craft({
	output = "ws_core:wood 4",
	recipe = {{"ws_core:trunk"}}
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:trunk",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:wood",
	burntime = 7,
})
