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
		inv:set_size('main', 8*4)
		inv:set_size('storage', 9*3)
		meta:set_string('formspec',
			'size [9,9]'..
			'bgcolor[#080808BB;false]'..
			'list[current_name;storage;0,0.2;9,3;]'..
			'list[current_player;main;0.5,5;8,4;]')
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty('storage')
	end,
	on_place = minetest.rotate_node
})
