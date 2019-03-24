minetest.register_node('ruins:old_skeleton', {
	description = 'Old Skeleton',
	drawtype = 'mesh',
	mesh = 'decoblocks_old_skeleton.obj',
	tiles = {name='decoblocks_old_skeleton.png'},
	visual_scale = 0.5,
	groups = {cracky=2, oddly_breakable_by_hand=5},
	paramtype = 'light',
	paramtype2 = 'facedir',
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.0, 0.3}
	},
	collision_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.0, 0.3}
	},
})

minetest.register_node('ruins:old_skeleton2', {
	description = 'Old Skeleton',
	drawtype = 'mesh',
	mesh = 'decoblocks_old_skeleton2.obj',
	tiles = {name='decoblocks_old_skeleton.png'},
	visual_scale = 0.5,
	groups = {cracky=2, oddly_breakable_by_hand=5},
	paramtype = 'light',
	paramtype2 = "facedir",
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.0, 0.3}
	},
	collision_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.0, 0.3}
	},
})

minetest.register_node('ruins:concrete', {
	description = 'Concrete',
	tiles = {name='ws_concrete.png'},
	groups = {cracky=3},
	paramtype = 'light',
	paramtype2 = 'facedir',
})

minetest.register_node("ruins:human_skull", {
	description = "Human Skull",
	drawtype = "mesh",
	mesh = "human_skull.obj",
	tiles = {
		"human_skull.png",
	},
	visual_scale = 0.5,
	wield_image = "skeleton_head_item.png",
	wield_scale = {x=1.0, y=1.0, z=1.0},
	paramtype = "light",
	paramtype2 = "facedir",
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.0, 0.3}
	},
	collision_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.0, 0.3}
	},
	inventory_image = "skeleton_head_item.png",
	groups = {choppy = 1, oddly_breakable_by_hand = 1},
})