local S = factory.S
local move_player = factory.setting_enabled("Fanmove", false)

--TODO: write functions for easier implementation
minetest.register_node("factory:fan_on", {
	description = S("Fan"),
	tiles = {{name="factory_fan.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.2}},
		"factory_belt_bottom.png", "factory_belt_side.png", "factory_belt_side.png", "factory_belt_side.png",
		"factory_belt_side.png"},
	groups = {cracky=3, mesecon_effector_off = 1},
	drawtype = "nodebox",
	paramtype = "light",
	is_ground_content = true,
	node_box = {
			type = "fixed",
			fixed = {{-0.5,-0.5,-0.5,0.5,0.0625,0.5},}
		},
	on_rightclick = function(pos, node)
		minetest.swap_node(pos, {name = "factory:fan_off", param2 = node.param2})
	end,
	mesecons = {effector = {
		action_on = function(pos, node)
			minetest.swap_node(pos, {name = "factory:fan_off", param2 = node.param2})
		end
	}}
})

minetest.register_node("factory:fan_off", {
	description = S("Fan"),
	tiles = {"factory_fan_off.png", "factory_belt_bottom.png", "factory_belt_side.png",
		"factory_belt_side.png", "factory_belt_side.png", "factory_belt_side.png"},
	groups = {cracky=3, not_in_creative_inventory=1, mesecon_effector_on = 1},
	drawtype = "nodebox",
	paramtype = "light",
	is_ground_content = true,
	drop="factory:fan_on",
	node_box = {
			type = "fixed",
			fixed = {{-0.5,-0.5,-0.5,0.5,0.0625,0.5},}
		},
	on_rightclick = function(pos, node)
		minetest.swap_node(pos, {name = "factory:fan_on", param2 = node.param2})
	end,
	mesecons = {effector = {
		action_off = function(pos, node)
			minetest.swap_node(pos, {name = "factory:fan_on", param2 = node.param2})
		end
	}}
})

minetest.register_abm({
	nodenames = {"factory:fan_on"},
	neighbors = nil,
	interval = 1,
	chance = 1,
	action = function(pos)
		local all_objects = minetest.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1)
		for _,obj in ipairs(all_objects) do
			if move_player and obj:is_player() then
				obj:moveto({x = obj:get_pos().x, y = obj:get_pos().y + 3, z = obj:get_pos().z})
			else
				local ent = obj:get_luaentity()
				if ent and (ent.name == "__builtin:item" or ent.name == "factory:moving_item") then
					obj:moveto({x = obj:get_pos().x, y = obj:get_pos().y + 3, z = obj:get_pos().z})
				end
			end
		end
	end,
})




minetest.register_node("factory:fan_wall_on", {
	description = S("Wall Fan"),
	tiles = {"factory_belt_side.png^[transformFY", "factory_belt_side.png", "factory_belt_side.png^[transformR90",
		"factory_belt_side.png^[transformR270", "factory_belt_bottom.png", {name="factory_fan.png",
		animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.2}}},
	groups = {cracky=3, mesecon_effector_off = 1},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = true,
	legacy_facedir_simple = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 0.5, 0.5},
		}
	},
	on_rightclick = function(pos, node)
		minetest.swap_node(pos, {name = "factory:fan_wall_off", param2 = node.param2})
	end,
	mesecons = {effector = {
		action_on = function(pos, node)
			minetest.swap_node(pos, {name = "factory:fan_wall_off", param2 = node.param2})
		end
	}}
})

minetest.register_node("factory:fan_wall_off", {
	description = S("Wall Fan"),
	tiles = {"factory_belt_side.png^[transformFY", "factory_belt_side.png", "factory_belt_side.png^[transformR90",
		"factory_belt_side.png^[transformR270", "factory_belt_bottom.png", "factory_fan_off.png"},
	groups = {cracky=3, not_in_creative_inventory=1, mesecon_effector_on = 1},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = true,
	legacy_facedir_simple = true,
	drop="factory:fan_wall_on",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 0.5, 0.5},
		}
	},
	on_rightclick = function(pos, node)
		minetest.swap_node(pos, {name = "factory:fan_wall_on", param2 = node.param2})
	end,
	mesecons = {effector = {
		action_off = function(pos, node)
			minetest.swap_node(pos, {name = "factory:fan_wall_on", param2 = node.param2})
		end
	}}
})

minetest.register_abm({
	nodenames = {"factory:fan_wall_on"},
	neighbors = nil,
	interval = 1,
	chance = 1,
	action = function(pos)
		local a = minetest.facedir_to_dir(minetest.get_node(pos).param2)
		local all_objects = minetest.get_objects_inside_radius({x = pos.x - a.x/2, y = pos.y, z = pos.z - a.z/2}, 1)
		for _,obj in ipairs(all_objects) do
			if move_player and obj:is_player() then
				obj:move_to({x = obj:get_pos().x - a.x*2.0, y = obj:get_pos().y, z = obj:get_pos().z - a.z*2.0})
			else
				local ent = obj:get_luaentity()
				if ent and (ent.name == "__builtin:item" or ent.name == "factory:moving_item") then
					obj:move_to({x = obj:get_pos().x - a.x*2.0, y = obj:get_pos().y, z = obj:get_pos().z - a.z*2.0})
				end
			end
		end
	end,
})