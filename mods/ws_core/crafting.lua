-- mods/ws_core/crafting.lua

-- ===========
-- WOOD WOKING
-- ===========

minetest.register_craft({
	output = 'ws_core:planks_oak_dry',
	recipe = {{'ws_core:log_oak_dry'},}
})

minetest.register_craft({
	output = 'ws_core:planks_oak_dry',
	recipe = {{'ws_core:log_oak_stripped_dry'},}
})

minetest.register_craft({
	output = 'ws_core:planks_oak',
	recipe = {{'ws_core:log_oak'},}
})

minetest.register_craft({
	output = 'ws_core:planks_oak',
	recipe = {{'ws_core:log_oak_stripped'},}
})

minetest.register_craft({
	output = 'ws_core:planks_balsa',
	recipe = {{'ws_core:log_balsa'},}
})

minetest.register_craft({
	output = 'ws_core:planks_balsa',
	recipe = {{'ws_core:log_balsa_stripped'},}
})

minetest.register_craft({
	output = 'ws_core:stick 4',
	recipe = {{'group:planks'},}
})

minetest.register_craft({
	type = "shapeless",
	output = "ws_core:planks_oak_dry",
	recipe = {
		"ws_core:stick", "ws_core:stick",
		"ws_core:stick", "ws_core:stick"
	},
})

-- =========
-- RESOURCES
-- =========

minetest.register_craft({
	output = 'ws_core:clay',
	recipe = {
		{'ws_core:clay_lump', 'ws_core:clay_lump'},
		{'ws_core:clay_lump', 'ws_core:clay_lump'},
	}
})

minetest.register_craft({
	output = 'ws_core:clay_lump 4',
	recipe = {{'ws_core:clay'},}
})

minetest.register_craft({
	output = 'ws_core:bone',
	recipe = {
		{'ws_core:bone_shard', 'ws_core:bone_shard', 'ws_core:bone_shard'},
		{'ws_core:bone_shard', 'ws_core:bone_shard', 'ws_core:bone_shard'},
		{'ws_core:bone_shard', 'ws_core:bone_shard', 'ws_core:bone_shard'},
	}
})

minetest.register_craft({
	output = 'ws_core:bone_shard 9',
	recipe = {{'ws_core:bone'},}
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
	output = 'ws_core:flint 4',
	recipe = {
		{'ws_core:gravel', 'ws_core:gravel'},
		{'ws_core:gravel', 'ws_core:gravel'},
	}
})

minetest.register_craft({
	output = 'ws_core:gold_ingot',
	recipe = {
		{'ws_core:gold_nugget', 'ws_core:gold_nugget', 'ws_core:gold_nugget'},
		{'ws_core:gold_nugget', 'ws_core:gold_nugget', 'ws_core:gold_nugget'},
		{'ws_core:gold_nugget', 'ws_core:gold_nugget', 'ws_core:gold_nugget'},
	}
})

-- ====
-- MISC
-- ====

minetest.register_craft({
	output = 'ws_core:barrel',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', '', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})

minetest.register_craft({
	output = 'ws_core:furnace_bottom',
	recipe = {
		{'group:stone', 'group:stone', 'group:stone'},
		{'group:stone', '', 'group:stone'},
		{'group:stone', 'group:stone', 'group:stone'},
	}
})

minetest.register_craft({
	output = 'ws_core:furnace_top',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', 'ws_core:coal', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})

-- =====
-- TOOLS
-- =====

-- Knifes
minetest.register_craft({
	output = 'ws_core:knife_bone',
	recipe = {
		{'', 'ws_core:bone_shard'},
		{'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'ws_core:knife_scrap',
	recipe = {
		{'', 'ws_core:scrap'},
		{'group:stick', ''},
	}
})

-- Hatchets
minetest.register_craft({
	output = 'ws_core:hatchet_bone',
	recipe = {
	{'ws_core:bone_shard','ws_core:bone_shard', ''},
	{'ws_core:bone_shard', 'ws_core:stick', ''},
	{'', 'ws_core:stick', ''},
	}
})

minetest.register_craft({
	output = 'ws_core:hatchet_bone',
	recipe = {
	{'','ws_core:scrap', 'ws_core:scrap'},
	{'', 'ws_core:stick', 'ws_core:scrap'},
	{'', 'ws_core:stick', ''},
	}
})

minetest.register_craft({
	output = 'ws_core:hatchet_scrap',
	recipe = {
	{'ws_core:scrap','ws_core:scrap', ''},
	{'ws_core:scrap', 'ws_core:stick', ''},
	{'', 'ws_core:stick', ''},
	}
})

minetest.register_craft({
	output = 'ws_core:hatchet_scrap',
	recipe = {
	{'','ws_core:scrap', 'ws_core:scrap'},
	{'', 'ws_core:stick', 'ws_core:scrap'},
	{'', 'ws_core:stick', ''},
	}
})

-- Shovels
minetest.register_craft({
	output = 'ws_core:shovel_scrap',
	recipe = {
	{'','ws_core:scrap', ''},
	{'', 'ws_core:stick', ''},
	{'', 'ws_core:stick', ''},
	}
})

-- Picks
minetest.register_craft({
	output = 'ws_core:pick_scrap',
	recipe = {
	{'ws_core:scrap','ws_core:scrap', 'ws_core:scrap'},
	{'', 'ws_core:stick', ''},
	{'', 'ws_core:stick', ''},
	}
})

-- ===========
-- TOOL REPAIR
-- ===========

minetest.register_craft({
	type = "toolrepair",
	additional_wear = -0.02,
})

-- =======
-- COOKING
-- =======

minetest.register_craft({
	type = "cooking",
	output = "ws_core:stone",
	recipe = "ws_core:cobble",
})

minetest.register_craft({
	type = "cooking",
	output = "ws_core:gold_nugget",
	recipe = "ws_core:stone_with_gold",
})

-- ====
-- FUEL
-- ====

minetest.register_craft({
	type = "fuel",
	recipe = "group:tree",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "group:wood",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:dry_papyrus",
	burntime = 3,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:barrel",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:coal",
	burntime = 40,
})

minetest.register_craft({
	type = "fuel",
	recipe = "group:stick",
	burntime = 1,
})
