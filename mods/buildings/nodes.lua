minetest.register_node("buildings:mat_woven", {
	description = "Woven Mat",
	tiles = {
		"ws_woven_mat.png",
		"ws_woven_mat.png",
		"ws_woven_mat.png",
		"ws_woven_mat.png",
		"ws_woven_mat.png",
		"ws_woven_mat.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {crumbly = 3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5}, -- NodeBox7
		}
	}
})

minetest.register_node("buildings:thatch", {
	description = "Thatch",
	tiles = {
		"ws_thatch.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {crumbly = 3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}, -- NodeBox7
		}
	}
})

minetest.register_node("buildings:rammed_earth", {
	description = "Rammed Earth",
	tiles = {
		"ws_rammed_earth.png",
		"ws_rammed_earth.png",
		"ws_rammed_earth_side.png",
		"ws_rammed_earth_side.png",
		"ws_rammed_earth_side.png",
		"ws_rammed_earth_side.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {crumbly = 3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}, -- NodeBox7
		}
	}
})