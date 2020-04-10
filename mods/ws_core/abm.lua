local function overcrowded(pos)
	local pos_min = vector.add(pos,vector.new(-1,-1,-1))
	local pos_max = vector.add(pos,vector.new(1,1,1))
	return #minetest.find_nodes_in_area(pos_min, pos_max, "ws_core:gorse") > 1
end

minetest.register_abm({
	label = "Spread Gorse",
	nodenames = {"ws_core:gorse"},
	neighbors = {"ws_core:clay_dirt"},
	interval = 10,
	chance = 12,
	catch_up = false,
	action = function(pos)
		local pos1 = vector.add(pos,vector.new(-1,-1,-1))
		local pos2 = vector.add(pos,vector.new(1,1,1))
		local nodes = minetest.find_nodes_in_area_under_air(pos1, pos2, {"ws_core:clay_dirt"})
		for _,p in pairs(nodes) do
			if p then
				if math.random() < 0.125 and not overcrowded(p) then
					minetest.set_node(vector.add(p,vector.new(0,1,0)), {name = "ws_core:gorse"})
				end
			end
		end
	end,
})
