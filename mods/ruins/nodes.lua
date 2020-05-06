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

minetest.register_node("ruins:block", {
	description = "Block",
	tiles = {"ws_burnt_stone.png",
		{name = "ws_burnt_stone.png",
			tileable_vertical = false}},
	groups = {crumbly = 3},
})

local fdir_to_front = {
	{x=0, z=1},
	{x=1, z=0},
	{x=0, z=-1},
	{x=-1, z=0}
}
local function checkwall(pos)
	local fdir = minetest.get_node(pos).param2
	local second_node_x = pos.x + fdir_to_front[fdir + 1].x
	local second_node_z = pos.z + fdir_to_front[fdir + 1].z
	local second_node_pos = {x=second_node_x, y=pos.y, z=second_node_z}
	local second_node = minetest.get_node(second_node_pos)
	if not second_node or not minetest.registered_nodes[second_node.name]
	  or not minetest.registered_nodes[second_node.name].buildable_to then
		return true
	end

	return false
end

local dumpster_selectbox = {-0.5, -0.5625, -0.5, 0.5, 0.5, 1.5}

local dumpster_nodebox = {
	-- Main Body
	{-0.4375, -0.375, -0.4375, 0.4375, 0.5, 1.4375},
	-- Feet
	{-0.4375, -0.5, -0.4375, -0.25, -0.375, -0.25},
	{0.25, -0.5, -0.4375, 0.4375, -0.375, -0.25},
	{0.25, -0.5, 1.25, 0.4375, -0.375, 1.4375},
	{-0.4375, -0.5, 1.25, -0.25, -0.375, 1.4375},
	-- Border
	{-0.5, 0.25, -0.5, 0.5, 0.375, 1.5},
}

-- Dumpster
minetest.register_node("ruins:dumpster", {
	description = "Dumpster",
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image = "dumpster_wield.png",
	tiles = {
		"dumpster_top.png",
		"dumpster_bottom.png",
		"dumpster_side.png",
		"dumpster_side.png",
		"dumpster_side.png",
		"dumpster_side.png"
	},
	drawtype = "nodebox",
	selection_box = {
		type = "fixed",
		fixed = dumpster_selectbox,
	},
	node_box = {
		type = "fixed",
		fixed = dumpster_nodebox,
	},
	groups = {
		cracky = 3,
		oddly_breakable_by_hand = 1,
	},

	sounds = default and default.node_sound_metal_defaults(),

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
			"size[8,9]" ..
			"list[context;main;1,1;6,3;]" ..
			"list[current_player;main;0,5;8,4;]"..
			"listring[context;main]"..
			"listring[current_player;main]"
		)
		meta:set_string("infotext", "Dumpster")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	after_place_node = function(pos, placer, itemstack)
		if checkwall(pos) then
			minetest.set_node(pos, {name = "air"})
			return true
		end
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name() ..
			" moves stuff in dumpster at " .. minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" moves stuff to dumpster at " .. minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" takes stuff from dumpster at " .. minetest.pos_to_string(pos))
	end,
})

--[[ Dumpster craft
minetest.register_craft({
	output = 'ruins:dumpster',
	recipe = {
		{'default:coalblock', 'default:coalblock', 'default:coalblock'},
		{'default:steel_ingot', 'dye:dark_green', 'default:steel_ingot'},
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
	}
})]]
