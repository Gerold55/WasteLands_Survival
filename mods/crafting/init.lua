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
		minetest.get_meta(pos):set_string("formspec", [=[
			size[8,7.5]
			list[current_player;main;0,3.5;8,4;]
			list[current_player;craft;1.5,0;3,3;]
			list[current_player;craftpreview;5.5,1;1,1;]
			image[4.5,1;1,1;gui_furnace_arrow_bg.png]
		]=])
	end,
})

local old_getter = betterinv.tabs.default.getter
function betterinv.tabs.default.getter(player, context)
	return old_getter(player, context) .. [=[
		list[current_player;craft;2,2;2,1;]
		list[current_player;craft;2,3;2,1;3]
		list[current_player;craftpreview;5,2.5;1,1;]
		image[4,2.5;1,1;gui_furnace_arrow_bg.png]
	]=]
end
api.recipes.add_implementor("crafting_table", "crafting:crafting_table")
api.recipes.add_implementor("furnace", "factory:ind_furnace")
api.recipes.add_implementor("furnace", "factory:electronic_furnace")

minetest.register_craft({
	output = "crafting:crafting_table",
	recipe = {
		{"group:wood", "group:wood"},
		{"group:wood", "group:wood"}
	},
})

-- Progressive Table
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

api.recipes.add_method("crafting_table_progressive", {
	input_amount = 13,
	output_amount = 1,
	get_input_coords = function(n)
		if n > 9 then
			return 0.5, n - 9.5
		else
			return api.recipes.get_coords(3, 1, 0, n)
		end
	end,
	get_output_coords = api.recipes.coord_getter(1, 4.5, 1),
	formspec_width = 6.5,
	formspec_height = 5,
	formspec_name = "P. Crafting"
})

local function get_recipe(inv)
	local craft = inv:get_list"craft"
	local addons_map = api.inv_to_itemmap(inv:get_list"addons", craft)
	for _,_,rec in api.recipes.availables_iterator("crafting_table_progressive", addons_map) do
		if api.recipes.check_inputs_shaped(craft, table.filter(rec.inputs, function(v,k) return k <= 9 end), rec.data.width, rec.data.height, 3, 3) then
			return rec, rec.outputs[1]
		end
	end
	return false, ""
end

local function update(pos, player)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local last_recipe, item, _ = get_recipe(inv)

	if player and last_recipe then
		player:get_inventory():add_item("main", item)
		for i = 1, 9 do
			local it = inv:get_stack("craft", i)
			it:take_item()
			inv:set_stack("craft", i, it)
		end

		for i = 10, 13 do
			if last_recipe.inputs[i] then
				inv:remove_item("addons", last_recipe.inputs[i])
			end
		end
		_, item = get_recipe(inv)
	end
	meta:set_string("formspec", prog_fs .. get_prog_button(item))
end

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
		api.initialize_inventory(meta:get_inventory(), {craft = 9, addons = 4})
		meta:set_string("formspec", prog_fs .. get_prog_button(""))
	end,

	on_metadata_inventory_put = function(pos) update(pos) end,
	on_metadata_inventory_take = function(pos) update(pos) end,
	on_metadata_inventory_move = function(pos) update(pos) end,
	on_receive_fields = function(pos, _, fields, sender)
		if fields.quit then update(pos)
		else update(pos, sender) end
	end,
})

api.recipes.add_implementor("crafting_table_progressive", "crafting:crafting_table_progressive")

local recipe = api.recipes.add("multiblock_3_3",
	{"crafting:crafting_table", "group:wood", "crafting:crafting_table",
	"group:wood", "crafting:crafting_table", "group:wood",
	"crafting:crafting_table", "group:wood", "crafting:crafting_table"},
	{"crafting:crafting_table_progressive"}, {h = 0, activator = "ws_core:knife_bone"})

local removing = {
	{x = 0, y = 0, z = -1}, {x = 0, y = 0, z = 1},
	{x = 1, y = 0, z = 0}, {x = -1, y = 0, z = 0},
	{x = 1, y = 0, z = 1}, {x = 1, y = 0, z = -1},
	{x = -1, y = 0, z = 1}, {x = -1, y = 0, z = -1}
}
api.make_activated_multiblock(recipe, removing)

api.recipes.add("crafting_table_progressive",
		{"group:wood", "group:wood", [4] = "group:wood", [5] = "group:wood", [10] = "crafting:crafting_table"},
		{"crafting:crafting_table_progressive"}, {width = 2, height = 2})
