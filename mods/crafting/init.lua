minetest.register_node("crafting:crafting_table", {
	description = "WorkBench",
	tiles = {
		"crafting_table_top.png", "crafting_table_bottom.png", "crafting_table_side3.png",
		"crafting_table_side2.png", "crafting_table_side3.png", "crafting_table_side.png"
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
