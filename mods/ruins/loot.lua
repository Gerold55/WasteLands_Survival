local loot = {
	--on average 1 torches min 0 max 4
	{name="ws_core:lantern_floor",mid=1,var=3},
	--on average 0 picks min 0 max 1
	--mid value 0.2 increases the chance of getting to 20%
	{name="ws_core:pick_scrap",mid=.2,var=1},
	--on average 8 wood min 0 max 16
	--25% chance to get 0 wood
	{name="ws_core:planks_oak_dry",mid=8,var=16},
	{name="ws_core:hatchet_bone",mid=.15,var=1},
	{name="ws_core:knife_bone",mid=.15,var=1},
}

function load_barrel(pos, node)
	local meta = minetest.env:get_meta(pos)
	local inv = meta:get_inventory()
	--inv:set_size('main', 8*4)
	inv:set_size('storage', 9*3)
	meta:set_string('formspec',
		'size [9,9]'..
		'bgcolor[#080808BB;false]'..
		'list[current_name;storage;0,0.2;9,3;]'..
		'list[current_player;main;0.5,5;8,4;]')
	for _,l in pairs(loot) do
		local amount = math.random(-l.var,l.var) + l.mid
		amount = math.floor(amount+.5)
		if amount > 0 then
			inv:add_item("storage", l.name.." "..amount)
		end
	end
	minetest.swap_node(pos, {name = "ws_core:barrel", param2 = node.param2})
end

minetest.register_node("ruins:loot_barrel", {
	description = "Loot Barrel",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {
		"ws_barrel.png", --top
		"ws_barrel.png", --bottom
		"ws_barrel.png^[transformR90", --right
		"ws_barrel.png^[transformR90", --left
		"ws_barrel_top.png", --back
		"ws_barrel_top.png" --front
	},
	is_ground_content = false,
	groups = {}, --not_in_creative_inventory = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		}
	},
	--perhaps also show the formspec on rightclick
	on_rightclick = load_barrel
})

minetest.register_lbm {
	label = "load wls loot",
	name = "ruins:load_loot",
	nodenames = {"ruins:loot_barrel"},
	run_at_every_load = true,
	action = load_barrel
}
