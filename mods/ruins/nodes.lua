--[[ Nodes for Ruins Mod ]]
-- Building Materials
minetest.register_node("ruins:rammed_earth", {
	description = "Rammed Earth",
	tiles = {
		"ws_rammed_earth.png",
		"ws_rammed_earth.png",
		"ws_rammed_earth_side.png",
	},
	groups = {crumbly = 3},
	sounds = ws_core.node_sound_dirt_defaults(),
})

minetest.register_node("ruins:thatch", {
	description = "Thatch",
	tiles = {"ws_thatch.png"},
	paramtype = "light",
	groups = {snappy = 3, flammable = 3},
	sounds = ws_core.node_sound_leaves_defaults(),
})

minetest.register_node("ruins:mat_woven", {
	description = "Woven Mat",
	tiles = {"ws_woven_mat.png"},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {snappy = 3, flammable = 3},
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
	},
	sounds = ws_core.node_sound_leaves_defaults(),
})

minetest.register_node("ruins:concrete", {
	description = "Concrete",
	tiles = {name = 'ws_concrete.png'},
	groups = {cracky = 3},
})

minetest.register_node("ruins:brick_burnt", {
	description = "Burnt Brick",
	tiles = {name = 'ws_brick_ruin.png'},
	groups = {cracky = 3},
})

minetest.register_node("ruins:stone_burnt", {
	description = "Burnt Stone",
	tiles = {"ws_burnt_stone.png"},
	groups = {cracky = 3},
})

-- Machinery / Industrial
minetest.register_node("ruins:vent", {
	description = "Vent",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.125, 0.5, 0.5, 0.125},
	},
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"ruins_steel.png", "ruins_steel.png", "ruins_steel.png", "ruins_steel.png", "ruins_steel.png^ruins_vent_slits.png"},
	groups = {choppy = 2, cracky = 3, oddly_breakable_by_hand = 1},
	is_ground_content = false,
	sounds = ws_core.node_sound_metal_defaults(),
})

-- Girders
local girder_nodebox = {
	{-0.375, -0.5, -0.5, 0.375, -0.375, 0.5},
	{-0.375, 0.375, -0.5, 0.375, 0.5, 0.5},
	{-0.125, 0.375, -0.5, 0.125, -0.375, 0.5},
}

minetest.register_node("ruins:girder", {
	description = "Steel Girder",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = girder_nodebox,
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 1, level = 2},
	tiles = {"ruins_steel_red.png"},
	is_ground_content = false,
	sounds = ws_core.node_sound_metal_defaults(),
	on_place = minetest.rotate_node,
})

minetest.register_node("ruins:girder_rusty", {
	description = "Rusty Steel Girder",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = girder_nodebox,
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 1, level = 2},
	tiles = {"ruins_steel_red_rusty.png"},
	is_ground_content = false,
	sounds = ws_core.node_sound_metal_defaults(),
	on_place = minetest.rotate_node,
})

-- Pipes
local pipe_nodebox = {
	type = "connected",
	fixed = {-0.25, -0.25, -0.25, 0.25, 0.25, 0.25},
	connect_top = {-0.25, -0.25, -0.25, 0.25, 0.5, 0.25},
	connect_bottom = {-0.25, -0.5, -0.25, 0.25, 0.25, 0.25},
	connect_front = {-0.25, -0.25, -0.5, 0.25, 0.25, 0.25},
	connect_back = {-0.25, -0.25, 0.25, 0.25, 0.25, 0.5},
	connect_left = {-0.5, -0.25, -0.25, 0.25, 0.25, 0.25},
	connect_right = {-0.25, -0.25, -0.25, 0.5, 0.25, 0.25},
}

minetest.register_node("ruins:copper_pipe", {
	description = "Copper Pipe",
	tiles = {"ruins_copper.png", "ruins_copper.2.png"},
	groups = {snappy = 3, cracky = 1, choppy = 1, pipe = 1},
	paramtype = "light",
	drawtype = "nodebox",
	node_box = pipe_nodebox,
	connects_to = {"group:pipe"},
	sounds = ws_core.node_sound_metal_defaults(),
})

minetest.register_node("ruins:copper_pipe_rusty", {
	description = "Rusty Copper Pipe",
	tiles = {"ruins_copper_rusty.png", "ruins_copper_rusty.2.png"},
	groups = {snappy = 3, cracky = 1, choppy = 1, pipe = 1},
	paramtype = "light",
	drawtype = "nodebox",
	node_box = pipe_nodebox,
	connects_to = {"group:pipe"},
	sounds = ws_core.node_sound_metal_defaults(),
})

-- Wallpapers
minetest.register_node("ruins:wallpaper_1", {
	description = "Striped Wallpaper",
	paramtype2 = "facedir",
	tiles = {"ws_planks_old.png", "ws_planks_old.png", "ws_planks_old.png", "ws_planks_old.png", "ws_planks_old.png", "ruins_wallpaper_1.png"},
	is_ground_content = false,
	groups = {choppy = 3, planks = 1, wood = 1, flammable = 2},
})

minetest.register_node("ruins:wallpaper_2", {
	description = "Diamond Wallpaper",
	paramtype2 = "facedir",
	tiles = {"ws_planks_old.png", "ws_planks_old.png", "ws_planks_old.png", "ws_planks_old.png", "ws_planks_old.png", "ruins_wallpaper_2.png"},
	is_ground_content = false,
	groups = {choppy = 3, planks = 1, wood = 1, flammable = 2},
})

minetest.register_node("ruins:wallpaper_3", {
	description = "Flower Wallpaper",
	paramtype2 = "facedir",
	tiles = {"ws_planks_old.png", "ws_planks_old.png", "ws_planks_old.png", "ws_planks_old.png", "ws_planks_old.png", "ruins_wallpaper_3.png"},
	is_ground_content = false,
	groups = {choppy = 3, planks = 1, wood = 1, flammable = 2},
})

-- Ripped Wallpapers
minetest.register_node("ruins:wallpaper_1_rip", {
	description = "Ripped Striped Wallpaper",
	paramtype2 = "facedir",
	tiles = {"ws_planks_old.png", "ws_planks_old.png", "ws_planks_old.png", "ws_planks_old.png", "ws_planks_old.png", "ws_planks_old.png^ruins_wallpaper_1_rip.png"},
	is_ground_content = false,
	groups = {choppy = 3, planks = 1, wood = 1, flammable = 2},
})

minetest.register_node("ruins:wallpaper_2_rip", {
	description = "Ripped Diamond Wallpaper",
	paramtype2 = "facedir",
	tiles = {"ws_planks_old.png", "ws_planks_old.png", "ws_planks_old.png", "ws_planks_old.png", "ws_planks_old.png", "ws_planks_old.png^ruins_wallpaper_2_rip.png"},
	is_ground_content = false,
	groups = {choppy = 3, planks = 1, wood = 1, flammable = 2},
})

minetest.register_node("ruins:wallpaper_3_rip", {
	description = "Ripped Flower Wallpaper",
	paramtype2 = "facedir",
	tiles = {"ws_planks_old.png", "ws_planks_old.png", "ws_planks_old.png", "ws_planks_old.png", "ws_planks_old.png", "ws_planks_old.png^ruins_wallpaper_3_rip.png"},
	is_ground_content = false,
	groups = {choppy = 3, planks = 1, wood = 1, flammable = 2},
})

-- Skeleton Decorations
minetest.register_node('ruins:old_skeleton', {
	description = 'Old Skeleton',
	drawtype = 'mesh',
	mesh = 'decoblocks_old_skeleton.obj',
	tiles = {name='decoblocks_old_skeleton.png'},
	groups = {cracky=2, oddly_breakable_by_hand=5},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0.75, 0.5}
	},
	collision_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0.75, 0.5}
	}
})
