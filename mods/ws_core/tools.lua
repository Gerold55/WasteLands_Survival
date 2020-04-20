if not minetest.settings:get_bool("creative_mode") then
	minetest.register_item(":", {
		type = "none",
		wield_image = "wieldhand.png",
		wield_scale = {x=1,y=1,z=2.5},
		tool_capabilities = {
			full_punch_interval = 0.9,
			max_drop_level = 0,
			groupcaps = {
				crumbly = {times={[2]=3.00, [3]=1.50}, uses=0, maxlevel=1},
				snappy = {times={[3]=1.80}, uses=0, maxlevel=1},
				oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.70}, uses=0}
			},
			damage_groups = {fleshy=1},
		}
	})
end

-- Bone tools

minetest.register_tool("ws_core:knife_bone", {
	description = "Bone Knife",
	inventory_image = "ws_knife_bone.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			snappy = {times={[3]=1.00}, uses=15, maxlevel=1},
			choppy = {times={[2]=4.00, [3]=3.00}, uses=8, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	groups = {knife = 1},
	sound = {breaks = "default_tool_breaks"},
	on_place = strip_bark,
})

minetest.register_tool("ws_core:hatchet_bone", {
	description = "Bone Hatchet",
	inventory_image = "ws_hatchet_bone.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=0,
		groupcaps={
			choppy = {times={[2]=2.50, [3]=1.50}, uses=15, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	groups = {hatchet = 1},
	sound = {breaks = "default_tool_breaks"},
})

-- Scrap metal tools

minetest.register_tool("ws_core:knife_scrap", {
	description = "Scrap Knife",
	inventory_image = "ws_knife_scrap.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			snappy = {times={[3]=0.70}, uses=50, maxlevel=1},
			choppy = {times={[2]=3.00, [3]=2.00}, uses=25, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	groups = {knife = 1},
	sound = {breaks = "default_tool_breaks"},
	on_place = strip_bark,
})

minetest.register_tool("ws_core:hatchet_scrap", {
	description = "Scrap Hatchet",
	inventory_image = "ws_hatchet_scrap.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=0,
		groupcaps={
			choppy = {times={[2]=2.00, [3]=1.00}, uses=50, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	groups = {hatchet = 1},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("ws_core:shovel_scrap", {
	description = "Scrap Shovel",
	inventory_image = "ws_shovel_scrap.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=0,
		groupcaps={
			crumbly = {times={[2]=2.00, [3]=1.00}, uses=50, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	groups = {shovel = 1},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("ws_core:pick_scrap", {
	description = "Scrap Pickaxe",
	inventory_image = "ws_pickaxe_scrap.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[2]=4.00, [3]=2.50}, uses=30, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	groups = {pickaxe = 1},
	sound = {breaks = "default_tool_breaks"},
})
