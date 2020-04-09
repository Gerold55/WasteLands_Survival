--
-- Sounds
--

function ws_core.node_sound_ws_cores(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "", gain = 1.0}
	table.dug = table.dug or
			{name = "ws_core_dug_node", gain = 0.25}
	table.place = table.place or
			{name = "ws_core_place_node_hard", gain = 1.0}
	return table
end

function ws_core.node_sound_stone_ws_cores(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "ws_core_hard_footstep", gain = 0.3}
	table.dug = table.dug or
			{name = "ws_core_hard_footstep", gain = 1.0}
	ws_core.node_sound_ws_cores(table)
	return table
end

function ws_core.node_sound_dirt_ws_cores(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "ws_dirt", gain = 0.4}
	table.dug = table.dug or
			{name = "ws_dirt", gain = 1.0}
	table.place = table.place or
			{name = "ws_core_place_node", gain = 1.0}
	ws_core.node_sound_ws_cores(table)
	return table
end

function ws_core.node_sound_sand_ws_cores(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "ws_core_sand_footstep", gain = 0.12}
	table.dug = table.dug or
			{name = "ws_core_sand_footstep", gain = 0.24}
	table.place = table.place or
			{name = "ws_core_place_node", gain = 1.0}
	ws_core.node_sound_ws_cores(table)
	return table
end

function ws_core.node_sound_gravel_ws_cores(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "ws_core_gravel_footstep", gain = 0.4}
	table.dug = table.dug or
			{name = "ws_core_gravel_footstep", gain = 1.0}
	table.place = table.place or
			{name = "ws_core_place_node", gain = 1.0}
	ws_core.node_sound_ws_cores(table)
	return table
end

function ws_core.node_sound_wood_ws_cores(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "ws_core_wood_footstep", gain = 0.3}
	table.dug = table.dug or
			{name = "ws_core_wood_footstep", gain = 1.0}
	ws_core.node_sound_ws_cores(table)
	return table
end

function ws_core.node_sound_leaves_ws_cores(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "ws_core_grass_footstep", gain = 0.45}
	table.dug = table.dug or
			{name = "ws_core_grass_footstep", gain = 0.7}
	table.place = table.place or
			{name = "ws_core_place_node", gain = 1.0}
	ws_core.node_sound_ws_cores(table)
	return table
end

function ws_core.node_sound_glass_ws_cores(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "ws_core_glass_footstep", gain = 0.3}
	table.dig = table.dig or
			{name = "ws_core_glass_footstep", gain = 0.5}
	table.dug = table.dug or
			{name = "ws_core_break_glass", gain = 1.0}
	ws_core.node_sound_ws_cores(table)
	return table
end

function ws_core.node_sound_metal_ws_cores(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "ws_core_metal_footstep", gain = 0.4}
	table.dig = table.dig or
			{name = "ws_core_dig_metal", gain = 0.5}
	table.dug = table.dug or
			{name = "ws_core_dug_metal", gain = 0.5}
	table.place = table.place or
			{name = "ws_core_place_node_metal", gain = 0.5}
	ws_core.node_sound_ws_cores(table)
	return table
end

function ws_core.node_sound_water_ws_cores(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "ws_water", gain = 0.2}
	ws_core.node_sound_ws_cores(table)
	return table
end

function ws_core.node_sound_snow_ws_cores(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "ws_core_snow_footstep", gain = 0.2}
	table.dig = table.dig or
			{name = "ws_core_snow_footstep", gain = 0.3}
	table.dug = table.dug or
			{name = "ws_core_snow_footstep", gain = 0.3}
	table.place = table.place or
			{name = "ws_core_place_node", gain = 1.0}
	ws_core.node_sound_ws_cores(table)
	return table
end


--
-- Lavacooling
--
-- TODO: currently no lava implemented
ws_core.cool_lava = function(pos, node)
	if node.name == "ws_core:lava_source" then
		minetest.set_node(pos, {name = "ws_core:obsidian"})
	else -- Lava flowing
		minetest.set_node(pos, {name = "ws_core:stone"})
	end
	minetest.sound_play("ws_core_cool_lava",
		{pos = pos, max_hear_distance = 16, gain = 0.25})
end

if minetest.settings:get_bool("enable_lavacooling") ~= false then
	minetest.register_abm({
		label = "Lava cooling",
		nodenames = {"ws_core:lava_source", "ws_core:lava_flowing"},
		neighbors = {"group:cools_lava", "group:water"},
		interval = 2,
		chance = 2,
		catch_up = false,
		action = function(...)
			ws_core.cool_lava(...)
		end,
	})
end


--
-- Optimized helper to put all items in an inventory into a drops list
--

function ws_core.get_inventory_drops(pos, inventory, drops)
	local inv = minetest.get_meta(pos):get_inventory()
	local n = #drops
	for i = 1, inv:get_size(inventory) do
		local stack = inv:get_stack(inventory, i)
		if stack:get_count() > 0 then
			drops[n+1] = stack:to_table()
			n = n + 1
		end
	end
end


--
-- Papyrus and cactus growing
--

-- Wrapping the functions in ABM action is necessary to make overriding them possible

-- TODO: no cactus node curently defined
function ws_core.grow_cactus(pos, node)
	if node.param2 >= 4 then
		return
	end
	pos.y = pos.y - 1
	if minetest.get_item_group(minetest.get_node(pos).name, "sand") == 0 then
		return
	end
	pos.y = pos.y + 1
	local height = 0
	while node.name == "ws_core:cactus" and height < 4 do
		height = height + 1
		pos.y = pos.y + 1
		node = minetest.get_node(pos)
	end
	if height == 4 or node.name ~= "air" then
		return
	end
	if minetest.get_node_light(pos) < 13 then
		return
	end
	minetest.set_node(pos, {name = "ws_core:cactus"})
	return true
end

function ws_core.grow_papyrus(pos, node)
	pos.y = pos.y - 1
	local name = minetest.get_node(pos).name
	if name ~= "ws_core:dirt_with_grass" and name ~= "ws_core:dirt" then
		return
	end
	if not minetest.find_node_near(pos, 3, {"group:water"}) then
		return
	end
	pos.y = pos.y + 1
	local height = 0
	while node.name == "ws_core:papyrus" and height < 4 do
		height = height + 1
		pos.y = pos.y + 1
		node = minetest.get_node(pos)
	end
	if height == 4 or node.name ~= "air" then
		return
	end
	if minetest.get_node_light(pos) < 13 then
		return
	end
	minetest.set_node(pos, {name = "ws_core:papyrus"})
	return true
end

minetest.register_abm({
	label = "Grow cactus",
	nodenames = {"ws_core:cactus"},
	neighbors = {"group:sand"},
	interval = 12,
	chance = 83,
	action = function(...)
		ws_core.grow_cactus(...)
	end
})

minetest.register_abm({
	label = "Grow papyrus",
	nodenames = {"ws_core:papyrus"},
	neighbors = {"ws_core:dirt", "ws_core:dirt_with_grass"},
	interval = 14,
	chance = 71,
	action = function(...)
		ws_core.grow_papyrus(...)
	end
})


--
-- Dig upwards
--

function ws_core.dig_up(pos, node, digger)
	if digger == nil then return end
	local np = {x = pos.x, y = pos.y + 1, z = pos.z}
	local nn = minetest.get_node(np)
	if nn.name == node.name then
		minetest.node_dig(np, nn, digger)
	end
end


--
-- Fence registration helper
--

function ws_core.register_fence(name, def)
	minetest.register_craft({
		output = name .. " 4",
		recipe = {
			{ def.material, 'group:stick', def.material },
			{ def.material, 'group:stick', def.material },
		}
	})

	local fence_texture = "ws_core_fence_overlay.png^" .. def.texture ..
			"^ws_core_fence_overlay.png^[makealpha:255,126,126"
	-- Allow almost everything to be overridden
	local ws_core_fields = {
		paramtype = "light",
		drawtype = "nodebox",
		node_box = {
			type = "connected",
			fixed = {{-1/8, -1/2, -1/8, 1/8, 1/2, 1/8}},
			-- connect_top =
			-- connect_bottom =
			connect_front = {{-1/16,3/16,-1/2,1/16,5/16,-1/8},
				{-1/16,-5/16,-1/2,1/16,-3/16,-1/8}},
			connect_left = {{-1/2,3/16,-1/16,-1/8,5/16,1/16},
				{-1/2,-5/16,-1/16,-1/8,-3/16,1/16}},
			connect_back = {{-1/16,3/16,1/8,1/16,5/16,1/2},
				{-1/16,-5/16,1/8,1/16,-3/16,1/2}},
			connect_right = {{1/8,3/16,-1/16,1/2,5/16,1/16},
				{1/8,-5/16,-1/16,1/2,-3/16,1/16}},
		},
		connects_to = {"group:fence", "group:wood", "group:tree"},
		inventory_image = fence_texture,
		wield_image = fence_texture,
		tiles = {def.texture},
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {},
	}
	for k, v in pairs(ws_core_fields) do
		if def[k] == nil then
			def[k] = v
		end
	end

	-- Always add to the fence group, even if no group provided
	def.groups.fence = 1

	def.texture = nil
	def.material = nil

	minetest.register_node(name, def)
end


--
-- Leafdecay
--

-- Prevent decay of placed leaves


--
-- Convert dirt to something that fits the environment
--

minetest.register_abm({
	label = "Grass spread",
	nodenames = {"ws_core:dirt"},
	neighbors = {
		"air",
		"group:grass",
		"group:dry_grass",
	},
	interval = 6,
	chance = 50,
	catch_up = false,
	action = function(pos, node)
		-- Check for darkness: night, shadow or under a light-blocking node
		-- Returns if ignore above
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		if (minetest.get_node_light(above) or 0) < 13 then
			return
		end

		-- Look for spreading dirt-type neighbours
		local p2 = minetest.find_node_near(pos, 1, "group:spreading_dirt_type")
		if p2 then
			local n3 = minetest.get_node(p2)
			minetest.set_node(pos, {name = n3.name})
			return
		end

		-- Else, any seeding nodes on top?
		local name = minetest.get_node(above).name

		-- Most likely case first
		if minetest.get_item_group(name, "grass") ~= 0 then
			minetest.set_node(pos, {name = "ws_core:dirt_with_grass"})
		elseif minetest.get_item_group(name, "dry_grass") ~= 0 then
			minetest.set_node(pos, {name = "ws_core:dirt_with_dry_grass"})
		end
	end
})


--
-- Grass and dry grass removed in darkness
--

minetest.register_abm({
	label = "Grass covered",
	nodenames = {"group:spreading_dirt_type"},
	interval = 8,
	chance = 50,
	catch_up = false,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if name ~= "ignore" and nodedef and not ((nodedef.sunlight_propagates or
				nodedef.paramtype == "light") and
				nodedef.liquidtype == "none") then
			minetest.set_node(pos, {name = "ws_core:dirt"})
		end
	end
})


--
-- Moss growth on cobble near water
--


--
-- Coral death near air
--

minetest.register_abm({
	nodenames = {"ws_core:coral_brown", "ws_core:coral_orange"},
	neighbors = {"air"},
	interval = 17,
	chance = 5,
	catch_up = false,
	action = function(pos, node)
		minetest.set_node(pos, {name = "ws_core:coral_skeleton"})
	end,
})


--
-- NOTICE: This method is not an official part of the API yet.
-- This method may change in future.
--

function ws_core.can_interact_with_node(player, pos)
	if player then
		if minetest.check_player_privs(player, "protection_bypass") then
			return true
		end
	else
		return false
	end

	local meta = minetest.get_meta(pos)
	local owner = meta:get_string("owner")

	if not owner or owner == "" or owner == player:get_player_name() then
		return true
	end

	-- Is player wielding the right key?
	local item = player:get_wielded_item()
	-- TODO: currently no key item is defined
	if item:get_name() == "ws_core:key" then
		local key_meta = item:get_meta()

		if key_meta:get_string("secret") == "" then
			local key_oldmeta = item:get_metadata()
			if key_oldmeta == "" or not minetest.parse_json(key_oldmeta) then
				return false
			end

			key_meta:set_string("secret", minetest.parse_json(key_oldmeta).secret)
			item:set_metadata("")
		end

		return meta:get_string("key_lock_secret") == key_meta:get_string("secret")
	end

	return false
end
