minetest.register_node("ws_core:barrel", {
	description = "Barrel",
	paramtype2 = "facedir",
	tiles = {
		"ws_barrel_top_1.png", --top
		"ws_barrel_top.png", --bottom
		"ws_barrel.png", --sides
	},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size('main', 8*3)
		meta:set_string('formspec',
			'size [8,8]'..
			'bgcolor[#080808BB;false]'..
			'list[context;main;0,0.2;8,3;]'..
			'list[current_player;main;0,4;8,4;]'..
			'listring[]')
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty('storage')
	end,
	on_place = minetest.rotate_node
})

minetest.register_node("ws_core:clay_pot", {
	description = "Clay Pot",
	drawtype = "nodebox",
	paramtype = "light",
	tiles = {
		"ws_clay_pot_top_closed.png",
		"ws_clay_pot_bottom.png",
		"ws_clay_pot.png",
	},
	is_ground_content = false,
	groups = {oddly_breakable_by_hand = 2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, -0.4375, 0.375}, -- NodeBox1
			{-0.4375, -0.4375, -0.4375, 0.4375, 0.3125, 0.4375}, -- NodeBox2
			{-0.375, 0.3125, -0.375, 0.375, 0.375, 0.375}, -- NodeBox3
			{-0.4375, 0.375, -0.4375, 0.4375, 0.5, 0.4375}, -- NodeBox4
		}
	},
	on_punch = function(pos, node, clicker, itemstack)
		local meta = minetest.get_meta(pos)
		meta:set_string('formspec',
				'size [8,8]'..
				'bgcolor[#080808BB;false]'..
				'list[context;main;0,0.2;8,3;]'..
				'list[current_player;main;0,4;8,4;]'..
				'listring[]')
		node.name = "ws_core:clay_pot_opened"
		minetest.swap_node(pos, node)
	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size('main', 8*4)
	end,
})

minetest.register_node("ws_core:clay_pot_opened", {
	description = "Clay Pot Open",
	drawtype = "nodebox",
	paramtype = "light",
	tiles = {
		"ws_clay_pot_top.png",
		"ws_clay_pot_bottom.png",
		"ws_clay_pot.png",
	},
	is_ground_content = false,
	groups = {oddly_breakable_by_hand = 2, not_in_creative_inventory = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, -0.4375, 0.375}, -- NodeBox1
			{-0.4375, -0.4375, -0.4375, 0.4375, 0.3125, 0.4375}, -- NodeBox2
			{-0.375, 0.3125, -0.375, 0.375, 0.375, 0.375}, -- NodeBox3
			{-0.4375, 0.375, -0.4375, 0.4375, 0.5, 0.4375}, -- NodeBox4
		}
	},
	on_punch = function(pos, node, clicker, itemstack)
		local meta = minetest.get_meta(pos)
		meta:set_string('formspec', "")
		node.name = "ws_core:clay_pot"
		minetest.swap_node(pos, node)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty('main')
	end,
})
