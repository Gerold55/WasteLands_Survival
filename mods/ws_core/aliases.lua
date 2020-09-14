-- mods/ws_core/aliases.lua

-- Aliases to support loading worlds using nodes following the old naming convention
-- These can also be helpful when using chat commands, for example /giveme
minetest.register_alias("stone", "ws_core:stone")
minetest.register_alias("stone_with_coal", "ws_core:stone_with_coal")
minetest.register_alias("stone_with_iron", "ws_core:stone_with_iron")
minetest.register_alias("dirt_with_grass", "ws_core:dirt_dry")
minetest.register_alias("dirt_with_grass_footsteps", "ws_core:dirt_dry")
minetest.register_alias("dirt", "ws_core:dirt_dry")
minetest.register_alias("sand", "ws_core:sandy_dirt")
minetest.register_alias("gravel", "ws_core:gravel")
minetest.register_alias("clay", "ws_core:clay")
minetest.register_alias("wooden_fence", "ws_core:fence_wood")
minetest.register_alias("rail", "carts:rail")

minetest.register_alias("cobble", "ws_core:cobble")

minetest.register_alias("Stick", "ws_core:stick")
minetest.register_alias("lump_of_coal", "ws_core:coal")
minetest.register_alias("lump_of_clay", "ws_core:clay_lump")


-- Aliases to items from default for compatibility with mods which expect them
minetest.register_alias("default:stick", "ws_core:stick")
minetest.register_alias("default:clay_lump", "ws_core:clay_lump")
minetest.register_alias("default:gold_ingot", "ws_core:gold_ingot")

minetest.register_alias("default:dirt", "ws_core:dirt")
minetest.register_alias("default:stone", "ws_core:stone")
minetest.register_alias("default:stonebrick", "ws_core:stonebrick")
minetest.register_alias("default:obsidian", "ws_core:basalt")
minetest.register_alias("default:glass", "ws_core:glass")
minetest.register_alias("default:chest", "ws_core:barrel")
minetest.register_alias("default:furnace", "ws_core:furnace_bottom")
