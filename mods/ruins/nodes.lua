--------------------Made by TobyPlowy-----------------------
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

minetest.register_node("ruins:carrot", {
	description = "Carrot",
	drawtype = "mesh",
	mesh = "carrot.obj",
	tiles = {
		"crops.png",
	},
	visual_scale = 0.5,
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image= "ws_carrot.png",
	wield_image= "ws_carrot.png",
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.0, 0.3}
	},
	collision_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.0, 0.3}
	},
	groups = {choppy = 1, oddly_breakable_by_hand = 1, flora = 1, attached_node = 1},
})

minetest.register_node("ruins:melons", {
	description = "Melons",
	drawtype = "mesh",
	mesh = "melons.obj",
	tiles = {
		"crops.png",
	},
	visual_scale = 0.5,
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image= "ws_melons.png",
	wield_image= "ws_melons.png",
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.0, 0.3}
	},
	collision_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.0, 0.3}
	},
	groups = {choppy = 1, oddly_breakable_by_hand = 1, flora = 1, attached_node = 1},
})

minetest.register_node("ruins:tomato_plant", {
	description = "Tomato Plant",
	drawtype = "mesh",
	mesh = "tomato.obj",
	tiles = {
		"crops.png",
	},
	visual_scale = 0.5,
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image= "ws_tomato.png",
	wield_image= "ws_tomato.png",
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.0, 0.3}
	},
	collision_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.0, 0.3}
	},
	groups = {choppy = 1, oddly_breakable_by_hand = 1},
})
------------------------

minetest.register_node('ruins:concrete', {
	description = 'Concrete',
	tiles = {name='ws_concrete.png'},
	groups = {cracky=3},
	paramtype = 'light',
	paramtype2 = 'facedir',
})

minetest.register_node('ruins:brick_burnt', {
	description = 'Burnt Brick',
	tiles = {name='ws_brick_ruin.png'},
	groups = {cracky=3},
	paramtype = 'light',
	paramtype2 = 'facedir',
})

minetest.register_node("ws_core:block", {
	description = "Block",
	tiles = {"ws_burnt_stone.png",
		{name = "ws_burnt_stone.png",
			tileable_vertical = false}},
	groups = {crumbly = 3},
})