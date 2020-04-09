minetest.register_item(":", {
	type = "none",
	wield_image = "wieldhand.png",
	wield_scale = {x=1,y=1,z=2.5},
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 0,
		groupcaps = {
			crumbly = {times={[2]=3.00, [3]=0.70}, uses=0, maxlevel=1},
			snappy = {times={[3]=0.40}, uses=0, maxlevel=1},
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
            cracky = {times={[2]=4.0, [3]=1.25}, uses=15, maxlevel=1},
        },
        damage_groups = {fleshy=2},
    },
    sound = {breaks = "default_tool_breaks"},
   on_place = function(itemstack, placer, pointed_thing)
        if minetest.get_node(pointed_thing.under).name == "ws_core:log_dead" then
            minetest.set_node(pointed_thing.under, {name = "ws_core:log_dead_stripped"})
            placer:get_inventory():add_item("main", "ws_core:bark")
            placer:get_inventory():add_item("main", "food:bug_" .. math.random(1, 2))
        end

        return itemstack
    end,
})

minetest.register_tool("ws_core:hatchet_flint", {
	description = "Flint Hatchet",
	inventory_image = "ws_hatchet_flint.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=0,
		groupcaps={
			choppy = {times={[2]=3.00, [3]=1.60}, uses=10, maxlevel=1},
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
			cracky = {times={[2]=4.0, [3]=1.25}, uses=15, maxlevel=1},
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
			choppy = {times={[2]=3.00, [3]=1.60}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	groups = {hatchet = 1},
	sound = {breaks = "default_tool_breaks"},
})
