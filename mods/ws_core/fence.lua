ws_core.register_fence("ws_core:fence_wood", {
	description = "Wood Fence",
	texture = "ws_wood.png",
	inventory_image = "ws_fence_overlay.png^ws_wood.png^" ..
				"ws_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "ws_fence_overlay.png^ws_wood.png^" ..
				"ws_fence_overlay.png^[makealpha:255,126,126",
	material = "ws_core:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
})