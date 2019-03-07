-- mods/ws_core/legacy.lua

-- Horrible stuff to support old code registering falling nodes
-- Don't use this and never do what this does, it's completely wrong!
-- (More specifically, the client and the C++ code doesn't get the group)
function ws_core.register_falling_node(nodename, texture)
	minetest.log("error", debug.traceback())
	minetest.log('error', "WARNING: ws_core.register_falling_node is deprecated")
	if minetest.registered_nodes[nodename] then
		minetest.registered_nodes[nodename].groups.falling_node = 1
	end
end

function ws_core.spawn_falling_node(p, nodename)
	spawn_falling_node(p, nodename)
end

-- Formspecs
ws_core.gui_suvival_form = ws_core.gui_survival_form

-- Players
if minetest.get_modpath("player_api") then
	ws_core.registered_player_models = player_api.registered_models
	ws_core.player_register_model    = player_api.register_model
	ws_core.player_attached          = player_api.player_attached
	ws_core.player_get_animation     = player_api.get_animation
	ws_core.player_set_model         = player_api.set_model
	ws_core.player_set_textures      = player_api.set_textures
	ws_core.player_set_animation     = player_api.set_animation
end

-- Check for a volume intersecting protection
function ws_core.intersects_protection(minp, maxp, player_name, interval)
	minetest.log("warning", "ws_core.intersects_protection() is " ..
		"deprecated, use minetest.is_area_protected() instead.")
	minetest.is_area_protected(minp, maxp, player_name, interval)
end
