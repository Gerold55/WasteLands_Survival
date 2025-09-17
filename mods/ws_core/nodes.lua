--[[

-Dirts

"ws_core:grass_block"
"ws_core:dirt"
"ws_core:dirt_dry"
"ws_core:dirt_coarse"
"ws_core:dirt_rocky"
"ws_core:dirt_dry_forest"
"ws_core:clay"
"ws_core:clay_blue"
"ws_core:clay_red"
"ws_core:clay_dirt"
"ws_core:sandy_dirt"
"ws_core:gravel"

-Stones

"ws_core:stone"
"ws_core:cobble"
"ws_core:mossycobble"
"ws_core:stone_block"
"ws_core:stonebrick"
"ws_core:stonebrick_cracked"
"ws_core:basalt"
"ws_core:basalt_cobble"
"ws_core:slate"
"ws_core:slate_cobble"
"ws_core:slate_polished"
"ws_core:slate_bricks"
"ws_core:andesite"
"ws_core:andesite_polished"
"ws_core:granite"
"ws_core:diorite"
"ws_core:salt_block"
"ws_core:limestone"
"ws_core:lime_cobble"
"ws_core:lime_brick"
"ws_core:lime_polished"
"ws_core:marble"
"ws_core:marble_cobble"
"ws_core:path_stone"
"ws_core:stalactites"

-Ores

"ws_core:stone_with_coal"
"ws_core:stone_with_coal_dense"
"ws_core:coal_block"
"ws_core:stone_with_gold"
"ws_core:stone_with_gold_dense"
"ws_core:stone_with_iron"
"ws_core:stone_with_iron_dense"
"ws_core:stone_with_copper"
"ws_core:stone_with_copper_dense"

-Woods

"ws_core:log_oak_dry"
"ws_core:log_oak_stripped_dry"
"ws_core:planks_oak_dry"

"ws_core:log_oak"
"ws_core:log_oak_stripped"
"ws_core:planks_oak"

"ws_core:log_balsa"
"ws_core:log_balsa_stripped"
"ws_core:planks_balsa"

"ws_core:log_balsa_dry"
"ws_core:planks_balsa_dry"
"ws_core:log_balsa_stripped_dry"

"ws_core:ladder_wood"
"ws_core:planks_old"

-Plants

"ws_core:gorse"
"ws_core:dry_shrub"
"ws_core:dry_papyrus"
"ws_core:sand_with_cattails"
"ws_core:cattail_top"
"ws_core:sand_with_spoison"

"ws_core:brain_skeleton"
"ws_core:skeleton_brain"

-Liquids

"ws_core:water_source_toxic"
"ws_core:water_flowing_toxic"
"ws_core:water_source"
"ws_core:water_flowing"
"ws_core:oil_source"
"ws_core:oil_flowing"
"ws_core:lava_source"
"ws_core:lava_flowing"

-- non-natural
"ws_core:bookshelf"
"ws_core:carpet1"
"ws_core:glass"
"ws_core:shingle_brown"
"ws_core:shingle_brown_slope"
"ws_core:shingle_brown_slope2"
"ws_core:shingle_brown_slope3"
"ws_core:shingle_gray_slope"
"ws_core:shingle_gray_slope2"
"ws_core:shingle_gray_slope3"

-Misc

"ws_core:bone"
"ws_core:straw"

"ws_core:plaster"
"ws_core:plaster_square"
"ws_core:plaster_straight"
"ws_core:plaster_cross"

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
			{items = {'ws_core:bone_shard'}, rarity = 13},
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
			{items = {'ws_core:bone_shard'}, rarity = 13},
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
			{items = {'ws_core:bone_shard'}, rarity = 13},
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
			{items = {'ws_core:bone_shard'}, rarity = 13},
			{items = {'ws_core:dirt_dry'}}
		}
	}
})

minetest.register_node("ws_core:clay", {
	description = "Clay",
	tiles = {"ws_clay2.png",
		{name = "ws_clay2.png",
			tileable_vertical = false}},
	groups = {crumbly = 3},
	drop = "ws_core:clay_lump 4",
})

minetest.register_node("ws_core:clay_blue", {
	description = "Blue Clay",
	tiles = {"ws_clay_blue.png",
		{name = "ws_clay_blue.png",
			tileable_vertical = false}},
	groups = {crumbly = 3},
	drop = "ws_core:clay_lump 4",
})

minetest.register_node("ws_core:clay_red", {
	description = "Red Clay",
	tiles = {"ws_clay_red.png",
		{name = "ws_clay_red.png",
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
			{items = {'ws_core:bone_shard'}, rarity = 13},
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

minetest.register_node("ws_core:mossycobble", {
	description = ("Mossy Cobblestone"),
	tiles = {"ws_mossycobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 1},
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

minetest.register_node("ws_core:stonebrick_cracked", {
	description = "Cracked Stone Brick",
	tiles = {"ws_stonebrick_cracked.png"},
	groups = {cracky = 3, stone = 1},
	legacy_mineral = true,
})

minetest.register_node("ws_core:basalt", {
	description = "Basalt",
	tiles = {"ws_basalt.png"},
	groups = {cracky = 3, stone = 1},
	legacy_mineral = true,
	drop = 'ws_core:basalt_cobble',
})

minetest.register_node("ws_core:basalt_cobble", {
	description = "Basalt Cobble",
	tiles = {"ws_basalt_cobble.png"},
	groups = {cracky = 3, stone = 1},
	legacy_mineral = true,
})

minetest.register_node("ws_core:slate", {
	description = "Slate",
	tiles = {"ws_slate.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'ws_core:slate_cobble',
	legacy_mineral = true,
})

minetest.register_node("ws_core:slate_cobble", {
	description = "Slate Cobble",
	tiles = {"ws_slate_cobble.png"},
	groups = {cracky = 3, stone = 1},
	legacy_mineral = true,
})

minetest.register_node("ws_core:slate_polished", {
	description = "Slate Cobble",
	tiles = {"ws_slate_polished.png"},
	groups = {cracky = 3, stone = 1},
	legacy_mineral = true,
})

minetest.register_node("ws_core:slate_bricks", {
	description = "Slate Bricks",
	tiles = {"ws_slate_bricks.png"},
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

minetest.register_node("ws_core:salt_block", {
	description = "Salt",
	tiles = {"ws_salt_block.png"},
	groups = {cracky = 3, stone = 1},
	legacy_mineral = true,
})

minetest.register_node("ws_core:limestone", {
	description = "Limestone",
	tiles = {"ws_limestone.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'ws_core:limestone',
	legacy_mineral = true,
})

minetest.register_node("ws_core:lime_cobble", {
	description = "Limestone Cobble",
	tiles = {"ws_lime_cobble.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'ws_core:lime_cobble',
	legacy_mineral = true,
})

minetest.register_node("ws_core:lime_brick", {
	description = "Limestone Bricks",
	tiles = {"ws_lime_smallbricks.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'ws_core:lime_brick',
	legacy_mineral = true,
})

minetest.register_node("ws_core:lime_brick_med", {
	description = "Limestone Bricks (Medium)",
	tiles = {"ws_lime_bricks_med.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'ws_core:lime_brick_med',
	legacy_mineral = true,
})

minetest.register_node("ws_core:lime_polished", {
	description = "Polished Limestone",
	tiles = {"ws_lime_polished.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'ws_core:lime_polished',
	legacy_mineral = true,
})

minetest.register_node("ws_core:marble", {
	description = "Marble",
	tiles = {"ws_marble.png"},
	groups = {cracky = 3, stone = 1},
	legacy_mineral = true,
	drop = 'ws_core:marble_cobble',
})

minetest.register_node("ws_core:marble_cobble", {
	description = "Marble Cobble",
	tiles = {"ws_marble_cobble.png"},
	groups = {cracky = 3, stone = 1},
	legacy_mineral = true,
})

minetest.register_node("ws_core:path_stone", {
	description = "Stone Path",
	tiles = {"ws_stone_path.png"},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {cracky = 3, stone = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.4375, 0.5}, -- NodeBox9
		}
	}
})


minetest.register_node("ws_core:stalactites", {
	description = "Stalactite",
	drawtype = "plantlike",
	tiles = {"ws_stalag1.png"},
	inventory_image = "ws_stalag1.png",
	wield_image = "ws_stalag1.png",
	walkable = false,
	groups = {cracky = 3, stone = 1},
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

minetest.register_node("ws_core:coal_block", {
	description = "Coal Block",
	tiles = {"ws_coal_block.png"},
	groups = {cracky = 3},
	drop = 'ws_core:coal_block',
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
	sounds = ws_core.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("ws_core:log_oak_stripped_dry", {
	description = "Dry Stripped Oak Log",
	tiles = {"ws_log_oak_stripped_dry_top.png", "ws_log_oak_stripped_dry_top.png", "ws_log_oak_stripped_dry.png"},
	is_ground_content = false,
	paramtype2 = "facedir",
	groups = {choppy = 2, tree = 1, flammable = 2},
	sounds = ws_core.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("ws_core:planks_oak_dry", {
	description = "Dry Oak Wood Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"ws_planks_oak_dry.png"},
	is_ground_content = false,
	groups = {choppy = 3, planks = 1, wood = 1, flammable = 2},
	sounds = ws_core.node_sound_wood_defaults(),
})

minetest.register_node("ws_core:log_oak", {
	description = "Oak Log",
	tiles = {"ws_log_oak_top.png", "ws_log_oak_top.png", "ws_log_oak.png"},
	paramtype2 = "facedir",
	groups = {choppy = 2, tree = 1, flammable = 2},
	sounds = ws_core.node_sound_wood_defaults(),
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
	sounds = ws_core.node_sound_wood_defaults(),
})

minetest.register_node("ws_core:log_balsa", {
	description = "Balsa Log",
	tiles = {"ws_log_balsa_top.png", "ws_log_balsa_top.png", "ws_log_balsa.png"},
	paramtype2 = "facedir",
	groups = {choppy = 2, tree = 1, flammable = 2},
	sounds = ws_core.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("ws_core:log_balsa_stripped", {
	description = "Stripped Balsa Log",
	tiles = {"ws_log_balsa_stripped_top.png", "ws_log_balsa_stripped_top.png", "ws_log_balsa_stripped.png"},
	is_ground_content = false,
	paramtype2 = "facedir",
	groups = {choppy = 2, tree = 1, flammable = 2},
	sounds = ws_core.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("ws_core:planks_balsa", {
	description = "Balsa Wood Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"ws_planks_balsa.png"},
	is_ground_content = false,
	groups = {choppy = 3, planks = 1, wood = 1, flammable = 2},
	sounds = ws_core.node_sound_wood_defaults(),
})

minetest.register_node("ws_core:log_balsa_dry", {
	description = "Dry Balsa Log",
	tiles = {"ws_log_balsa_dry_top.png", "ws_log_balsa_dry_top.png", "ws_log_balsa_dry.png"},
	paramtype2 = "facedir",
	groups = {choppy = 2, tree = 1, flammable = 2},
	sounds = ws_core.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("ws_core:planks_balsa_dry", {
	description = "Dry Balsa Wood Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"ws_planks_balsa_dry.png"},
	is_ground_content = false,
	groups = {choppy = 3, planks = 1, wood = 1, flammable = 2},
	sounds = ws_core.node_sound_wood_defaults(),
})

minetest.register_node("ws_core:log_balsa_stripped_dry", {
	description = "Dry Stripped Balsa Log",
	tiles = {"ws_log_balsa_stripped_top.png", "ws_log_balsa_stripped_top.png", "ws_log_balsa_stripped_dry.png"},
	is_ground_content = false,
	paramtype2 = "facedir",
	groups = {choppy = 2, tree = 1, flammable = 2},
	sounds = ws_core.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("ws_core:ladder_wood", {
	description = "Ladder",
	drawtype = "signlike",
	tiles = {"ws_ladder.png"},
	inventory_image = "ws_ladder.png",
	wield_image = "ws_ladder.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = = <default>
		--wall_bottom = = <default>
		--wall_side = = <default>
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	legacy_wallmounted = true,
	sounds = ws_core.node_sound_wood_defaults(),
})

-- special planks, only obtainable from spawned structures
minetest.register_node("ws_core:planks_old", {
	description = "Old Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"ws_planks_old.png"},
	is_ground_content = false,
	groups = {choppy = 3, planks = 1, wood = 1, flammable = 2},
	sounds = ws_core.node_sound_wood_defaults(),
})

-- ======
-- PLANTS
-- ======

-- Register nodes
minetest.register_node("ws_core:gorse", {
    description = "Gorse",
    drawtype = "plantlike",
    tiles = {"flowers_gorse.png"}, -- Path to the texture
    inventory_image = "flowers_gorse.png",
    wield_image = "flowers_gorse.png",
    paramtype = "light",
    sunlight_propagates = true,
    walkable = false,
    groups = {snappy=3, flammable=2},

    -- Define the drop function
    on_drop = function(itemstack, dropper, pos)
        local drops = {"ws_core:stick 2"} -- Drop 2 sticks by default

        -- Chance to drop a gorse flower
        if math.random() < 0.05 then -- 5% chance
            table.insert(drops, "ws_core:gorse_flower")
        end

        return drops
    end,
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
	groups = {snappy = 3, flammable = 2},
	sounds = ws_core.node_sound_leaves_defaults(),

	after_dig_node = function(pos, node, metadata, digger)
		ws_core.dig_up(pos, node, digger)
	end,
})

minetest.register_node("ws_core:sand_with_cattails", {
    description = "Cattail",
    drawtype = "plantlike_rooted",
    waving = 1,
    tiles = {"ws_sandy_dirt.png"},
    special_tiles = {
        {name = "ws_cattail_bottom.png", tileable_vertical = true}
    },
    inventory_image = "ws_cattail_roots.png",
    wield_image = "ws_cattail_roots.png",
    paramtype = "light",
    paramtype2 = "leveled",
    groups = {snappy = 3},
    walkable = false,
    node_dig_prediction = "ws_core:sandy_dirt",
    node_placement_prediction = "",
    sounds = ws_core.node_sound_sand_defaults({
        dig = {name = "default_dig_snappy", gain = 0.2},
        dug = {name = "default_grass_footstep", gain = 0.25},
    }),
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
            {-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
        },
    },
    on_place = function(itemstack, placer, pointed_thing)
        if pointed_thing.type == "node" and placer and not placer:get_player_control().sneak then
            local node_ptu = minetest.get_node(pointed_thing.under)
            if node_ptu.name == "ws_core:sandy_dirt" then
                local pos = pointed_thing.under
                local pos_top = pointed_thing.above
                local player_name = placer:get_player_name()

                if not minetest.is_protected(pos, player_name) and
                   not minetest.is_protected(pos_top, player_name) then
                    minetest.set_node(pos, {name = "ws_core:sand_with_cattails", param2 = 16})
                    minetest.set_node(pos_top, {name = "ws_core:cattail_top"})
                    if not (creative and creative.is_enabled_for and creative.is_enabled_for(player_name)) then
                        itemstack:take_item()
                    end
                else
                    minetest.chat_send_player(player_name, "Node is protected")
                    minetest.record_protection_violation(pos, player_name)
                end
            end
        end
        return itemstack
    end,
    after_destruct = function(pos, oldnode)
        minetest.set_node(pos, {name = "ws_core:sandy_dirt"})
    end,
})

minetest.register_node("ws_core:cattail_top", {
    description = "Cattail Top",
    drawtype = "plantlike",
    waving = 1,
    paramtype = "light",
    tiles = {"ws_cattail_top.png"},
    inventory_image = "ws_cattail.png",
    groups = {snappy = 3, not_in_creative_inventory = 1},
    walkable = false,
    sounds = ws_core.node_sound_stone_defaults({
        dig = {name = "default_dig_snappy", gain = 0.2},
        dug = {name = "default_grass_footstep", gain = 0.25},
    }),
    selection_box = {
        type = "fixed",
        fixed = {
            {-4/16, -0.5, -4/16, 4/16, 0.5, 4/16},
        },
    },
})


minetest.register_node("ws_core:sand_with_spoison", {
	description = "Spoison",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"ws_sandy_dirt.png"},
	special_tiles = {{name = "ws_spoison_splant.png", tileable_vertical = true}},
	inventory_image = "ws_spoison_splant.png",
	wield_image = "ws_spoison_splant.png",
	paramtype = "light",
	paramtype2 = "leveled",
	groups = {snappy = 3},
	selection_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
				{-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
		},
	},
	node_dig_prediction = "ws_core:sandy_dirt",
	node_placement_prediction = "",
	sounds = ws_core.node_sound_sand_defaults({
		dig = {name = "default_dig_snappy", gain = 0.2},
		dug = {name = "default_grass_footstep", gain = 0.25},
	}),

	on_place = function(itemstack, placer, pointed_thing)
		-- Call on_rightclick if the pointed node defines it
		if pointed_thing.type == "node" and placer and
				not placer:get_player_control().sneak then
			local node_ptu = minetest.get_node(pointed_thing.under)
			local def_ptu = minetest.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointed_thing.under, node_ptu, placer,
					itemstack, pointed_thing)
			end
		end

		-- only place on sandy dirt
		local pos = pointed_thing.under
		if minetest.get_node(pos).name ~= "ws_core:sandy_dirt" then
			return itemstack
		end

		local pos_top = pointed_thing.above
		local player_name = placer:get_player_name()

		if not minetest.is_protected(pos, player_name) and
				not minetest.is_protected(pos_top, player_name) then
			minetest.set_node(pos, {name = "ws_core:sand_with_spoison",
                param2 = 16})
			if not (creative and creative.is_enabled_for
					and creative.is_enabled_for(player_name)) then
				itemstack:take_item()
			end
		else
			minetest.chat_send_player(player_name, "Node is protected")
			minetest.record_protection_violation(pos, player_name)
		end

		return itemstack
	end,

	after_destruct  = function(pos, oldnode)
		minetest.set_node(pos, {name = "ws_core:sandy_dirt"})
	end
})

-- Brain Skeleton (originally from XOcean)

minetest.register_node("ws_core:brain_skeleton", {
	description = "Brain Coral Skeleton Block",
	tiles = {"xocean_coral_brain_skeleton.png"},
	groups = {cracky = 3},
	sounds = ws_core.node_sound_stone_defaults(),
})

minetest.register_node("ws_core:skeleton_brain", {
	description = "Brain Coral Skeleton",
	drawtype = "plantlike_rooted",
	waving = 1,
	paramtype = "light",
	tiles = {"xocean_coral_brain_skeleton.png"},
	special_tiles = {{name = "xocean_brain_skeleton.png", tileable_vertical = true}},
	inventory_image = "xocean_brain_skeleton.png",
	groups = {snappy = 3},
	selection_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
				{-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
		},
	},
	node_dig_prediction = "ws_core:brain_skeleton",
	node_placement_prediction = "",
	sounds = ws_core.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = 0.2},
		dug = {name = "default_grass_footstep", gain = 0.25},
	}),

	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" or not placer then
			return itemstack
		end

		local player_name = placer:get_player_name()
		local pos_under = pointed_thing.under
		local pos_above = pointed_thing.above

		if minetest.get_node(pos_under).name ~= "ws_core:brain_skeleton" or
				minetest.get_node(pos_above).name ~= "ws_core:toxic_water_source" then
			return itemstack
		end

		if minetest.is_protected(pos_under, player_name) or
				minetest.is_protected(pos_above, player_name) then
			minetest.chat_send_player(player_name, "Node is protected")
			minetest.record_protection_violation(pos_under, player_name)
			return itemstack
		end

		minetest.set_node(pos_under, {name = "ws_core:skeleton_brain"})
		if not (creative and creative.is_enabled_for(player_name)) then
			itemstack:take_item()
		end

		return itemstack
	end,

	after_destruct  = function(pos, oldnode)
		minetest.set_node(pos, {name = "ws_core:brain_skeleton"})
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
	groups = {liquid = 2},
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
	groups = {liquid = 2,
		not_in_creative_inventory = 1},
})

minetest.register_node("ws_core:lava_source", {
	description = "Lava Source",
	drawtype = "liquid",
	tiles = {"ws_lava.png"},
	special_tiles = {
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
	tiles = {"ws_lava.png"},
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
-- NON-NATURAL
-- ====

minetest.register_node("ws_core:bookshelf", {
	description = "Bookshelf",
	paramtype2 = "facedir",
	tiles = {
		"ws_planks_oak.png",
		"ws_planks_oak.png",
		"ws_planks_oak.png",
		"ws_planks_oak.png",
		"ws_bookshelf.png",
		"ws_bookshelf.png"
	},
	groups = {choppy = 3, wood = 1, flammable = 2},
	sounds = ws_core.node_sound_wood_defaults(),
})

minetest.register_node("ws_core:carpet1", {
	description = "Diamond Carpet",
	tiles = {"ws_carpet_diamond.png"},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {snappy = 3, flammable = 3},
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
	},
	sounds = ws_core.node_sound_leaves_defaults(),
})

minetest.register_node("ws_core:glass", {
	description = "Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"ws_glass.png", "ws_glass_detail.png"},
	paramtype = "light",
	paramtype2 = "glasslikeliquidlevel",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = ws_core.node_sound_glass_defaults(),
})

minetest.register_node("ws_core:shingle_brown", {
	description = "Brown Shingles",
	paramtype2 = "facedir",
	tiles = {
		"ws_shingles_brown.png"
	},
	groups = {cracky = 3, flammable = 2},
	sounds = ws_core.node_sound_wood_defaults(),
})

minetest.register_node("ws_core:shingle_brown_slope", {
	description = "Brown Shingles",
	drawtype = "mesh",
	mesh = 'homedecor_slope.obj',
	paramtype2 = "facedir",
	tiles = {
		"ws_shingles_brown.png"
	},
	groups = {cracky = 3, flammable = 2},
	on_place = minetest.rotate_node,
	sounds = ws_core.node_sound_wood_defaults(),
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.3125, 0.5}, -- NodeBox1
			{-0.5, -0.5, -0.5, 0.5, -0.125, 0.3125}, -- NodeBox2
			{-0.5, -0.125, -0.5, 0.5, 0.0625, 0.125}, -- NodeBox3
			{-0.5, 0.0625, -0.5, 0.5, 0.25, -0.0625}, -- NodeBox4
			{-0.5, 0.25, -0.5, 0.5, 0.5, -0.25}, -- NodeBox5
		}
	}
})

minetest.register_node("ws_core:shingle_brown_slope2", {
	description = "Brown Shingles (Inner Corner)",
	drawtype = "mesh",
	mesh = 'homedecor_slope_inner_corner.obj',
	paramtype2 = "facedir",
	tiles = {
		"ws_shingles_brown.png"
	},
	groups = {cracky = 3, flammable = 2},
	on_place = minetest.rotate_node,
	sounds = ws_core.node_sound_wood_defaults(),
})

minetest.register_node("ws_core:shingle_brown_slope3", {
	description = "Brown Shingles (Outer Corner)",
	drawtype = "mesh",
	mesh = 'homedecor_slope_outer_corner.obj',
	paramtype2 = "facedir",
	tiles = {
		"ws_shingles_brown.png"
	},
	groups = {cracky = 3, flammable = 2},
	on_place = minetest.rotate_node,
	sounds = ws_core.node_sound_wood_defaults(),
})

minetest.register_node("ws_core:shingle_gray_slope", {
	description = "Gray Shingles",
	drawtype = "mesh",
	mesh = 'homedecor_slope.obj',
	paramtype2 = "facedir",
	tiles = {
		"ws_shingles_gray.png"
	},
	groups = {cracky = 3, flammable = 2},
	on_place = minetest.rotate_node,
	sounds = ws_core.node_sound_wood_defaults(),
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.3125, 0.5}, -- NodeBox1
			{-0.5, -0.5, -0.5, 0.5, -0.125, 0.3125}, -- NodeBox2
			{-0.5, -0.125, -0.5, 0.5, 0.0625, 0.125}, -- NodeBox3
			{-0.5, 0.0625, -0.5, 0.5, 0.25, -0.0625}, -- NodeBox4
			{-0.5, 0.25, -0.5, 0.5, 0.5, -0.25}, -- NodeBox5
		}
	}
})

minetest.register_node("ws_core:shingle_gray_slope2", {
	description = "Gray Shingles (Inner Corner)",
	drawtype = "mesh",
	mesh = 'homedecor_slope_inner_corner.obj',
	paramtype2 = "facedir",
	tiles = {
		"ws_shingles_gray.png"
	},
	groups = {cracky = 3, flammable = 2},
	on_place = minetest.rotate_node,
	sounds = ws_core.node_sound_wood_defaults(),
})

minetest.register_node("ws_core:shingle_gray_slope3", {
	description = "Gray Shingles (Outer Corner)",
	drawtype = "mesh",
	mesh = 'homedecor_slope_outer_corner.obj',
	paramtype2 = "facedir",
	tiles = {
		"ws_shingles_gray.png"
	},
	groups = {cracky = 3, flammable = 2},
	on_place = minetest.rotate_node,
	sounds = ws_core.node_sound_wood_defaults(),
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
	groups = {cracky = 3},
	on_place = minetest.rotate_node,
	sounds = ws_core.node_sound_dirt_defaults(),
})

minetest.register_node("ws_core:straw", {
	description = "Straw",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"ws_straw.png"},
	is_ground_content = false,
	groups = {choppy = 3, flammable = 2},
	sounds = ws_core.node_sound_wood_defaults(),
})

-- ====
-- Housing Mats
-- ====

minetest.register_node("ws_core:plaster", {
	description = "Plaster",
	tiles = {
		"ws_plaster.png"
	},
	groups = {cracky = 1},
	sounds = ws_core.node_sound_stone_defaults(),
})

minetest.register_node("ws_core:plaster_square", {
	description = "Square Framed Plaster",
	tiles = {
		"ws_plaster_frame_square.png"
	},
	paramtype2 = "facedir",
	groups = {cracky = 1},
	on_place = minetest.rotate_node,
	sounds = ws_core.node_sound_stone_defaults(),
})

minetest.register_node("ws_core:plaster_straight", {
	description = "Straight Framed Plaster",
	tiles = {
		"ws_plaster_frame_square.png",
		"ws_plaster_frame_square.png",
		"ws_plaster_frame_straight.png",
		"ws_plaster_frame_straight.png",
		"ws_plaster_frame_straight.png",
		"ws_plaster_frame_straight.png"
	},
	paramtype2 = "facedir",
	groups = {cracky = 1},
	on_place = minetest.rotate_node,
	sounds = ws_core.node_sound_stone_defaults(),
})

minetest.register_node("ws_core:plaster_cross", {
	description = "Diagonal Framed Plaster",
	tiles = {
		"ws_plaster_frame_square.png",
		"ws_plaster_frame_square.png",
		"ws_plaster_frame_cross.png",
		"ws_plaster_frame_cross.png",
		"ws_plaster_frame_cross.png",
		"ws_plaster_frame_cross.png"
	},
	paramtype2 = "facedir",
	groups = {cracky = 1},
	on_place = minetest.rotate_node,
	sounds = ws_core.node_sound_stone_defaults(),
})
