-- Loot table configuration
local loot = {
	-- {name = "", chance = , min = , max = },
	{name = "ws_core:lantern", chance = 0.6, min = 1, max = 3},
	{name = "ws_core:planks_old", chance = 0.75, min = 1, max = 24},
	{name = "ws_core:stick", chance = 0.5, min = 2, max = 5},
	{name = "ws_core:bone_shard", chance = 0.33, min = 1, max = 2},
	{name = "ws_core:scrap", chance = 0.33, min = 1, max = 1},
	{name = "food:can", chance = 0.33, min = 1, max = 1},
}

-- Function to load loot into the barrel
local function load_barrel(pos, node)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	inv:set_size('main', 8*3) -- Set inventory size (8x3 grid)

	-- Define formspec for the barrel's UI
	meta:set_string('formspec',
		'size[8,8]'..
		'bgcolor[#080808BB;false]'..
		'list[context;main;0,0.2;8,3;]'..
		'list[current_player;main;0,4;8,4;]'..
		'listring[]')
	
	-- Add random loot to the inventory based on defined chances
	for _, item in ipairs(loot) do
		if math.random() < item.chance then
			local amount = math.random(item.min, item.max)
			local stack = ItemStack(item.name .. " " .. amount)
			inv:add_item("main", stack) -- Add loot to barrel's inventory
		end
	end
	
	-- Replace node with filled loot barrel
	minetest.swap_node(pos, {name = "ws_core:barrel", param2 = node.param2})
end

-- Register the Loot Barrel node
minetest.register_node("ruins:loot_barrel", {
	description = "Loot Barrel",
	paramtype2 = "facedir", -- Allow barrel to face different directions
	tiles = {
		"ws_barrel_top_1.png", -- Top texture
		"ws_barrel_top.png", -- Bottom texture
		"ws_barrel.png", -- Side texture
	},
	is_ground_content = false, -- Prevent barrel from being generated as ground
	groups = {choppy = 3}, -- Set digging group (higher number means more difficult to dig)
	on_rightclick = load_barrel, -- Trigger loot loading on right-click
	on_place = minetest.rotate_node, -- Allow proper rotation when placing
})

-- Register a LBM (Load Block Modifier) to load loot into existing barrels
minetest.register_lbm({
	label = "Load WLS Loot",
	name = "ruins:load_loot",
	nodenames = {"ruins:loot_barrel"},
	run_at_every_load = true, -- Ensure loot loads every time the map block is loaded
	action = load_barrel
})

-- Register the Clay Pot node
minetest.register_node("ruins:clay_pot", {
	description = "Clay Pot",
	drawtype = "nodebox", -- Define node as a custom-shaped block
	paramtype = "light", -- Ensure it reacts properly to lighting
	tiles = {
		"ws_clay_pot_top_closed.png", -- Top texture
		"ws_clay_pot_bottom.png", -- Bottom texture
		"ws_clay_pot_cracked.png", -- Side texture
	},
	is_ground_content = false, -- Prevent the clay pot from being generated as ground content
	groups = {oddly_breakable_by_hand = 3}, -- Set group to break by hand
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, -0.4375, 0.375}, -- Base
			{-0.4375, -0.4375, -0.4375, 0.4375, 0.3125, 0.4375}, -- Body
			{-0.375, 0.3125, -0.375, 0.375, 0.375, 0.375}, -- Rim
			{-0.4375, 0.375, -0.4375, 0.4375, 0.5, 0.4375}, -- Lid
		}
	}
})
