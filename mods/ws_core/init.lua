-- Minetest 0.4 mod: ws_core
-- See README.txt for licensing and other information.

-- The API documentation in here was moved into game_api.txt

-- Definitions made by this mod that other mods can use too
ws_core = {}

ws_core.LIGHT_MAX = 14

function ws_core.get_hotbar_bg(x,y)
	local out = ""
	for i=0,7,1 do
		out = out .."image["..x+i..","..y..";1,1;gui_hb_bg.png]"
	end
	return out
end

ws_core.gui_survival_form = "size[8,8.5]"..
			"list[current_player;main;0,4.25;8,1;]"..
			"list[current_player;main;0,5.5;8,3;8]"..
			"list[current_player;craft;1.75,0.5;2,2;]"..
			"list[current_player;craftpreview;5.75,1.5;1,1;]"..
			"image[4.75,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]"..
			"listring[current_player;main]"..
			"listring[current_player;craft]"..
			ws_core.get_hotbar_bg(0,4.25)

if minetest.global_exists("player_api") then
	minetest.register_on_joinplayer(function(player)
		--set the players skin
		player_api.set_textures(player, {"ws_survivor.png"})
	end)
end

-- Load files
local ws_core_path = minetest.get_modpath("ws_core")

dofile(ws_core_path.."/skybox.lua")
dofile(ws_core_path.."/abm.lua")
dofile(ws_core_path.."/functions.lua")
dofile(ws_core_path.."/sounds.lua")
dofile(ws_core_path.."/nodes.lua")
dofile(ws_core_path.."/item_entity.lua")
dofile(ws_core_path.."/chatcommands.lua")
dofile(ws_core_path.."/craftitems.lua")
dofile(ws_core_path.."/crafting.lua")
dofile(ws_core_path.."/mapgen.lua")
dofile(ws_core_path.."/aliases.lua")
dofile(ws_core_path.."/trees.lua")
dofile(ws_core_path.."/tools.lua")
dofile(ws_core_path.."/storage.lua")
dofile(ws_core_path.."/nodes_extra.lua")
dofile(ws_core_path.."/furnace.lua")
