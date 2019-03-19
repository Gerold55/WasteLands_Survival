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

