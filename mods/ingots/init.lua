--[[
	Ingots - allows the placemant of ingots in the world
	Copyright (C) 2018  Skamiz Kazzarch

	This library is free software; you can redistribute it and/or
	modify it under the terms of the GNU Lesser General Public
	License as published by the Free Software Foundation; either
	version 2.1 of the License, or (at your option) any later version.

	This library is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
	Lesser General Public License for more details.

	You should have received a copy of the GNU Lesser General Public
	License along with this library; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
]]--

ingots = {}

local conf = dofile(minetest.get_modpath("ingots").."/conf.lua")
dofile(minetest.get_modpath("ingots").."/api.lua")

--Here you can make individual choices per ingot on which varian will be used.
--To disable the ability of an ingot to be placed just comment out it's registration line.

if minetest.get_modpath("ws_core") then
		ingots.register_ingots("ws_core:copper_ingot", "ingot_copper.png", conf.is_big)
		ingots.register_ingots("ws_core:tin_ingot", "ingot_tin.png", conf.is_big)
		ingots.register_ingots("ws_core:bronze_ingot", "ingot_bronze.png", conf.is_big)
		ingots.register_ingots("ws_core:steel_ingot", "ingot_steel.png", conf.is_big)
		ingots.register_ingots("ws_core:gold_ingot", "ingot_gold.png", conf.is_big)
end

if minetest.get_modpath("ws_core") then
		ingots.register_ingots("factory:silver_ingot", "ingot_silver.png", conf.is_big)
		ingots.register_ingots("factory:zinc_ingot", "ingot_zinc.png", conf.is_big)
end