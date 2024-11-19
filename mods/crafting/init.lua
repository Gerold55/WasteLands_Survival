-- Crafting Table Node Definition
minetest.register_node("crafting:crafting_table", {
	description = "WorkBench",
	tiles = {
		"crafting_table_top.png", "crafting_table_bottom.png", "crafting_table_side3.png",
		"crafting_table_side3.png", "crafting_table_side.png", "crafting_table_side2.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy = 2, oddly_breakable_by_hand = 2},

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", [=[
			size[8,7.5]
			list[current_player;main;0,3.5;8,4;]
			list[current_player;craft;1.5,0;3,3;]
			list[current_player;craftpreview;5.5,1;1,1;]
			image[4.5,1;1,1;gui_furnace_arrow_bg.png]
		]=])
	end,
})

-- Crafting Table Recipe Registration
minetest.register_craft({
	output = "crafting:crafting_table",
	recipe = {
		{"group:wood", "group:wood"},
		{"group:wood", "group:wood"}
	},
})

-- Progressive Crafting Table Definitions
local prog_fs = [=[
	size[8,8.5]
	list[current_player;main;0,4.5;8,4;]
	list[context;addons;0.5,0;1,4;]
	list[context;craft;2,0.5;3,3;]
	image[5.25,1.5;1,1;gui_furnace_arrow_bg.png]
]=]

local function get_prog_button(name)
	return ("item_image_button[6.5,1.5;1,1;%s;prog_craft;]"):format(name)
end

-- Crafting Logic
local function get_recipe(inv)
	local craft = inv:get_list("craft")
	local outputs = {
		{"group:wood", "group:stone", "crafting:crafting_table_progressive"}
	}

	for _, output in ipairs(outputs) do
		if craft[1] == output[1] and craft[2] == output[2] then
			return output[3]
		end
	end

	return nil
end

local function update(pos, player)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local item = get_recipe(inv)

	if player and item then
		player:get_inventory():add_item("main", item)
		-- Clear Crafting Grid
		for i = 1, 9 do
			local it = inv:get_stack("craft", i)
			it:take_item()
			inv:set_stack("craft", i, it)
		end
		-- Reset Addons
		for i = 10, 13 do
			inv:remove_item("addons", inv:get_stack("addons", i))
		end
	end

	-- Update Formspec with Craft Button
	meta:set_string("formspec", prog_fs .. get_prog_button(item or ""))
end

-- Progressive Crafting Table Node Registration
minetest.register_node("crafting:crafting_table_progressive", {
	description = "Progressive WorkBench",
	tiles = {
		"progtable_top.png", "progtable_side3.png", "progtable_side4.png",
		"progtable_side2.png", "progtable_side3.png", "progtable_side1.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy = 2, oddly_breakable_by_hand = 2},

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", prog_fs .. get_prog_button(""))
		meta:get_inventory():set_size("craft", 9)
		meta:get_inventory():set_size("addons", 4)
	end,

	on_metadata_inventory_put = function(pos) update(pos) end,
	on_metadata_inventory_take = function(pos) update(pos) end,
	on_metadata_inventory_move = function(pos) update(pos) end,
	on_receive_fields = function(pos, _, fields, sender)
		if fields.quit then
			update(pos)
		else
			update(pos, sender)
		end
	end,
})

-- Multiblock Crafting Recipe
minetest.register_craft({
	output = "crafting:crafting_table_progressive",
	recipe = {
		{"crafting:crafting_table", "group:wood", "crafting:crafting_table"},
		{"group:wood", "crafting:crafting_table", "group:wood"},
		{"crafting:crafting_table", "group:wood", "crafting:crafting_table"}
	},
})
