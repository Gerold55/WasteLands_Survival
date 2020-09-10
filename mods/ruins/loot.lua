local loot = {
	-- {name = "", chance = , min = , max = },
	{name = "ws_core:lantern", chance = 3/5, min = 1, max = 3},
	{name = "ws_core:planks_old", chance = 3/4, min = 1, max = 24},
	{name = "ws_core:stick", chance = 1/2, min = 2, max = 5},
	{name = "ws_core:bone_shard", chance = 1/3, min = 1, max = 2},
	{name = "ws_core:scrap", chance = 1/3, min = 1, max = 1},
	{name = "food:can", chance = 1/3, min = 1, max = 1},
}

local function load_barrel(pos, node)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	inv:set_size('main', 8*3)
	meta:set_string('formspec',
		'size [8,8]'..
		'bgcolor[#080808BB;false]'..
		'list[context;main;0,0.2;8,3;]'..
		'list[current_player;main;0,4;8,4;]'..
		'listring[]')
	for _, l in pairs(loot) do
		if math.random() < l.chance then
			local amount = math.random(l.min,l.max)
			local to_add = l.name .. " " .. amount
			-- TODO: make it so tools are damaged
			inv:add_item("main", to_add)
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
	paramtype = "light",
	tiles = {
		"ws_clay_pot_top_closed.png",
		"ws_clay_pot_bottom.png",
		"ws_clay_pot_cracked.png",
	},
	is_ground_content = false,
	groups = {oddly_breakable_by_hand = 3},
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
