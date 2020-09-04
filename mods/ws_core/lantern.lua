minetest.register_node('ws_core:lantern', {
	description = 'Lantern',
	drawtype = 'nodebox',
	tiles = {
		{name="ws_lantern_top.png"},
		{name="ws_lantern_top.png"},
		{name="ws_lantern.png", animation={type='vertical_frames', aspect_w=16, aspect_h=16, length=3.0}},
		{name="ws_lantern.png", animation={type='vertical_frames', aspect_w=16, aspect_h=16, length=3.0}},
		{name="ws_lantern.png", animation={type='vertical_frames', aspect_w=16, aspect_h=16, length=3.0}},
		{name="ws_lantern.png", animation={type='vertical_frames', aspect_w=16, aspect_h=16, length=3.0}}
	},
	inventory_image = "ws_lantern_inv.png",
	groups = {cracky=2, oddly_breakable_by_hand=5},
	paramtype = 'light',
	light_source = 14,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.1875, 0.1875, -0.0625, 0.1875}, -- NodeBox1
			{-0.125, -0.0625, -0.125, 0.125, 0.0625, 0.125}, -- NodeBox3
		}
	}
})