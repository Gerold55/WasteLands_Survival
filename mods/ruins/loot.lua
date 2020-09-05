local loot = {
	--on average 1 torches min 0 max 3
	{name="ws_core:lantern",mid=1,var=2},
	--on average 0 picks min 0 max 1
	--mid value 0.30 increases the chance of getting to 30%
	{name="ws_core:scrap",mid=.3,var=1},
	--on average 8 wood min 0 max 16
	--25% chance to get 0 wood
	{name="ws_core:planks_old",mid=8,var=16},
	{name="ws_core:hatchet_bone",mid=.1,var=1},
	{name="ws_core:knife_bone",mid=.1,var=1},
}

function load_barrel(pos, node)
	local meta = minetest.get_meta(pos)
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
	tiles = {
		"ws_barrel_top_1.png", --top
		"ws_barrel_top.png", --bottom
		"ws_barrel.png", --sides
	},
	is_ground_content = false,
	groups = {choppy = 3}, --not_in_creative_inventory = 1},
	--perhaps also show the formspec on rightclick
	on_rightclick = load_barrel,
	on_place = minetest.rotate_node,
})

minetest.register_lbm {
	label = "load wls loot",
	name = "ruins:load_loot",
	nodenames = {"ruins:loot_barrel"},
	run_at_every_load = true,
	action = load_barrel
}

minetest.register_node("ruins:clay_pot", {
	description = "Clay Pot",
	drawtype = "nodebox",
	paramtype2 = "facedir",
	tiles = {
		"ws_clay_pot_top_closed.png",
		"ws_clay_pot_bottom.png",
		"ws_clay_pot_cracked.png",
		"ws_clay_pot_cracked.png",
		"ws_clay_pot_cracked.png",
		"ws_clay_pot_cracked.png"
	},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, -0.4375, 0.375}, -- NodeBox1
			{-0.4375, -0.4375, -0.4375, 0.4375, 0.3125, 0.4375}, -- NodeBox2
			{-0.375, 0.3125, -0.375, 0.375, 0.375, 0.375}, -- NodeBox3
			{-0.4375, 0.375, -0.4375, 0.4375, 0.5, 0.4375}, -- NodeBox4
		}
	}
})