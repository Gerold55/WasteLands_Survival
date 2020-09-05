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
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	recipe = {
		{"wool:white", "wool:white", "wool:white"},
		{"group:wood", "group:wood", "group:wood"}
	},
})

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "beds:fancy_bed_bottom",
	burntime = 13,
})
