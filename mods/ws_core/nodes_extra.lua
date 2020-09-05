-- =====================
-- WOOD SLABS AND STAIRS
-- =====================

stairs.register_stair_and_slab(
	"planks_dead",				-- part of node id
	"ws_core:planks_dead",		-- crafting component
								-- groups (automaticaly gets slab/stair group)
	{choppy = 3, flammable = 2},
	{"ws_planks_dead.png"},		-- {tile definition 1, def2, def3, def4, def5, def6}
	"Dead Wood Stair",			-- stairs name
	"Dead Wood Slab",			-- slab name
	nil,						-- sound specification
	true						-- world alignment
)

stairs.register_stair_and_slab(
	"planks_oak",
	"ws_core:planks_oak",
	{choppy = 3, flammable = 2},
	{"ws_planks_oak.png"},
	"Oak Wood Stair",
	"Oak Wood Slab",
	nil,
	true
)

stairs.register_stair_and_slab(
	"planks_balsa",
	"ws_core:planks_balsa",
	{choppy = 3, flammable = 2},
	{"ws_planks_balsa.png"},
	"Balsa Wood Stair",
	"Balsa Wood Slab",
	nil,
	true
)

stairs.register_stair_and_slab(
	"planks_old",
	"ws_core:planks_old",
	{choppy = 3, flammable = 2},
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
	groups = {choppy = 3, flammable = 2},

	material = "ws_core:planks_dead",
	texture = "ws_planks_dead.png",
})

ws_core.register_fence("ws_core:fence_oak", {
	description = "Oak Wood Fence",
	groups = {choppy = 3, flammable = 2},

	material = "ws_core:planks_oak",
	texture = "ws_planks_oak.png",
})

ws_core.register_fence("ws_core:fence_balsa", {
	description = "Balsa Wood Fence",
	groups = {choppy = 3, flammable = 2},

	material = "ws_core:planks_balsa",
	texture = "ws_planks_balsa.png",
})

ws_core.register_fence("ws_core:fence_old", {
	description = "Old Wood Fence",
	groups = {choppy = 3, flammable = 2},

	material = "ws_core:planks_old",
	texture = "ws_planks_old.png",
})



-- =====================
-- STONE SLABS AND STAIRS
-- =====================

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

stairs.register_stair_and_slab(
	"stonebrick",
	"ws_core:stonebrick",
	{cracky = 3},
	{"ws_stonebrick.png"},
	"Stone Brick Stair",
	"Stone Brick Slab",
	nil,
	true
)

stairs.register_stair_and_slab(
	"shingle_brown",
	"ws_core:shingle_brown",
	{cracky = 3},
	{"ws_shingles_brown.png"},
	"Brown Shingle Stair",
	"Brown Shingle Slab",
	nil,
	true
)

stairs.register_stair_and_slab(
	"shingle_gray",
	"ws_core:shingle_gray",
	{cracky = 3},
	{"ws_shingles_gray.png"},
	"Gray Shingle Stair",
	"Gray Shingle Slab",
	nil,
	true
)

-- =====
-- WALLS
-- =====

ws_core.register_wall("ws_core:wall_cobble", {
	description = "Cobblestone wall",
	groups = {cracky = 3},

	material = "ws_core:cobble",
	tiles = {"ws_cobble.png"},
})

ws_core.register_wall("ws_core:wall_stonebrick", {
	description = "Stonebrick wall",
	groups = {cracky = 3},

	material = "ws_core:stonebrick",
	tiles = {"ws_stonebrick.png"},
})