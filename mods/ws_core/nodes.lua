--[[

-Dirts

"ws_core:dirt_dry"
"ws_core:dirt_coarse"
"ws_core:dirt_rocky"
"ws_core:dirt_dry_forest"
"ws_core:clay"
"ws_core:clay_dirt"
"ws_core:sandy_dirt"
"ws_core:gravel"

-Stones

"ws_core:stone"
"ws_core:cobble"
"ws_core:stone_block"
"ws_core:stonebrick"
"ws_core:basalt"

-Ores

"ws_core:stone_with_coal"
"ws_core:stone_with_coal_dense"
"ws_core:stone_with_gold"
"ws_core:stone_with_gold_dense"
"ws_core:stone_with_iron"
"ws_core:stone_with_iron_dense"
"ws_core:stone_with_copper"
"ws_core:stone_with_copper_dense"

-Woods

"ws_core:log_dead"
"ws_core:log_dead_stripped"
"ws_core:planks_dead"

"ws_core:log_oak"
"ws_core:log_oak_stripped"
"ws_core:planks_oak"

"ws_core:log_balsa"
"ws_core:log_balsa_stripped"
"ws_core:planks_balsa"

"ws_core:log_balsa_stripped_dry"

"ws_core:planks_structure"

-Plants

"ws_core:gorse"
"ws_core:dry_shrub"
"ws_core:dry_papyrus"

-Liquids

"ws_core:water_source_toxic"
"ws_core:water_flowing_toxic"
"ws_core:water_source"
"ws_core:water_flowing"
"ws_core:oil_source"
"ws_core:oil_flowing"
"ws_core:lava_source"
"ws_core:lava_flowing"

-Misc

"ws_core:bone"
"ws_core:lantern_floor"
"ws_core:lantern_ceiling"
"ws_core:stalactites"
--]]


-- =====
-- DIRTS
-- =====
minetest.register_node("ws_core:grass_block", {
	description = "Grass Block",
	tiles = {"ws_grass_top.png",
		{name = "ws_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1},
	sounds = ws_core.node_sound_dirt_defaults(),
	drop = {
		max_items = 1,
		items = {
			{items = {'ws_core:bone'}, rarity = 13},
			{items = {'ws_core:dirt'}}
		}
	}
})

minetest.register_node("ws_core:dirt", {
	description = "Dirt",
	tiles = {"ws_dirt.png",
		{name = "ws_dirt.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1},
	sounds = ws_core.node_sound_dirt_defaults(),
	drop = {
		max_items = 1,
		items = {
			{items = {'ws_core:bone'}, rarity = 13},
			{items = {'ws_core:dirt'}}
		}
	}
})

minetest.register_node("ws_core:dirt_dry", {
	description = "Dry Dirt",
	tiles = {"ws_dirt_dry.png",
		{name = "ws_dirt_dry.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1},
	sounds = ws_core.node_sound_dirt_defaults(),
	drop = {
		max_items = 1,
		items = {
			{items = {'ws_core:bone'}, rarity = 13},
			{items = {'ws_core:dirt_dry'}}
		}
	}
})

minetest.register_node("ws_core:dirt_coarse", {
	description = "Coarse Dirt",
	tiles = {"ws_coarse_dry.png",
		{name = "ws_coarse_dry.png",
			tileable_vertical = false}},
	groups = {crumbly = 3},
	drop = "ws_core:dirt_coarse",
})

minetest.register_node("ws_core:dirt_rocky", {
	description = "Rocky Dirt",
	tiles = {"ws_rocky_dirt.png",
		{name = "ws_rocky_dirt.png",
			tileable_vertical = false}},
	groups = {crumbly = 3},
	drop = "ws_core:dirt_rocky",
})

minetest.register_node("ws_core:dirt_dry_forest", {
	description = "Dry Forest Dirt",
	tiles = {"ws_dirt_forest_dry.png",
		{name = "ws_dirt_forest_dry.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1},
	sounds = ws_core.node_sound_dirt_defaults(),
	drop = {
		max_items = 1,
		items = {
			{items = {'ws_core:bone'}, rarity = 13},
			{items = {'ws_core:dirt_dry'}}
		}
	}
})

minetest.register_node("ws_core:clay", {
	description = "Clay",
	tiles = {"ws_clay.png",
		{name = "ws_clay.png",
			tileable_vertical = false}},
	groups = {crumbly = 3},
	drop = "ws_core:clay_lump 4",
})

minetest.register_node("ws_core:clay_dirt", {
	description = "Clay Dirt",
	tiles = {"ws_clay_dirt.png",
		{name = "ws_clay_dirt.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1},
	sounds = ws_core.node_sound_dirt_defaults(),
	drop = {
		max_items = 1,
		items = {
			{items = {'ws_core:bone'}, rarity = 13},
			{items = {'ws_core:clay_lump'}, rarity = 13},
			{items = {'ws_core:clay_dirt'}}
		}
	}
})

minetest.register_node("ws_core:sandy_dirt", {
	description = "Sandy Dirt",
	tiles = {"ws_sandy_dirt.png",
		{name = "ws_sandy_dirt.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1},
})

minetest.register_node("ws_core:gravel", {
	description = "Gravel",
	tiles = {"ws_gravel.png",
		{name = "ws_gravel.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, falling_node = 1},
	sounds = ws_core.node_sound_dirt_defaults(),
	drop = {
		max_items = 1,
		items = {
			{items = {'ws_core:flint'}, rarity = 15},
			{items = {'ws_core:gravel'}}
		}
	}
})

-- ======
-- STONES
-- ======

minetest.register_node("ws_core:stone", {
	description = "Stone",
	tiles = {"ws_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'ws_core:cobble',
	legacy_mineral = true,
})

minetest.register_node("ws_core:cobble", {
	description = "Cobblestone",
	tiles = {"ws_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
})

minetest.register_node("ws_core:stone_block", {
	description = "Stone Block",
	tiles = {"ws_stone_block.png"},
	groups = {cracky = 3, stone = 1},
	legacy_mineral = true,
})

minetest.register_node("ws_core:stonebrick", {
	description = "Stone Brick",
	tiles = {"ws_stonebrick.png"},
	groups = {cracky = 3, stone = 1},
	legacy_mineral = true,
})

minetest.register_node("ws_core:basalt", {
	description = "Basalt",
	tiles = {"ws_basalt.png"},
	groups = {cracky = 3, stone = 1},
	legacy_mineral = true,
})

minetest.register_node("ws_core:slate", {
	description = "Slate",
	tiles = {"ws_slate.png"},
	groups = {cracky = 3, stone = 1},
	legacy_mineral = true,
})

minetest.register_node("ws_core:andesite", {
	description = "Andesite",
	tiles = {"ws_andesite.png"},
	groups = {cracky = 3, stone = 1},
	legacy_mineral = true,
})

minetest.register_node("ws_core:andesite_polished", {
	description = "Polished Andesite",
	tiles = {"ws_andesitepol.png"},
	groups = {cracky = 3, stone = 1},
	legacy_mineral = true,
})

minetest.register_node("ws_core:granite", {
	description = "Granite",
	tiles = {"ws_granite.png"},
	groups = {cracky = 3, stone = 1},
	legacy_mineral = true,
})

minetest.register_node("ws_core:diorite", {
	description = "Diorite",
	tiles = {"ws_diorite.png"},
	groups = {cracky = 3, stone = 1},
	legacy_mineral = true,
})

-- ====
-- ORES
-- ====

minetest.register_node("ws_core:stone_with_coal", {
	description = "Coal Ore",
	tiles = {"ws_stone.png^ws_mineral_coal.png"},
	groups = {cracky = 3},
	drop = 'ws_core:coal',
})

minetest.register_node("ws_core:stone_with_coal_dense", {
	description = "Coal Ore",
	tiles = {"ws_stone.png^ws_mineral_coal_dense.png"},
	groups = {cracky = 3},
	drop = 'ws_core:coal 3',
})

minetest.register_node("ws_core:stone_with_gold", {
	description = "Gold Ore",
	tiles = {"ws_stone.png^ws_mineral_gold.png"},
	groups = {cracky = 3},
	drop = 'ws_core:stone_with_gold',
})

minetest.register_node("ws_core:stone_with_gold_dense", {
	description = "Gold Ore",
	tiles = {"ws_stone.png^ws_mineral_gold_dense.png"},
	groups = {cracky = 3},
	drop = 'ws_core:stone_with_gold 3',
})

minetest.register_node("ws_core:stone_with_iron", {
	description = "Iron Ore",
	tiles = {"ws_stone.png^ws_mineral_iron.png"},
	groups = {cracky = 3},
	drop = 'ws_core:iron_lump',
})

minetest.register_node("ws_core:stone_with_iron_dense", {
	description = "Iron Ore",
	tiles = {"ws_stone.png^ws_mineral_iron_dense.png"},
	groups = {cracky = 3},
	drop = 'ws_core:iron_lump 3',
})

minetest.register_node("ws_core:stone_with_copper", {
	description = "Copper Ore",
	tiles = {"ws_stone.png^ws_mineral_copper.png"},
	groups = {cracky = 3},
	drop = 'ws_core:copper_lump',
})

minetest.register_node("ws_core:stone_with_copper_dense", {
	description = "Copper Ore",
	tiles = {"ws_stone.png^ws_mineral_copper_dense.png"},
	groups = {cracky = 3},
	drop = 'ws_core:copper_lump 3',
})

-- =====
-- WOODS
-- =====

minetest.register_node("ws_core:log_oak_dry", {
	description = "Dry Oak Log",
	tiles = {"ws_log_oak_dry_top.png", "ws_log_oak_dry_top.png", "ws_log_oak_dry.png"},
	paramtype2 = "facedir",
	groups = {choppy = 2, tree = 1, flammable = 2},
	on_place = minetest.rotate_node
})

minetest.register_node("ws_core:log_oak_stripped_dry", {
	description = "Dry Stripped Oak Log",
	tiles = {"ws_log_oak_stripped_dry_top.png", "ws_log_oak_stripped_dry_top.png", "ws_log_oak_stripped_dry.png"},
	is_ground_content = false,
	paramtype2 = "facedir",
	groups = {choppy = 2, tree = 1, flammable = 2},
	on_place = minetest.rotate_node
})

minetest.register_node("ws_core:planks_oak_dry", {
	description = "Dry Oak Wood Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"ws_planks_oak_dry.png"},
	is_ground_content = false,
	groups = {choppy = 3, planks = 1, wood = 1, flammable = 2},
})

minetest.register_node("ws_core:log_oak", {
	description = "Oak Log",
	tiles = {"ws_log_oak_top.png", "ws_log_oak_top.png", "ws_log_oak.png"},
	paramtype2 = "facedir",
	groups = {choppy = 2, tree = 1, flammable = 2},
	on_place = minetest.rotate_node
})

minetest.register_node("ws_core:log_oak_stripped", {
	description = "Stripped Oak Log",
	tiles = {"ws_log_oak_stripped_top.png", "ws_log_oak_stripped_top.png", "ws_log_oak_stripped.png"},
	is_ground_content = false,
	paramtype2 = "facedir",
	groups = {choppy = 2, tree = 1, flammable = 2},
	on_place = minetest.rotate_node
})

minetest.register_node("ws_core:planks_oak", {
	description = "Oak Wood Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"ws_planks_oak.png"},
	is_ground_content = false,
	groups = {choppy = 3, planks = 1, wood = 1, flammable = 2},
})

minetest.register_node("ws_core:log_balsa", {
	description = "Balsa Log",
	tiles = {"ws_log_balsa_top.png", "ws_log_balsa_top.png", "ws_log_balsa.png"},
	paramtype2 = "facedir",
	groups = {choppy = 2, tree = 1, flammable = 2},
	on_place = minetest.rotate_node
})

minetest.register_node("ws_core:log_balsa_stripped", {
	description = "Stripped Balsa Log",
	tiles = {"ws_log_balsa_stripped_top.png", "ws_log_balsa_stripped_top.png", "ws_log_balsa_stripped.png"},
	is_ground_content = false,
	paramtype2 = "facedir",
	groups = {choppy = 2, tree = 1, flammable = 2},
	on_place = minetest.rotate_node
})

minetest.register_node("ws_core:planks_balsa", {
	description = "Balsa Wood Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"ws_planks_balsa.png"},
	is_ground_content = false,
	groups = {choppy = 3, planks = 1, wood = 1, flammable = 2},
})

minetest.register_node("ws_core:log_balsa_dry", {
	description = "Dry Balsa Log",
	tiles = {"ws_log_balsa_dry_top.png", "ws_log_balsa_dry_top.png", "ws_log_balsa_dry.png"},
	paramtype2 = "facedir",
	groups = {choppy = 2, tree = 1, flammable = 2},
	on_place = minetest.rotate_node
})

minetest.register_node("ws_core:planks_balsa_dry", {
	description = "Dry Balsa Wood Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"ws_planks_balsa_dry.png"},
	is_ground_content = false,
	groups = {choppy = 3, planks = 1, wood = 1, flammable = 2},
})

minetest.register_node("ws_core:log_balsa_stripped_dry", {
	description = "Dry Stripped Balsa Log",
	tiles = {"ws_log_balsa_stripped_top.png", "ws_log_balsa_stripped_top.png", "ws_log_balsa_stripped_dry.png"},
	is_ground_content = false,
	paramtype2 = "facedir",
	groups = {choppy = 2, tree = 1, flammable = 2},
	on_place = minetest.rotate_node
})

-- special planks, only obtainable from spawned structures
minetest.register_node("ws_core:planks_old", {
	description = "Old Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"ws_planks_old.png"},
	is_ground_content = false,
	groups = {choppy = 3, planks = 1, wood = 1, flammable = 2},
})

-- ======
-- PLANTS
-- ======

minetest.register_node("ws_core:gorse", {
	description = "Gorse",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"flowers_gorse.png"},
	inventory_image = "flowers_gorse.png",
	wield_image = "flowers_gorse.png",
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 4,
	drop = "ws_core:stick",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, attached_node = 1},
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 4 / 16, 6 / 16},
	},
})

minetest.register_node("ws_core:dry_shrub", {
	description = "Dry Shrub",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"ws_dry_shrub.png"},
	inventory_image = "ws_dry_shrub.png",
	wield_image = "ws_dry_shrub.png",
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 4,
	drop = "ws_core:stick",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, attached_node = 1},
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 4 / 16, 6 / 16},
	},
})

minetest.register_node("ws_core:dry_papyrus", {
	description = "Papyrus",
	drawtype = "plantlike",
	tiles = {"ws_dry_papyrus.png"},
	inventory_image = "ws_dry_papyrus.png",
	wield_image = "ws_dry_papyrus.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.5, 6 / 16},
	},
	groups = {snappy = 3, flammable = 2},
	sounds = ws_core.node_sound_leaves_defaults(),

	after_dig_node = function(pos, node, metadata, digger)
		ws_core.dig_up(pos, node, digger)
	end,
})

-- =======
-- LIQUIDS
-- =======

minetest.register_node("ws_core:water_source_toxic", {
	description = "Toxic Water Source",
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
	damage_per_second = 2,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "ws_core:water_flowing_toxic",
	liquid_alternative_source = "ws_core:water_source_toxic",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 68, g = 117, b = 34},
	groups = {water = 3, liquid = 3, cools_lava = 1},
	sounds = ws_core.node_sound_water_defaults(),
})

minetest.register_node("ws_core:water_flowing_toxic", {
	description = "Flowing Toxic Water",
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
	damage_per_second = 2,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "ws_core:water_flowing_toxic",
	liquid_alternative_source = "ws_core:water_source_toxic",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 68, g = 117, b = 34},
	groups = {water = 3, liquid = 3, not_in_creative_inventory = 1,
		cools_lava = 1},
	sounds = ws_core.node_sound_water_defaults(),
})

minetest.register_node("ws_core:water_source", {
	description = "Water Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "ws_water_source_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
		{
			name = "ws_water_source_animated.png",
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
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "ws_core:water_flowing",
	liquid_alternative_source = "ws_core:water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 191, r = 37, g = 112, b = 112},
	groups = {water = 3, liquid = 3, cools_lava = 1},
	sounds = ws_core.node_sound_water_defaults(),
})

minetest.register_node("ws_core:water_flowing", {
	description = "Flowing Water",
	drawtype = "flowingliquid",
	tiles = {"ws_water_flowing_animated.png"},
	special_tiles = {
		{
			name = "ws_water_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "ws_water_flowing_animated.png",
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
	post_effect_color = {a = 191, r = 37, g = 112, b = 112},
	groups = {water = 3, liquid = 3, not_in_creative_inventory = 1,
		cools_lava = 1},
	sounds = ws_core.node_sound_water_defaults(),
})

minetest.register_node("ws_core:oil_source", {
	description = "Oil Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "ws_oil_source_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
		{
			name = "ws_oil_source_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
	},
	alpha = 250,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_viscosity = 2,
	liquid_range = 2,
	liquid_renewable = false,
	liquid_alternative_flowing = "ws_core:oil_flowing",
	liquid_alternative_source = "ws_core:oil_source",
	post_effect_color = {a = 191, r = 1, g = 0, b = 3},
	groups = {liquid = 2, igniter = 1},
})

minetest.register_node("ws_core:oil_flowing", {
	description = "Flowing Oil",
	drawtype = "flowingliquid",
	tiles = {"ws_oil.png"},
	special_tiles = {
		{
			name = "ws_oil_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
		{
			name = "ws_oil_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
	},
	alpha = 250,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_viscosity = 3,
	liquid_range = 2,
	liquid_renewable = false,
	liquid_alternative_flowing = "ws_core:oil_flowing",
	liquid_alternative_source = "ws_core:oil_source",
	post_effect_color = {a = 191, r = 1, g = 0, b = 3},
	groups = {liquid = 2, igniter = 1,
		not_in_creative_inventory = 1},
})

minetest.register_node("ws_core:lava_source", {
	description = "Lava Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "ws_lava_source_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
		{
			name = "ws_lava_source_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
	},
	paramtype = "light",
	light_source = ws_core.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "ws_core:lava_flowing",
	liquid_alternative_source = "ws_core:lava_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 4 * 2,
	post_effect_color = {a = 191, r = 255, g = 64, b = 0},
	groups = {lava = 3, liquid = 2, igniter = 1},
})

minetest.register_node("ws_core:lava_flowing", {
	description = "Flowing Lava",
	drawtype = "flowingliquid",
	tiles = {"ws_core_lava.png"},
	special_tiles = {
		{
			name = "ws_lava_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 6,
			},
		},
		{
			name = "ws_lava_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 6,
			},
		},
	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	light_source = ws_core.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "ws_core:lava_flowing",
	liquid_alternative_source = "ws_core:lava_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 4 * 2,
	post_effect_color = {a = 191, r = 255, g = 64, b = 0},
	groups = {lava = 3, liquid = 2, igniter = 1,
		not_in_creative_inventory = 1},
})

-- ====
-- MISC
-- ====

minetest.register_node("ws_core:bone", {
	description = "Bone",
	tiles = {"ws_bone_top.png","ws_bone_top.png",
		{name = "ws_bone.png",
			tileable_vertical = false}},
	paramtype2 = "facedir",
	groups = {cracky = 1},
	on_place = minetest.rotate_node,
	sounds = ws_core.node_sound_dirt_defaults(),
	drop = {
		max_items = 1,
		items = {
			{items = {'ws_core:bone'}}
		}
	}
})

minetest.register_node("ws_core:lantern_floor", {
	description = "Lantern",
	tiles = {
		"lantern_floor_top.png",
		"lantern_bottem.png",
		"lantern_floor_side.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	light_source = 12,
	groups = {choppy = 2, dig_immediate=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, -0.4375, 0.25}, -- NodeBox1
			{-0.1875, -0.5, -0.1875, 0.1875, 0.0625, 0.1875}, -- NodeBox2
			{-0.25, 0.0625, -0.25, 0.25, 0.125, 0.25}, -- NodeBox3
			{-0.125, 0.125, -0.125, 0.125, 0.1875, 0.125}, -- NodeBox4
		}
	}
})

minetest.register_node("ws_core:lantern_ceiling", {
description = "Lantern",
	tiles = {
		"lantern_ceiling_top.png",
		"lantern_bottem.png",
		"lantern_ceiling_side.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	light_source = 12,
	groups = {choppy = 2, dig_immediate=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, -0.4375, 0.25}, -- NodeBox1
			{-0.1875, -0.5, -0.1875, 0.1875, 0.0625, 0.1875}, -- NodeBox2
			{-0.25, 0.0625, -0.25, 0.25, 0.125, 0.25}, -- NodeBox3
			{-0.125, 0.125, -0.125, 0.125, 0.1875, 0.125}, -- NodeBox4
			{0, 0.1875, 0, 0.0625, 0.5, 0.0625}, -- NodeBox5
			{-0.0625, 0.1875, -0.0625, 0, 0.5, 0}, -- NodeBox6
		}
	}
})

minetest.register_node("ws_core:stalactites", {
	description = "Stalactite",
	drawtype = "plantlike",
	tiles = {"ws_stalag1.png"},
	inventory_image = "ws_stalag1.png",
	wield_image = "ws_stalag1.png",
	sunlight_propagates = true,
	walkable = false,
	groups = {snappy = 3},

	after_dig_node = function(pos, node, metadata, digger)
		ws_core.dig_up(pos, node, digger)
	end,
})
