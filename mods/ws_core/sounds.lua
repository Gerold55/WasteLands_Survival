
-- A bunch of default sound tables
 -- note: we don't actualy have any of the sound files

function ws_core.node_sound_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "", gain = 1.0}
	table.dug = table.dug or
			{name = "ws_core_dug_node", gain = 0.25}
	table.place = table.place or
			{name = "ws_core_place_node_hard", gain = 1.0}
	return table
end

function ws_core.node_sound_stone_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "ws_core_hard_footstep", gain = 0.3}
	table.dug = table.dug or
			{name = "ws_core_hard_footstep", gain = 1.0}
	ws_core.node_sound_defaults(table)
	return table
end

function ws_core.node_sound_dirt_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "ws_dirt", gain = 0.4}
	table.dug = table.dug or
			{name = "ws_dirt", gain = 1.0}
	table.place = table.place or
			{name = "ws_core_place_node", gain = 1.0}
	ws_core.node_sound_defaults(table)
	return table
end

function ws_core.node_sound_sand_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "ws_core_sand_footstep", gain = 0.12}
	table.dug = table.dug or
			{name = "ws_core_sand_footstep", gain = 0.24}
	table.place = table.place or
			{name = "ws_core_place_node", gain = 1.0}
	ws_core.node_sound_defaults(table)
	return table
end

function ws_core.node_sound_gravel_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "ws_core_gravel_footstep", gain = 0.4}
	table.dug = table.dug or
			{name = "ws_core_gravel_footstep", gain = 1.0}
	table.place = table.place or
			{name = "ws_core_place_node", gain = 1.0}
	ws_core.node_sound_defaults(table)
	return table
end

function ws_core.node_sound_wood_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "ws_tree_break.1", gain = 0.3}
	table.dug = table.dug or
			{name = "ws_tree_break.1", gain = 1.0}
	ws_core.node_sound_defaults(table)
	return table
end

function ws_core.node_sound_leaves_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "ws_core_grass_footstep", gain = 0.45}
	table.dug = table.dug or
			{name = "ws_core_grass_footstep", gain = 0.7}
	table.place = table.place or
			{name = "ws_core_place_node", gain = 1.0}
	ws_core.node_sound_defaults(table)
	return table
end

function ws_core.node_sound_glass_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "ws_core_glass_footstep", gain = 0.3}
	table.dig = table.dig or
			{name = "ws_core_glass_footstep", gain = 0.5}
	table.dug = table.dug or
			{name = "ws_core_break_glass", gain = 1.0}
	ws_core.node_sound_defaults(table)
	return table
end

function ws_core.node_sound_metal_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "ws_core_metal_footstep", gain = 0.4}
	table.dig = table.dig or
			{name = "ws_core_dig_metal", gain = 0.5}
	table.dug = table.dug or
			{name = "ws_core_dug_metal", gain = 0.5}
	table.place = table.place or
			{name = "ws_core_place_node_metal", gain = 0.5}
	ws_core.node_sound_defaults(table)
	return table
end

function ws_core.node_sound_water_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "ws_water", gain = 0.2}
	ws_core.node_sound_defaults(table)
	return table
end

function ws_core.node_sound_snow_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "ws_core_snow_footstep", gain = 0.2}
	table.dig = table.dig or
			{name = "ws_core_snow_footstep", gain = 0.3}
	table.dug = table.dug or
			{name = "ws_core_snow_footstep", gain = 0.3}
	table.place = table.place or
			{name = "ws_core_place_node", gain = 1.0}
	ws_core.node_sound_defaults(table)
	return table
end
