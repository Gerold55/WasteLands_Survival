-- =====================
-- WOOD SLABS AND STAIRS
-- =====================

stairs.register_stair_and_slab(
	"planks_dead",				-- part of node id
	"ws_core:planks_dead",		-- crafting component
								-- groups (automaticaly gets slab/stair group)
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"ws_planks_dead.png"},		-- {tile definition 1, def2, def3, def4, def5, def6}
	"Dead Wood Stair",			-- stairs name
	"Dead Wood Slab",			-- slab name
	nil,						-- sound specification
	true						-- world alignment
)

stairs.register_stair_and_slab(
	"planks_oak",
	"ws_core:planks_oak",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"ws_planks_oak.png"},
	"Oak Wood Stair",
	"Oak Wood Slab",
	nil,
	true
)

stairs.register_stair_and_slab(
	"planks_balsa",
	"ws_core:planks_balsa",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"ws_planks_balsa.png"},
	"Balsa Wood Stair",
	"Balsa Wood Slab",
	nil,
	true
)

stairs.register_stair_and_slab(
	"planks_old",
	"ws_core:planks_old",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"ws_planks_old.png"},
	"Old Wood Stair",
	"Old Wood Slab",
	nil,
	true
)

-- ===========
-- WOOD FENCES
-- ===========

ws_core.register_fence("ws_core:fence_dead", {
	description = "Dead Wood Fence",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},

	material = "ws_core:planks_dead",
	texture = "ws_planks_dead.png",
})

ws_core.register_fence("ws_core:fence_oak", {
	description = "Oak Wood Fence",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},

	material = "ws_core:planks_oak",
	texture = "ws_planks_oak.png",
})

ws_core.register_fence("ws_core:fence_balsa", {
	description = "Balsa Wood Fence",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},

	material = "ws_core:planks_balsa",
	texture = "ws_planks_balsa.png",
})

ws_core.register_fence("ws_core:fence_old", {
	description = "Old Wood Fence",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},

	material = "ws_core:planks_old",
	texture = "ws_planks_old.png",
})



-- ============================

stairs.register_stair_and_slab(
	"cobble",
	"ws_core:cobble",
	{cracky = 3},
	{"ws_cobble.png"},
	"Cobblestone Stair",
	"Cobblestone Slab",
	nil,
	true
)


-- For now kept, so ruin schematics don't break
stairs.register_stair_and_slab(
	"wood",
	"ws_core:planks_old",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"ws_planks_old.png"},
	"Compatibility Stair",
	"Compatibility Slab",
	nil,
	true
)
