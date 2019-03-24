minetest.register_node('mobs_wls:worm_sand', {
	description = 'Sand Worm',
	drawtype = 'mesh',
	mesh = 'worm.obj',
	tiles = {name='worm_sand.png'},
	visual_scale = 0.5,
	inventory_image = 'creature_pod.png',
	wield_image = 'creature_pod.png',
	wield_scale = {x=1.0, y=1.0, z=1.0},
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

minetest.register_node('mobs_wls:worm_baby_sand', {
	description = 'Baby Sand Worm',
	drawtype = 'mesh',
	mesh = 'worm_baby.obj',
	tiles = {name='worm_sand_baby.png'},
	visual_scale = 0.5,
	inventory_image = 'creature_pod.png',
	wield_scale = {x=1.0, y=1.0, z=1.0},
	wield_image = 'creature_pod.png',
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

minetest.register_node('mobs_wls:spider', {
	description = 'Spider',
	drawtype = 'mesh',
	mesh = 'spider.obj',
	tiles = {name='spider.png'},
	visual_scale = 0.5,
	inventory_image = 'creature_pod.png',
	wield_image = 'creature_pod.png',
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

minetest.register_node('mobs_wls:spider_baby', {
	description = 'Baby Spider',
	drawtype = 'mesh',
	mesh = 'spider_baby.obj',
	tiles = {name='spider_baby.png'},
	visual_scale = 0.5,
	inventory_image = 'creature_pod.png',
	wield_image = 'creature_pod.png',
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

minetest.register_node('mobs_wls:ogre', {
	description = 'Ogre',
	drawtype = 'mesh',
	mesh = 'ogre.obj',
	tiles = {name='ogre.png'},
	visual_scale = 0.5,
	inventory_image = 'creature_pod.png',
	wield_image = 'creature_pod.png',
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

minetest.register_node('mobs_wls:ogre_baby', {
	description = 'Baby Ogre',
	drawtype = 'mesh',
	mesh = 'ogre_baby.obj',
	tiles = {name='ogre_baby.png'},
	visual_scale = 0.5,
	inventory_image = 'creature_pod.png',
	wield_image = 'creature_pod.png',
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