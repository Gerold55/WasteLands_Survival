local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

ruins = {}

dofile(modpath..'/nodes.lua')
dofile(modpath..'/nodes_extra.lua')

dofile(modpath.."/large_fans.lua")
dofile(modpath.."/panel_walls.lua")

dofile(modpath..'/loot.lua')
dofile(modpath..'/structures.lua')


--TODO: craft for vents
--maybe work a plate/sheet at a special crafting station

--TODO: girder: craft t-shape out of bars
