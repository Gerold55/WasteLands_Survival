minetest.register_craft({
	output = "factory:belt 12",
	recipe = {
		{"", "", ""},
		{"ws_core:stone", "factory:small_steel_gear", "ws_core:stone"},
		{"ws_core:steel_ingot", "ws_core:steel_ingot", "ws_core:steel_ingot"}
	}
})

minetest.register_craft({
	output = "factory:belt_center 12",
	recipe = {
		{"", "ws_core:gold_ingot", ""},
		{"ws_core:stone", "factory:small_steel_gear", "ws_core:stone"},
		{"ws_core:steel_ingot", "ws_core:steel_ingot", "ws_core:steel_ingot"}
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "factory:belt_center",
	recipe = {"factory:belt", "ws_core:gold_ingot"}
})

minetest.register_craft({
	output = "factory:arm",
	recipe = {
		{"ws_core:steel_ingot", "ws_core:steel_ingot", "farming:hoe_steel"},
		{"ws_core:steel_ingot", "factory:small_steel_gear", "factory:small_steel_gear"},
		{"ws_core:steel_ingot", "ws_core:steelblock", "ws_core:steel_ingot"}
	}
})

minetest.register_craft({
	output = "factory:ind_furnace",
	recipe = {
		{"factory:small_steel_gear", "ws_core:steel_ingot", "factory:small_steel_gear"},
		{"ws_core:steel_ingot", "ws_core:furnace", "ws_core:steel_ingot"},
		{"ws_core:stonebrick", "ws_core:obsidian", "ws_core:stonebrick"}
	}
})

minetest.register_craft( {
	output = "factory:autocrafter",
	recipe = {
	        { "factory:factory_brick", "factory:factory_brick", "factory:factory_brick" },
	        { "factory:small_diamond_gear", "ws_core:steel_ingot", "factory:small_diamond_gear" },
	        { "factory:factory_brick", "factory:factory_brick", "factory:factory_brick" }
	},
})

minetest.register_craft({
	output = "factory:taker",
	recipe = {
		{"ws_core:shovel_steel", "ws_core:steel_ingot", "ws_core:steel_ingot"},
		{"factory:small_steel_gear", "factory:small_steel_gear", "ws_core:steel_ingot"},
		{"ws_core:steel_ingot", "ws_core:steelblock", "ws_core:steel_ingot"}
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "factory:taker_gold",
	recipe = {"factory:taker", "ws_core:goldblock", "factory:small_gold_gear"}
})

minetest.register_craft({
	type = "shapeless",
	output = "factory:taker_diamond",
	recipe = {"factory:taker_gold", "ws_core:diamondblock", "factory:small_diamond_gear"}
})

minetest.register_craft({
	type = "shapeless",
	output = "factory:queuedarm",
	recipe = {"factory:arm", "ws_core:barrel", "factory:small_gold_gear"}
})

minetest.register_craft({
	type = "shapeless",
	output = "factory:overflowarm",
	recipe = {"factory:arm", "farming:hoe_steel", "factory:small_gold_gear"}
})

minetest.register_craft({
	output = "factory:ind_squeezer",
	recipe = {
		{"ws_core:glass", "ws_core:stick", "ws_core:glass"},
		{"ws_core:glass", "ws_core:steelblock", "ws_core:glass"},
		{"factory:small_gold_gear", "factory:ind_furnace", "factory:small_gold_gear"}
	}
})

minetest.register_craft({
	output = "factory:wire_drawer",
	recipe = {
		{"ws_core:glass", "ws_core:stick", "ws_core:glass"},
		{"ws_core:glass", "ws_core:stick", "ws_core:glass"},
		{"factory:small_gold_gear", "ws_core:furnace", "factory:small_gold_gear"}
	}
})

minetest.register_craft({
	output = "factory:swapper",
	recipe = {
		{"ws_core:steel_ingot", "ws_core:steel_ingot", "ws_core:steel_ingot"},
		{"factory:arm", "factory:scanner_chip", "factory:arm"},
		{"ws_core:mese_crystal", "", "ws_core:mese_crystal"}
	}
})

minetest.register_craft({
	output = "factory:fan_on",
	recipe = {
		{"ws_core:steel_ingot", "factory:fan_blade", "ws_core:steel_ingot"},
		{"factory:fan_blade", "factory:small_gold_gear", "factory:fan_blade"},
		{"ws_core:steel_ingot", "factory:fan_blade", "ws_core:steel_ingot"}
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "factory:fan_wall_on",
	recipe = {"factory:fan_on"}
})

minetest.register_craft({
	output = "factory:miner_on",
	recipe = {
		{"ws_core:steel_ingot", 	"factory:fan_on", 			"ws_core:steel_ingot"},
		{"factory:small_gold_gear", "factory:taker_on", 		"factory:small_gold_gear"},
		{"ws_core:steel_ingot", 	"ws_core:pick_mese", 		"ws_core:steel_ingot"}
	}
})

minetest.register_craft({
	output = "factory:miner_upgraded_on",
	recipe = {
		{"", 						"factory:small_diamond_gear",	""},
		{"factory:small_gold_gear", "factory:miner_on", 		"factory:small_gold_gear"},
		{"ws_core:gold_ingot", 		"ws_core:pick_diamond", 	"ws_core:gold_ingot"}
	}
})

minetest.register_craft({
	output = "factory:vacuum_on",
	recipe = {
		{"ws_core:steel_ingot", 	"factory:taker_on", 			"ws_core:steel_ingot"},
		{"factory:small_steel_gear",	"factory:small_gold_gear", 		"factory:small_steel_gear"},
		{"", 				"ws_core:steel_ingot", 			""}
	}
})

minetest.register_craft({
	output = "factory:upward_vacuum_off",
	recipe = {
		{"ws_core:steel_ingot", 	"ws_core:steel_ingot",		"ws_core:steel_ingot"},
		{"ws_core:steel_ingot",		"factory:small_gold_gear", 	"factory:taker_on"},
		{"factory:scanner_chip", 	"factory:vacuum_on", 		"factory:scanner_chip"}
	}
})