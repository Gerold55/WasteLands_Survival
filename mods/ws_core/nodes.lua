minetest.register_node("ws_core:dirt_dry", {
	description = "Dry Dirt",
	tiles = {"ws_dirt_dry.png",
		{name = "ws_dirt_dry.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1},
	sounds = ws_core.node_sound_dirt_ws_cores(),
	drop = {
        max_items = 1,
        items = {
            {items = {'ws_core:bone'}, rarity = 13},
            {items = {'ws_core:dirt_dry'}}
        }
    }
})

minetest.register_node("ws_core:clay_dirt", {
	description = "Clay Dirt",
	tiles = {"ws_clay_dirt.png",
		{name = "ws_clay_dirt.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, flammable = 1},
	sounds = ws_core.node_sound_dirt_ws_cores(),
	drop = {
        max_items = 1,
        items = {
            {items = {'ws_core:bone'}, rarity = 13},
            {items = {'ws_core:clay_dirt'}}
        }
    }
})

minetest.register_node("ws_core:dirt_dry_forest", {
	description = "Dry Forest Dirt",
	tiles = {"ws_dirt_forest_dry.png",
		{name = "ws_dirt_forest_dry.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1},
	sounds = ws_core.node_sound_dirt_ws_cores(),
	drop = {
        max_items = 1,
        items = {
            {items = {'ws_core:bone'}, rarity = 13},
            {items = {'ws_core:dirt_dry'}}
        }
    }
})

minetest.register_node("ws_core:gravel", {
	description = "Gravel",
	tiles = {"ws_gravel.png",
		{name = "ws_gravel.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, falling_node = 1},
	sounds = ws_core.node_sound_dirt_ws_cores(),
    drop = {
        max_items = 1,
        items = {
            {items = {'ws_core:flint'}, rarity = 15},
            {items = {'ws_core:gravel'}}
        }
    }
})

minetest.register_node("ws_core:bone", {
	description = "Bone",
	tiles = {"ws_bone.png",
		{name = "ws_bone.png",
			tileable_vertical = false}},
	groups = {cracky = 1},
	sounds = ws_core.node_sound_dirt_ws_cores(),
    drop = {
        max_items = 1,
        items = {
            {items = {'ws_core:bone'}}
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
	drop = 'ws_core:gold_lump',
})

minetest.register_node("ws_core:stone_with_gold_dense", {
	description = "Gold Ore",
	tiles = {"ws_stone.png^ws_mineral_gold_dense.png"},
	groups = {cracky = 3},
	drop = 'ws_core:gold_lump 3',
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
	on_place = minetest.rotate_node,
	on_rightclick = function (pos, node, player, itemstack, pointed_thing)
    if itemstack:get_name() == 'ws_core:knife_flint' then
        minetest.set_node(pos, {name = "ws_core:log_stripped"})
        player:get_inventory():add_item("main", "ws_core:bark")
        player:get_inventory():add_item("main", "ws_core:bug_" .. math.random(1, 10))
    end
end,
})

minetest.register_node("ws_core:log_stripped", {
	description = "Stripped Log",
	tiles = {"ws_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, wood = 1},
})

minetest.register_node("ws_core:wood", {
	description = "Wooden Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"ws_wood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
})

minetest.register_on_dignode(function(pos, oldnode, digger)
		if minetest.get_item_group(oldnode.name, "tree") ~= 0 or minetest.get_item_group(oldnode.name, "wood") ~= 0 then    
			local wield = digger:get_wielded_item():get_name()
				if minetest.get_item_group(wield, "hatchet") == 0 and minetest.get_item_group(wield, "axe") == 0 then
                    digger:get_inventory():remove_item('main', oldnode)
            digger:set_hp(digger:get_hp() -2, "Dug wood without hatchet or axe")
                    minetest.set_node(pos, oldnode)
        end
    end return
end)

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
	sounds = ws_core.node_sound_water_ws_cores(),
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
	sounds = ws_core.node_sound_water_ws_cores(),
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
	sounds = ws_core.node_sound_water_ws_cores(),
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
	sounds = ws_core.node_sound_water_ws_cores(),
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

minetest.register_node("ws_core:clay", {
	description = "Clay",
	tiles = {"ws_clay.png",
		{name = "ws_clay.png",
			tileable_vertical = false}},
	groups = {crumbly = 3},
	drop = "ws_core:clay_lump 4",
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

--temporary fix for missing node - this needs to be redefined
minetest.register_node("ws_core:mossycobble", {
    description = "Sandy Dirt",
    tiles = {"ws_sandy_dirt.png",
        {name = "ws_sandy_dirt.png",
            tileable_vertical = false}},
    groups = {crumbly = 3, soil = 1},
})
