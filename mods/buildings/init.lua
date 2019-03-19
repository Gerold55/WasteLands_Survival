buildings = {}

buildings.box = {
	slab_y = function(height, shift)
		return {-0.5, -0.5 + (shift or 0), -0.5, 0.5, -0.5 + height +
			(shift or 0), 0.5}
	end,
}

buildings.nodebox = {
	regular = {type="regular"},
	null = {type="fixed", fixed={0,0,0,0,0,0}}
}

local ws_core_path = minetest.get_modpath("buildings")

dofile(ws_core_path.."/nodes.lua")