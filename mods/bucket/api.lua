local function check_protection(pos, name, text)
	if minetest.is_protected(pos, name) then
		minetest.log("action", (name ~= "" and name or "A mod")
			.. " tried to " .. text
			.. " at protected position "
			.. minetest.pos_to_string(pos)
			.. " with a bucket")
		minetest.record_protection_violation(pos, name)
		return true
	end
	return false
end

local function on_bucket_use(itemstack, user, pointed_thing)

	if pointed_thing.type == "object" then
		pointed_thing.ref:punch(user, 1.0, { full_punch_interval=1.0 }, nil)
		return user:get_wielded_item()
	elseif pointed_thing.type ~= "node" then
		-- do nothing if it's neither object nor node
		return
	end

	-- Check if pointing to a valid liquid source
	local item_def = minetest.registered_items[itemstack:get_name()]
	local liquids = item_def._bucket

	local node = minetest.get_node(pointed_thing.under)
	local liquiddef = liquids[node.name]

	if not liquiddef then
		-- non-liquid nodes will have their on_punch triggered
		local node_def = minetest.registered_nodes[node.name]
		if node_def then
			node_def.on_punch(pointed_thing.under, node, user, pointed_thing)
		end
		return user:get_wielded_item()
	else
		if check_protection(pointed_thing.under,
				user:get_player_name(),
				"take ".. node.name) then
			return
		end

		-- default set to return filled bucket
		local giving_back = liquiddef.bucket_full

		-- check if holding more than 1 empty bucket
		if itemstack:get_count() > 1 then

			-- if space in inventory add filled bucked, otherwise drop as item
			local inv = user:get_inventory()
			if inv:room_for_item("main", {name=giving_back}) then
				inv:add_item("main", giving_back)
			else
				local pos = user:get_pos()
				pos.y = math.floor(pos.y + 0.5)
				minetest.add_item(pos, giving_back)
			end

			-- set to return empty buckets minus 1
			itemstack:take_item()
			giving_back = itemstack
		end

		-- force_renew requires a source neighbour
		local source_neighbor = false
		if liquiddef.force_renew then
			source_neighbor =
				minetest.find_node_near(pointed_thing.under, 1, liquiddef.source)
		end
		if not (source_neighbor and liquiddef.force_renew) then
			minetest.remove_node(pointed_thing.under)
		end

		return ItemStack(giving_back)
	end
end

local function on_bucket_place(itemstack, user, pointed_thing)
	-- Must be pointing to node
	if pointed_thing.type ~= "node" then
		return
	end

	local node = minetest.get_node_or_nil(pointed_thing.under)
	local ndef = node and minetest.registered_nodes[node.name]

	-- Call on_rightclick if the pointed node defines it
	if ndef and ndef.on_rightclick and
			not (user and user:is_player() and
			user:get_player_control().sneak) then
		return ndef.on_rightclick(
			pointed_thing.under,
			node, user,
			itemstack)
	end

	local lpos

	-- Check if pointing to a buildable node
	if ndef and ndef.buildable_to then
		-- buildable; replace the node
		lpos = pointed_thing.under
	else
		-- not buildable to; place the liquid above
		-- check if the node above can be replaced

		lpos = pointed_thing.above
		node = minetest.get_node_or_nil(lpos)
		local above_ndef = node and minetest.registered_nodes[node.name]

		if not above_ndef or not above_ndef.buildable_to then
			-- do not remove the bucket with the liquid
			return itemstack
		end
	end

	local item_def = minetest.registered_items[itemstack:get_name()]
	local liquids = item_def._bucket

	if check_protection(lpos, user
			and user:get_player_name()
			or "", "place "..liquids.liquid) then
		return
	end

	minetest.set_node(lpos, {name = liquids.liquid})
	return ItemStack(liquids.bucket_empty)
end

local function register_bucket_empty(bucket_def, liquids)
	minetest.register_craftitem(bucket_def.item_name,{
		description = bucket_def.description,
		inventory_image = bucket_def.inventory_image,
		stack_max = 99,
		liquids_pointable = true,
		groups = bucket_def.groups,
		_bucket = liquids,
		on_use = on_bucket_use,
	})
end

local function register_bucket_full(bucket_def, bucket_empty)
	minetest.register_craftitem(bucket_def.item_name, {
		description = bucket_def.description,
		inventory_image = bucket_def.inventory_image,
		stack_max = 1,
		liquids_pointable = true,
		groups = bucket_def.groups,
		_bucket = {
			bucket_empty = bucket_empty.item_name,
			liquid = bucket_def.liquid_source
		},
		on_place = on_bucket_place
	})
end

bucket = {}
bucket.register_bucket = function(bucket_empty, buckets_full)
	local liquids = {}
	for _, v in pairs(buckets_full) do
		liquids[v.liquid_source] = {
			bucket_full = v.item_name,
			force_renew = v.force_renew,
		}
	end
	register_bucket_empty(bucket_empty, liquids)

	for _, bucket_def in pairs(buckets_full) do
		register_bucket_full(bucket_def, bucket_empty)
	end
end
