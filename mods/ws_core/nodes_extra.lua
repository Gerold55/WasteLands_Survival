ws_core.register_fence("ws_core:fence_wood", {
	description = "Wood Fence",
	texture = "ws_planks_structure.png",
	inventory_image = "ws_fence_overlay.png^ws_planks_structure.png^" ..
				"ws_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "ws_fence_overlay.png^ws_planks_structure.png^" ..
				"ws_fence_overlay.png^[makealpha:255,126,126",
	material = "ws_core:planks_structure",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
})


stairs.register_stair_and_slab(
	"wood",
	"ws_core:planks_structure",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"ws_planks_structure.png"},
	-- Might need a better descriptor then "Old"
	"Old Wood Stair",
	"Old Wood Slab",
	false
)

stairs.register_stair_and_slab(
	"cobble",
	"ws_core:cobble",
	{cracky = 3},
	{"ws_cobble.png"},
	"Cobblestone Stair",
	"Cobblestone Slab",
	true
)
