-- =====================
-- WOOD SLABS AND STAIRS
-- =====================

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
	"mossycobble",
	"ws_core:mossycobble",
	{cracky = 3},
	{"ws_mossycobble.png"},
	"Mossy Cobblestone Stair",
	"Mossy Cobblestone Slab",
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
	description = "Cobblestone Wall",
	groups = {cracky = 3},

	material = "ws_core:cobble",
	tiles = {"ws_cobble.png"},
})

ws_core.register_wall("ws_core:wall_mossycobble", {
	description = "Mossy Cobblestone Wall",
	groups = {cracky = 3},

	material = "ws_core:mossycobble",
	tiles = {"ws_mossycobble.png"},
})

ws_core.register_wall("ws_core:wall_stonebrick", {
	description = "Stonebrick Wall",
	groups = {cracky = 3},

	material = "ws_core:stonebrick",
	tiles = {"ws_stonebrick.png"},
})
