minetest.register_node("ws_core:dirt_dry", {
	description = "Dry Dirt",
	tiles = {"ws_dirt_dry.png",
		{name = "ws_dirt_dry.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
})

minetest.register_node("ws_core:dirt_dry1", {
	description = "Dry Dirt (top)",
	tiles = {"ws_dirt_dry.png",
		{name = "ws_dirt_dry.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1},
	drop= "ws_core:dirt_dry",
})

minetest.register_node("ws_core:sandy_dirt", {
	description = "Sandy Dirt",
	tiles = {"ws_sandy_dirt.png",
		{name = "ws_sandy_dirt.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
})

minetest.register_node("ws_core:stone_with_coal", {
	description = "Coal Ore",
	tiles = {"ws_stone.png^ws_mineral_coal.png"},
	groups = {cracky = 3},
	drop = 'ws_core:coal',
})

minetest.register_node("ws_core:stone_with_gold", {
	description = "Gold Ore",
	tiles = {"ws_stone.png^ws_mineral_gold.png"},
	groups = {cracky = 3},
	drop = 'ws_core:gold',
})

minetest.register_node("ws_core:stone_with_iron", {
	description = "Iron Ore",
	tiles = {"ws_stone.png^ws_mineral_iron.png"},
	groups = {cracky = 3},
	drop = 'ws_core:iron',
})

minetest.register_node("ws_core:stone_with_copper", {
	description = "Copper Ore",
	tiles = {"ws_stone.png^ws_mineral_copper.png"},
	groups = {cracky = 3},
	drop = 'ws_core:iron',
})

minetest.register_node("ws_core:stone", {
	description = "Stone",
	tiles = {"ws_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'ws_core:cobble',
	legacy_mineral = true,
})

minetest.register_node("ws_core:stone_block", {
	description = "Stone Block",
	tiles = {"ws_stone_block.png"},
	groups = {cracky = 3, stone = 1},
	legacy_mineral = true,
})

minetest.register_node("ws_core:cobble", {
	description = "Cobblestone",
	tiles = {"ws_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
})

minetest.register_node("ws_core:dead_tree", {
	description = "Dead Log",
	tiles = {"ws_dead_tree_top.png", "ws_dead_tree_top.png", "ws_dead_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},

	on_place = minetest.rotate_node
})

minetest.register_node("ws_core:wood", {
	description = "Wooden Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"ws_wood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
})

minetest.register_node("ws_core:water_source", {
	description = "Water Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "ws_toxic_water_source_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
		{
			name = "ws_toxic_water_source_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	damage_per_second = 5,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "ws_core:water_flowing",
	liquid_alternative_source = "ws_core:water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, cools_lava = 1},
	sounds = ws_core.node_sound_water_ws_cores(),
})

minetest.register_node("ws_core:water_flowing", {
	description = "Flowing Water",
	drawtype = "flowingliquid",
	tiles = {"ws_toxic_water_flowing_animated.png"},
	special_tiles = {
		{
			name = "ws_toxic_water_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "ws_toxic_water_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	damage_per_second = 5,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "ws_core:water_flowing",
	liquid_alternative_source = "ws_core:water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, not_in_creative_inventory = 1,
		cools_lava = 1},
	sounds = ws_core.node_sound_water_ws_cores(),
})
