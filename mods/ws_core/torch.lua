-- default/torch.lua

-- support for MT game translation.

local function on_flood(pos, oldnode, newnode)
	minetest.add_item(pos, ItemStack("ws_core:torch 1"))
	-- Play flame-extinguish sound if liquid is not an 'igniter'
	local nodedef = minetest.registered_items[newnode.name]
	if not (nodedef and nodedef.groups and
			nodedef.groups.igniter and nodedef.groups.igniter > 0) then
		minetest.sound_play(
			"default_cool_lava",
			{pos = pos, max_hear_distance = 16, gain = 0.1},
			true
		)
	end
	-- Remove the torch node
	return false
end

minetest.register_node("ws_core:torch", {
	description = "Torch",
	drawtype = "mesh",
	mesh = "torch_floor.obj",
	inventory_image = "ws_torch.png",
	wield_image = "ws_torch.png",
	tiles = {"ws_torch.png"},
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	liquids_pointable = false,
	light_source = 10,
	groups = {choppy=2, dig_immediate=3, flammable=1, attached_node=1, torch=1},
	drop = "ws_core:torch",
	selection_box = {
		type = "wallmounted",
		wall_bottom = {-1/8, -1/2, -1/8, 1/8, 2/16, 1/8},
	},
	sounds = ws_core.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
		local under = pointed_thing.under
		local node = minetest.get_node(under)
		local def = minetest.registered_nodes[node.name]
		if def and def.on_rightclick and
			not (placer and placer:is_player() and
			placer:get_player_control().sneak) then
			return def.on_rightclick(under, node, placer, itemstack,
				pointed_thing) or itemstack
		end

		local above = pointed_thing.above
		local wdir = minetest.dir_to_wallmounted(vector.subtract(under, above))
		local fakestack = itemstack
		if wdir == 1 then
			fakestack:set_name("ws_core:torch")
		else
			fakestack:set_name("ws_core:torch_wall")
		end

		itemstack = minetest.item_place(fakestack, placer, pointed_thing, wdir)
		itemstack:set_name("ws_core:torch")

		return itemstack
	end,
	floodable = true,
	on_flood = on_flood,
	on_rotate = false
})

minetest.register_node("ws_core:torch_wall", {
	drawtype = "mesh",
	mesh = "torch_wall.obj",
	tiles = {"ws_torch.png"},
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = 10,
	groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, torch=1},
	drop = "ws_core:torch",
	selection_box = {
		type = "wallmounted",
		wall_side = {-1/2, -1/2, -1/8, -1/8, 1/8, 1/8},
	},
	sounds = ws_core.node_sound_wood_defaults(),
	floodable = true,
	on_flood = on_flood,
	on_rotate = false
})

minetest.register_lbm({
	name = "ws_core:3dtorch",
	nodenames = {"ws_core:torch", "torches:floor", "torches:wall"},
	action = function(pos, node)
		if node.param2 == 1 then
			minetest.set_node(pos, {name = "ws_core:torch",
				param2 = node.param2})
		else
			minetest.set_node(pos, {name = "ws_core:torch_wall",
				param2 = node.param2})
		end
	end
})

minetest.register_craft({
	output = "ws_core:torch 4",
	recipe = {
		{"ws_core:coal"},
		{"group:stick"},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "ws_core:torch",
	burntime = 4,
})
