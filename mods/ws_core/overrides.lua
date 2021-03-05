if minetest.get_modpath("factory") then
	minetest.registered_nodes["factory:storage_tank_water"].special_tiles[1].name = "ws_water_source_animated.png"
	minetest.registered_nodes["factory:storage_tank_lava"].special_tiles[1].name = "ws_lava_source_animated.png"
end
