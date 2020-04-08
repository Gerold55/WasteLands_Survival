max_line_length = false

ignore = {
	--setting a read-only field of a global variable
	"122",
	--setting and acessing undefined fields of global variables
	"14.",
	--unused variables and arguments
	"21.",
	--setting and never acessing variables
	"23.",
	--whitespace
	"61."
}

read_globals = {
	-- minetest
	"minetest",
	"dump", "dump2","vector",
	"creative",
	"ItemStack",
	"PcgRandom","PseudoRandom",
	"VoxelManip", "VoxelArea",
	math = { fields = {"sign"} },
	table = { fields = {"copy"} },
	-- mod checks
	"cmi",
	"default",
	"intllib",
	"invisibility",
	"lightning",
	"lucky_block",
	"sfinv_buttons",
	"stairsplus",
	"tnt",
	"toolranks",
	"unified_inventory",
}

allow_defined_top = true

exclude_files = {"mods/modutil/LuaVenusCompiler/testout/"}
