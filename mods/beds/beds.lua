-- beds/beds.lua

-- support for MT game translation.
local S = beds.get_translator

-- Fancy shaped bed

beds.register_bed("beds:fancy_bed", {
	description = S("Fancy Bed"),
	inventory_image = "ws_bed_inv.png",
	wield_image = "ws_bed_inv.png",
	tiles = {
		bottom = {
			"colored_beds_fancybed_bottom_top.png",
			"ws_planks_dead.png",
			"colored_beds_fancybed_bottom_side.png",
			"colored_beds_fancybed_bottom_side.png^[transformFX",
			"ws_planks_dead.png",
			"colored_beds_fancybed_bottom_foot.png"
		},
		top = {
			"colored_beds_fancybed_top_top.png",
			"ws_planks_dead.png",
			"colored_beds_fancybed_top_side.png",
			"colored_beds_fancybed_top_side.png^[transformFX",
			"colored_beds_fancybed_top_head.png",
			"ws_planks_dead.png"
		}
	},
	nodebox = {
		bottom = {
			{0.375, -0.5, -0.5, 0.5, -0.375, -0.375},
		 {-0.5, -0.5, -0.5, -0.375, -0.375, -0.375},
		 {-0.5, -0.375, -0.5, 0.5, 0, 0.5}, -- NodeBox3
		},
		top = {
			 {-0.5, -0.5, 0.375, -0.375, -0.375, 0.5},
		 {0.375, -0.5, 0.375, 0.5, -0.375, 0.5},
		 {-0.5, -0.375, -0.5, 0.5, 0, 0.5},
		}
	},
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.0, 1.5},
	recipe = {
		{"wool:white", "wool:white", "wool:white"},
		{"group:wood", "group:wood", "group:wood"}
	},
})

beds.register_bed("beds:straw_bed", {
	description = S("Straw Bed"),
	inventory_image = "ws_bed_straw_inv.png",
	wield_image = "ws_bed_straw_inv.png",
	tiles = {
		bottom = {
			"ws_bed_straw_top_bottom.png",
			"ws_planks_dead.png",
			"ws_bed_straw_side_bottom.png",
			"ws_bed_straw_side_bottom.png^[transformFX",
			"ws_planks_dead.png",
			"ws_bed_straw_foot.png"
		},
		top = {
			"ws_bed_straw_top.png",
			"ws_planks_dead.png",
			"ws_bed_straw_side_top.png",
			"ws_bed_straw_side_top.png^[transformFX",
			"colored_beds_fancybed_top_head.png",
			"ws_planks_dead.png"
		}
	},
	nodebox = {
		bottom = {
			{0.375, -0.5, -0.5, 0.5, -0.375, -0.375},
		 {-0.5, -0.5, -0.5, -0.375, -0.375, -0.375},
		 {-0.5, -0.375, -0.5, 0.5, 0, 0.5}, -- NodeBox3
		},
		top = {
			 {-0.5, -0.5, 0.375, -0.375, -0.375, 0.5},
		 {0.375, -0.5, 0.375, 0.5, -0.375, 0.5},
		 {-0.5, -0.375, -0.5, 0.5, 0, 0.5},
		}
	},
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.0, 1.5},
	recipe = {
		{"", "", ""},
		{"ws_core:straw", "ws_core:straw", "ws_core:straw"}
	},
})

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "beds:fancy_bed_bottom",
	burntime = 13,
})
