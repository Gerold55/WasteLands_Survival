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
		place_on = {"ws_core:dirt_dry1"},
		sidelen = 2,
		noise_params = {
			offset = 0.0005,
			scale = 0.00004,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"grassland"},
		y_min = 2,
		y_max = 80,
		schematic = modpath.."/schematics/dead_tree.mts",
		flags = "place_center_x, place_center_z,  force_placement",
		rotation = "random",
	})
	
	minetest.register_decoration({
		name = "ws_core:dead_tree1",
		deco_type = "schematic",
		place_on = {"ws_core:dirt_dry1"},
		sidelen = 2,
		noise_params = {
			offset = 0.0005,
			scale = 0.00004,
			spread = {x = 250, y = 250, z = 250},
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
		place_on = {"ws_core:dirt_dry1"},
		sidelen = 2,
		noise_params = {
			offset = 0.0005,
			scale = 0.00004,
			spread = {x = 250, y = 250, z = 250},
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
		place_on = {"ws_core:dirt_dry1"},
		sidelen = 2,
		noise_params = {
			offset = 0.0005,
			scale = 0.00004,
			spread = {x = 250, y = 250, z = 250},
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
		name = "ws_core:dead_tree_fallen",
		deco_type = "schematic",
		place_on = {"ws_core:dirt_dry1"},
		sidelen = 2,
		noise_params = {
			offset = 0.0005,
			scale = 0.00004,
			spread = {x = 250, y = 250, z = 250},
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
--
-- Nodes
--

minetest.register_node("ws_core:log", {
	description = S("Dead Log"),
	tiles = {
		"ws_dead_tree_top.png",
		"ws_dead_tree_top.png",
		"ws_dead_tree.png"
	},
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

-- dead_tree wood
minetest.register_node("ws_core:wood", {
	description = S("Dead Wood"),
	tiles = {"ws_wood.png"},
	is_ground_content = false,
	groups = {wood = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
})

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
