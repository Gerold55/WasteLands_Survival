-- mods/ws_core/crafting.lua

minetest.register_craft({
	output = 'ws_core:wood 4',
	recipe = {
		{'ws_core:tree'},
	}
})

minetest.register_craft({
	output = 'ws_core:junglewood 4',
	recipe = {
		{'ws_core:jungletree'},
	}
})

minetest.register_craft({
	output = 'ws_core:pine_wood 4',
	recipe = {
		{'ws_core:pine_tree'},
	}
})

minetest.register_craft({
	output = 'ws_core:acacia_wood 4',
	recipe = {
		{'ws_core:acacia_tree'},
	}
})

minetest.register_craft({
	output = 'ws_core:aspen_wood 4',
	recipe = {
		{'ws_core:aspen_tree'},
	}
})

minetest.register_craft({
	output = 'ws_core:wood',
	recipe = {
		{'ws_core:bush_stem'},
	}
})

minetest.register_craft({
	output = 'ws_core:acacia_wood',
	recipe = {
		{'ws_core:acacia_bush_stem'},
	}
})

minetest.register_craft({
	output = 'ws_core:stick 4',
	recipe = {
		{'group:wood'},
	}
})

minetest.register_craft({
	output = 'ws_core:sign_wall_steel 3',
	recipe = {
		{'ws_core:steel_ingot', 'ws_core:steel_ingot', 'ws_core:steel_ingot'},
		{'ws_core:steel_ingot', 'ws_core:steel_ingot', 'ws_core:steel_ingot'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'ws_core:sign_wall_wood 3',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'ws_core:torch 4',
	recipe = {
		{'ws_core:coal_lump'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'ws_core:pick_wood',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'ws_core:pick_stone',
	recipe = {
		{'group:stone', 'group:stone', 'group:stone'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'ws_core:pick_steel',
	recipe = {
		{'ws_core:steel_ingot', 'ws_core:steel_ingot', 'ws_core:steel_ingot'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'ws_core:pick_bronze',
	recipe = {
		{'ws_core:bronze_ingot', 'ws_core:bronze_ingot', 'ws_core:bronze_ingot'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'ws_core:pick_mese',
	recipe = {
		{'ws_core:mese_crystal', 'ws_core:mese_crystal', 'ws_core:mese_crystal'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'ws_core:pick_diamond',
	recipe = {
		{'ws_core:diamond', 'ws_core:diamond', 'ws_core:diamond'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'ws_core:shovel_wood',
	recipe = {
		{'group:wood'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'ws_core:shovel_stone',
	recipe = {
		{'group:stone'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'ws_core:shovel_steel',
	recipe = {
		{'ws_core:steel_ingot'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'ws_core:shovel_bronze',
	recipe = {
		{'ws_core:bronze_ingot'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'ws_core:shovel_mese',
	recipe = {
		{'ws_core:mese_crystal'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'ws_core:shovel_diamond',
	recipe = {
		{'ws_core:diamond'},
		{'group:stick'},
		{'group:stick'},
	}
})

-- Axes
-- Recipes face left to match appearence in textures and inventory

minetest.register_craft({
	output = 'ws_core:axe_wood',
	recipe = {
		{'group:wood', 'group:wood'},
		{'group:wood', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'ws_core:axe_stone',
	recipe = {
		{'group:stone', 'group:stone'},
		{'group:stone', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'ws_core:axe_steel',
	recipe = {
		{'ws_core:steel_ingot', 'ws_core:steel_ingot'},
		{'ws_core:steel_ingot', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'ws_core:axe_bronze',
	recipe = {
		{'ws_core:bronze_ingot', 'ws_core:bronze_ingot'},
		{'ws_core:bronze_ingot', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'ws_core:axe_mese',
	recipe = {
		{'ws_core:mese_crystal', 'ws_core:mese_crystal'},
		{'ws_core:mese_crystal', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'ws_core:axe_diamond',
	recipe = {
		{'ws_core:diamond', 'ws_core:diamond'},
		{'ws_core:diamond', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'ws_core:sword_wood',
	recipe = {
		{'group:wood'},
		{'group:wood'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'ws_core:sword_stone',
	recipe = {
		{'group:stone'},
		{'group:stone'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'ws_core:sword_steel',
	recipe = {
		{'ws_core:steel_ingot'},
		{'ws_core:steel_ingot'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'ws_core:sword_bronze',
	recipe = {
		{'ws_core:bronze_ingot'},
		{'ws_core:bronze_ingot'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'ws_core:sword_mese',
	recipe = {
		{'ws_core:mese_crystal'},
		{'ws_core:mese_crystal'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'ws_core:sword_diamond',
	recipe = {
		{'ws_core:diamond'},
		{'ws_core:diamond'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'ws_core:skeleton_key',
	recipe = {
		{'ws_core:gold_ingot'},
	}
})

minetest.register_craft({
	output = 'ws_core:chest',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', '', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})

minetest.register_craft({
	output = 'ws_core:chest_locked',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', 'ws_core:steel_ingot', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})

minetest.register_craft( {
	type = "shapeless",
	output = "ws_core:chest_locked",
	recipe = {"ws_core:chest", "ws_core:steel_ingot"},
})

minetest.register_craft({
	output = 'ws_core:furnace',
	recipe = {
		{'group:stone', 'group:stone', 'group:stone'},
		{'group:stone', '', 'group:stone'},
		{'group:stone', 'group:stone', 'group:stone'},
	}
})

minetest.register_craft({
	output = 'ws_core:coalblock',
	recipe = {
		{'ws_core:coal_lump', 'ws_core:coal_lump', 'ws_core:coal_lump'},
		{'ws_core:coal_lump', 'ws_core:coal_lump', 'ws_core:coal_lump'},
		{'ws_core:coal_lump', 'ws_core:coal_lump', 'ws_core:coal_lump'},
	}
})

minetest.register_craft({
	output = 'ws_core:coal_lump 9',
	recipe = {
		{'ws_core:coalblock'},
	}
})

minetest.register_craft({
	output = 'ws_core:steelblock',
	recipe = {
		{'ws_core:steel_ingot', 'ws_core:steel_ingot', 'ws_core:steel_ingot'},
		{'ws_core:steel_ingot', 'ws_core:steel_ingot', 'ws_core:steel_ingot'},
		{'ws_core:steel_ingot', 'ws_core:steel_ingot', 'ws_core:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'ws_core:steel_ingot 9',
	recipe = {
		{'ws_core:steelblock'},
	}
})

minetest.register_craft({
	output = 'ws_core:copperblock',
	recipe = {
		{'ws_core:copper_ingot', 'ws_core:copper_ingot', 'ws_core:copper_ingot'},
		{'ws_core:copper_ingot', 'ws_core:copper_ingot', 'ws_core:copper_ingot'},
		{'ws_core:copper_ingot', 'ws_core:copper_ingot', 'ws_core:copper_ingot'},
	}
})

minetest.register_craft({
	output = 'ws_core:copper_ingot 9',
	recipe = {
		{'ws_core:copperblock'},
	}
})

minetest.register_craft({
	output = "ws_core:tinblock",
	recipe = {
		{"ws_core:tin_ingot", "ws_core:tin_ingot", "ws_core:tin_ingot"},
		{"ws_core:tin_ingot", "ws_core:tin_ingot", "ws_core:tin_ingot"},
		{"ws_core:tin_ingot", "ws_core:tin_ingot", "ws_core:tin_ingot"},
	}
})

minetest.register_craft({
	output = "ws_core:tin_ingot 9",
	recipe = {
		{"ws_core:tinblock"},
	}
})

minetest.register_craft({
	output = "ws_core:bronze_ingot 9",
	recipe = {
		{"ws_core:copper_ingot", "ws_core:copper_ingot", "ws_core:copper_ingot"},
		{"ws_core:copper_ingot", "ws_core:tin_ingot", "ws_core:copper_ingot"},
		{"ws_core:copper_ingot", "ws_core:copper_ingot", "ws_core:copper_ingot"},
	}
})

minetest.register_craft({
	output = 'ws_core:bronzeblock',
	recipe = {
		{'ws_core:bronze_ingot', 'ws_core:bronze_ingot', 'ws_core:bronze_ingot'},
		{'ws_core:bronze_ingot', 'ws_core:bronze_ingot', 'ws_core:bronze_ingot'},
		{'ws_core:bronze_ingot', 'ws_core:bronze_ingot', 'ws_core:bronze_ingot'},
	}
})

minetest.register_craft({
	output = 'ws_core:bronze_ingot 9',
	recipe = {
		{'ws_core:bronzeblock'},
	}
})

minetest.register_craft({
	output = 'ws_core:goldblock',
	recipe = {
		{'ws_core:gold_ingot', 'ws_core:gold_ingot', 'ws_core:gold_ingot'},
		{'ws_core:gold_ingot', 'ws_core:gold_ingot', 'ws_core:gold_ingot'},
		{'ws_core:gold_ingot', 'ws_core:gold_ingot', 'ws_core:gold_ingot'},
	}
})

minetest.register_craft({
	output = 'ws_core:gold_ingot 9',
	recipe = {
		{'ws_core:goldblock'},
	}
})

minetest.register_craft({
	output = 'ws_core:diamondblock',
	recipe = {
		{'ws_core:diamond', 'ws_core:diamond', 'ws_core:diamond'},
		{'ws_core:diamond', 'ws_core:diamond', 'ws_core:diamond'},
		{'ws_core:diamond', 'ws_core:diamond', 'ws_core:diamond'},
	}
})

minetest.register_craft({
	output = 'ws_core:diamond 9',
	recipe = {
		{'ws_core:diamondblock'},
	}
})

minetest.register_craft({
	output = "ws_core:sandstone",
	recipe = {
		{"ws_core:sand", "ws_core:sand"},
		{"ws_core:sand", "ws_core:sand"},
	}
})

minetest.register_craft({
	output = "ws_core:sand 4",
	recipe = {
		{"ws_core:sandstone"},
	}
})

minetest.register_craft({
	output = "ws_core:sandstonebrick 4",
	recipe = {
		{"ws_core:sandstone", "ws_core:sandstone"},
		{"ws_core:sandstone", "ws_core:sandstone"},
	}
})

minetest.register_craft({
	output = "ws_core:sandstone_block 9",
	recipe = {
		{"ws_core:sandstone", "ws_core:sandstone", "ws_core:sandstone"},
		{"ws_core:sandstone", "ws_core:sandstone", "ws_core:sandstone"},
		{"ws_core:sandstone", "ws_core:sandstone", "ws_core:sandstone"},
	}
})

minetest.register_craft({
	output = "ws_core:desert_sandstone",
	recipe = {
		{"ws_core:desert_sand", "ws_core:desert_sand"},
		{"ws_core:desert_sand", "ws_core:desert_sand"},
	}
})

minetest.register_craft({
	output = "ws_core:desert_sand 4",
	recipe = {
		{"ws_core:desert_sandstone"},
	}
})

minetest.register_craft({
	output = "ws_core:desert_sandstone_brick 4",
	recipe = {
		{"ws_core:desert_sandstone", "ws_core:desert_sandstone"},
		{"ws_core:desert_sandstone", "ws_core:desert_sandstone"},
	}
})

minetest.register_craft({
	output = "ws_core:desert_sandstone_block 9",
	recipe = {
		{"ws_core:desert_sandstone", "ws_core:desert_sandstone", "ws_core:desert_sandstone"},
		{"ws_core:desert_sandstone", "ws_core:desert_sandstone", "ws_core:desert_sandstone"},
		{"ws_core:desert_sandstone", "ws_core:desert_sandstone", "ws_core:desert_sandstone"},
	}
})

minetest.register_craft({
	output = "ws_core:silver_sandstone",
	recipe = {
		{"ws_core:silver_sand", "ws_core:silver_sand"},
		{"ws_core:silver_sand", "ws_core:silver_sand"},
	}
})

minetest.register_craft({
	output = "ws_core:silver_sand 4",
	recipe = {
		{"ws_core:silver_sandstone"},
	}
})

minetest.register_craft({
	output = "ws_core:silver_sandstone_brick 4",
	recipe = {
		{"ws_core:silver_sandstone", "ws_core:silver_sandstone"},
		{"ws_core:silver_sandstone", "ws_core:silver_sandstone"},
	}
})

minetest.register_craft({
	output = "ws_core:silver_sandstone_block 9",
	recipe = {
		{"ws_core:silver_sandstone", "ws_core:silver_sandstone", "ws_core:silver_sandstone"},
		{"ws_core:silver_sandstone", "ws_core:silver_sandstone", "ws_core:silver_sandstone"},
		{"ws_core:silver_sandstone", "ws_core:silver_sandstone", "ws_core:silver_sandstone"},
	}
})

minetest.register_craft({
	output = 'ws_core:clay',
	recipe = {
		{'ws_core:clay_lump', 'ws_core:clay_lump'},
		{'ws_core:clay_lump', 'ws_core:clay_lump'},
	}
})

minetest.register_craft({
	output = 'ws_core:clay_lump 4',
	recipe = {
		{'ws_core:clay'},
	}
})

minetest.register_craft({
	output = 'ws_core:brick',
	recipe = {
		{'ws_core:clay_brick', 'ws_core:clay_brick'},
		{'ws_core:clay_brick', 'ws_core:clay_brick'},
	}
})

minetest.register_craft({
	output = 'ws_core:clay_brick 4',
	recipe = {
		{'ws_core:brick'},
	}
})

minetest.register_craft({
	output = 'ws_core:paper',
	recipe = {
		{'ws_core:papyrus', 'ws_core:papyrus', 'ws_core:papyrus'},
	}
})

minetest.register_craft({
	output = 'ws_core:book',
	recipe = {
		{'ws_core:paper'},
		{'ws_core:paper'},
		{'ws_core:paper'},
	}
})

minetest.register_craft({
	output = 'ws_core:bookshelf',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'ws_core:book', 'ws_core:book', 'ws_core:book'},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})

minetest.register_craft({
	output = "ws_core:ladder_wood 5",
	recipe = {
		{"group:stick", "", "group:stick"},
		{"group:stick", "group:stick", "group:stick"},
		{"group:stick", "", "group:stick"},
	}
})

minetest.register_craft({
	output = 'ws_core:ladder_steel 15',
	recipe = {
		{'ws_core:steel_ingot', '', 'ws_core:steel_ingot'},
		{'ws_core:steel_ingot', 'ws_core:steel_ingot', 'ws_core:steel_ingot'},
		{'ws_core:steel_ingot', '', 'ws_core:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'ws_core:mese',
	recipe = {
		{'ws_core:mese_crystal', 'ws_core:mese_crystal', 'ws_core:mese_crystal'},
		{'ws_core:mese_crystal', 'ws_core:mese_crystal', 'ws_core:mese_crystal'},
		{'ws_core:mese_crystal', 'ws_core:mese_crystal', 'ws_core:mese_crystal'},
	}
})

minetest.register_craft({
	output = 'ws_core:mese_crystal 9',
	recipe = {
		{'ws_core:mese'},
	}
})

minetest.register_craft({
	output = 'ws_core:mese_crystal_fragment 9',
	recipe = {
		{'ws_core:mese_crystal'},
	}
})

minetest.register_craft({
	output = "ws_core:mese_crystal",
	recipe = {
		{"ws_core:mese_crystal_fragment", "ws_core:mese_crystal_fragment", "ws_core:mese_crystal_fragment"},
		{"ws_core:mese_crystal_fragment", "ws_core:mese_crystal_fragment", "ws_core:mese_crystal_fragment"},
		{"ws_core:mese_crystal_fragment", "ws_core:mese_crystal_fragment", "ws_core:mese_crystal_fragment"},
	}
})

minetest.register_craft({
	output = 'ws_core:meselamp',
	recipe = {
		{'ws_core:glass'},
		{'ws_core:mese_crystal'},
	}
})

minetest.register_craft({
	output = "ws_core:mese_post_light 3",
	recipe = {
		{"", "ws_core:glass", ""},
		{"ws_core:mese_crystal", "ws_core:mese_crystal", "ws_core:mese_crystal"},
		{"", "group:wood", ""},
	}
})

minetest.register_craft({
	output = 'ws_core:obsidian_shard 9',
	recipe = {
		{'ws_core:obsidian'}
	}
})

minetest.register_craft({
	output = 'ws_core:obsidian',
	recipe = {
		{'ws_core:obsidian_shard', 'ws_core:obsidian_shard', 'ws_core:obsidian_shard'},
		{'ws_core:obsidian_shard', 'ws_core:obsidian_shard', 'ws_core:obsidian_shard'},
		{'ws_core:obsidian_shard', 'ws_core:obsidian_shard', 'ws_core:obsidian_shard'},
	}
})

minetest.register_craft({
	output = 'ws_core:obsidianbrick 4',
	recipe = {
		{'ws_core:obsidian', 'ws_core:obsidian'},
		{'ws_core:obsidian', 'ws_core:obsidian'}
	}
})

minetest.register_craft({
	output = 'ws_core:obsidian_block 9',
	recipe = {
		{'ws_core:obsidian', 'ws_core:obsidian', 'ws_core:obsidian'},
		{'ws_core:obsidian', 'ws_core:obsidian', 'ws_core:obsidian'},
		{'ws_core:obsidian', 'ws_core:obsidian', 'ws_core:obsidian'},
	}
})

minetest.register_craft({
	output = 'ws_core:stonebrick 4',
	recipe = {
		{'ws_core:stone', 'ws_core:stone'},
		{'ws_core:stone', 'ws_core:stone'},
	}
})

minetest.register_craft({
	output = 'ws_core:stone_block 9',
	recipe = {
		{'ws_core:stone', 'ws_core:stone', 'ws_core:stone'},
		{'ws_core:stone', 'ws_core:stone', 'ws_core:stone'},
		{'ws_core:stone', 'ws_core:stone', 'ws_core:stone'},
	}
})

minetest.register_craft({
	output = 'ws_core:desert_stonebrick 4',
	recipe = {
		{'ws_core:desert_stone', 'ws_core:desert_stone'},
		{'ws_core:desert_stone', 'ws_core:desert_stone'},
	}
})

minetest.register_craft({
	output = 'ws_core:desert_stone_block 9',
	recipe = {
		{'ws_core:desert_stone', 'ws_core:desert_stone', 'ws_core:desert_stone'},
		{'ws_core:desert_stone', 'ws_core:desert_stone', 'ws_core:desert_stone'},
		{'ws_core:desert_stone', 'ws_core:desert_stone', 'ws_core:desert_stone'},
	}
})

minetest.register_craft({
	output = 'ws_core:snowblock',
	recipe = {
		{'ws_core:snow', 'ws_core:snow', 'ws_core:snow'},
		{'ws_core:snow', 'ws_core:snow', 'ws_core:snow'},
		{'ws_core:snow', 'ws_core:snow', 'ws_core:snow'},
	}
})

minetest.register_craft({
	output = 'ws_core:snow 9',
	recipe = {
		{'ws_core:snowblock'},
	}
})

minetest.register_craft({
	output = "ws_core:emergent_jungle_sapling",
	recipe = {
		{"ws_core:junglesapling", "ws_core:junglesapling", "ws_core:junglesapling"},
		{"ws_core:junglesapling", "ws_core:junglesapling", "ws_core:junglesapling"},
		{"ws_core:junglesapling", "ws_core:junglesapling", "ws_core:junglesapling"},
	}
})


--
-- Crafting (tool repair)
--

minetest.register_craft({
	type = "toolrepair",
	additional_wear = -0.02,
})


--
-- Cooking recipes
--

minetest.register_craft({
	type = "cooking",
	output = "ws_core:glass",
	recipe = "group:sand",
})

minetest.register_craft({
	type = "cooking",
	output = "ws_core:obsidian_glass",
	recipe = "ws_core:obsidian_shard",
})

minetest.register_craft({
	type = "cooking",
	output = "ws_core:stone",
	recipe = "ws_core:cobble",
})

minetest.register_craft({
	type = "cooking",
	output = "ws_core:stone",
	recipe = "ws_core:mossycobble",
})

minetest.register_craft({
	type = "cooking",
	output = "ws_core:desert_stone",
	recipe = "ws_core:desert_cobble",
})

minetest.register_craft({
	type = "cooking",
	output = "ws_core:steel_ingot",
	recipe = "ws_core:iron_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "ws_core:copper_ingot",
	recipe = "ws_core:copper_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "ws_core:tin_ingot",
	recipe = "ws_core:tin_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "ws_core:gold_ingot",
	recipe = "ws_core:gold_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "ws_core:clay_brick",
	recipe = "ws_core:clay_lump",
})

minetest.register_craft({
	type = 'cooking',
	output = 'ws_core:gold_ingot',
	recipe = 'ws_core:skeleton_key',
	cooktime = 5,
})

minetest.register_craft({
	type = 'cooking',
	output = 'ws_core:gold_ingot',
	recipe = 'ws_core:key',
	cooktime = 5,
})


--
-- Fuels
--

-- Support use of group:tree, includes ws_core:tree which has the same burn time
minetest.register_craft({
	type = "fuel",
	recipe = "group:tree",
	burntime = 30,
})

-- Burn time for all woods are in order of wood density,
-- which is also the order of wood colour darkness:
-- aspen, pine, apple, acacia, jungle

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:aspen_tree",
	burntime = 22,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:pine_tree",
	burntime = 26,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:acacia_tree",
	burntime = 34,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:jungletree",
	burntime = 38,
})


-- Support use of group:wood, includes ws_core:wood which has the same burn time
minetest.register_craft({
	type = "fuel",
	recipe = "group:wood",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:aspen_wood",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:pine_wood",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:acacia_wood",
	burntime = 8,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:junglewood",
	burntime = 9,
})


-- Support use of group:sapling, includes ws_core:sapling which has the same burn time
minetest.register_craft({
	type = "fuel",
	recipe = "group:sapling",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:bush_sapling",
	burntime = 3,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:acacia_bush_sapling",
	burntime = 4,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:aspen_sapling",
	burntime = 4,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:pine_sapling",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:acacia_sapling",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:junglesapling",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:emergent_jungle_sapling",
	burntime = 7,
})


minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:fence_aspen_wood",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:fence_pine_wood",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:fence_wood",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:fence_acacia_wood",
	burntime = 8,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:fence_junglewood",
	burntime = 9,
})


minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:bush_stem",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:acacia_bush_stem",
	burntime = 8,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:junglegrass",
	burntime = 3,
})

minetest.register_craft({
	type = "fuel",
	recipe = "group:leaves",
	burntime = 4,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:cactus",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:papyrus",
	burntime = 3,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:bookshelf",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:ladder_wood",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:lava_source",
	burntime = 60,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:torch",
	burntime = 4,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:sign_wall_wood",
	burntime = 10,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:chest",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:chest_locked",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:coal_lump",
	burntime = 40,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:coalblock",
	burntime = 370,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:grass_1",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:dry_grass_1",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:fern_1",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:marram_grass_1",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:paper",
	burntime = 1,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:book",
	burntime = 3,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:book_written",
	burntime = 3,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:dry_shrub",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "group:stick",
	burntime = 1,
})


minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:pick_wood",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:shovel_wood",
	burntime = 4,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:axe_wood",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:sword_wood",
	burntime = 5,
})
