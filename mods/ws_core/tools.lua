minetest.register_item(":", {
	type = "none",
	wield_image = "wieldhand.png",
	wield_scale = {x=1,y=1,z=2.5},
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 0,
		groupcaps = {
			crumbly = {times={[1]=1.10}, uses=0, maxlevel=0},
			snappy = {times={[1]=1.00}, uses=0, maxlevel=0},
			oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.70}, uses=0}
		},
		damage_groups = {fleshy=1},
	}
})

minetest.register_tool("ws_core:knife_flint", {
	description = "Flint Knife",
	inventory_image = "ws_knife_flint.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			snappy = {times={[1]=0.40}, uses=50, maxlevel=0},
			choppy = {times={[1]=3.00, [2]=4.00}, uses=30, maxlevel=0},
		},
		damage_groups = {fleshy=2},
	},
	groups = {knife = 1},
	sound = {breaks = "default_tool_breaks"},
	on_place = strip_bark,
})

minetest.register_tool("ws_core:hatchet_flint", {
	description = "Flint Hatchet",
	inventory_image = "ws_hatchet_flint.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=0,
		groupcaps={
			choppy = {times={[1]=1.50, [2]=2.00}, uses=50, maxlevel=0},
		},
		damage_groups = {fleshy=2},
	},
	groups = {hatchet = 1},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("ws_core:pick_bone", {
	description = "Bone Pickaxe",
	inventory_image = "ws_pickaxe_bone.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[1]=1.50, [2]=2.50}, uses=50, maxlevel=0},
		},
		damage_groups = {fleshy=2},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("ws_core:hatchet_bone", {
	description = "Bone Hatchet",
	inventory_image = "ws_hatchet_bone.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=0,
		groupcaps={
			choppy = {times={[1]=1.50, [2]=2.00}, uses=50, maxlevel=0},
		},
		damage_groups = {fleshy=2},
	},
	groups = {hatchet = 1},
	sound = {breaks = "default_tool_breaks"},
})
