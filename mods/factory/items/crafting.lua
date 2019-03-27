local S = factory.S

minetest.register_craft({
	output = "factory:small_steel_gear 4",
	recipe = {
		{"ws_core:steel_ingot", "", "ws_core:steel_ingot"},
		{"", "ws_core:steel_ingot", ""},
		{"ws_core:steel_ingot", "", "ws_core:steel_ingot"}
	}
})

minetest.register_craft({
	output = "factory:small_gold_gear 4",
	recipe = {
		{"ws_core:gold_ingot", "", "ws_core:gold_ingot"},
		{"", "factory:small_steel_gear", ""},
		{"ws_core:gold_ingot", "", "ws_core:gold_ingot"}
	}
})

minetest.register_craft({
	output = "factory:small_diamond_gear 4",
	recipe = {
		{"ws_core:diamond", "", "ws_core:diamond"},
		{"", "factory:small_gold_gear", ""},
		{"ws_core:diamond", "", "ws_core:diamond"}
	}
})

minetest.register_craft({
	output = "factory:scanner_chip",
	recipe = {
		{"ws_core:steel_ingot", "factory:copper_wire", "ws_core:mese_crystal"},
		{"", "factory:tree_sap", ""},
		{"ws_core:mese_crystal", "", "ws_core:steel_ingot"}
	}
})

minetest.register_craft({
	output = "factory:storage_tank",
	recipe = {
		{"ws_core:glass", 	"ws_core:steel_ingot", 		"ws_core:glass"},
		{"ws_core:glass", 	"", 						"ws_core:glass"},
		{"ws_core:glass", 	"ws_core:steel_ingot", 		"ws_core:glass"}
	}
})

minetest.register_craft({
	output = "factory:sapling_fertilizer",
	recipe = {
		{"ws_core:dirt", 	"ws_core:dirt"},
		{"ws_core:dirt",	"ws_core:dirt"},
	}
})


minetest.register_craft({
	type = "shapeless",
	output = "factory:fan_blade",
	recipe = {
		"default:steel_ingot",
		"factory:tree_sap",
		"default:stick"
	}
})

factory.register_recipe_type("ind_squeezer", {
	description = S("squeezing"),
	icon = "factory_compressor_front.png",
	width = 1,
	height = 1,
})

--TODO: register group:tree instead

factory.register_recipe("ind_squeezer",{
	output = "factory:tree_sap",
	input = {"ws_core:tree"}
})

factory.register_recipe("ind_squeezer",{
	output = "factory:tree_sap",
	input = {"ws_core:jungletree"}
})

factory.register_recipe("ind_squeezer",{
	output = "factory:compressed_clay",
	input = {"ws_core:clay_lump"}
})


factory.register_recipe("ind_squeezer",{
	output = "ws_core:sandstone",
	input = {"ws_core:sand"}
})

minetest.register_craft({
	type = "cooking",
	output = "factory:factory_lump",
	recipe = "factory:compressed_clay"
})

factory.register_recipe_type("wire_drawer", {
	description = S("drawing wire"),
	icon = "factory_wire_drawer_front.png",
	width = 1,
	height = 1,
})

factory.register_recipe("wire_drawer",{
	output = "factory:steel_wire 2",
	input = {"ws_core:steel_ingot"}
})

factory.register_recipe("wire_drawer",{
	output = "factory:copper_wire 2",
	input = {"ws_core:copper_ingot"}
})

factory.register_recipe("wire_drawer",{
	output = "factory:fiber 2",
	input = {"factory:tree_sap"}
})

minetest.register_craft({
	type = "fuel",
	recipe = "factory:tree_sap",
	burntime = 20,
})
