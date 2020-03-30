minetest.register_abm({
  label = "Spread Gorse",
  nodenames = {"ws_core:gorse"},
  neighbors = {"ws_core:clay_dirt"},
  interval = 1,
  chance = 12,
  catch_up = false,
  action = function(pos)
    local pos1 = vector.add(pos,vector.new(-1,-1,-1))
    local pos2 = vector.add(pos,vector.new(1,1,1))
    local nodes = minetest.find_nodes_in_area_under_air(pos1, pos2, {"ws_core:clay_dirt"})
    for _,p in pairs(nodes) do
      if p then
        if math.random() < 0.125 then
          minetest.set_node(vector.add(p,vector.new(0,1,0)), {name = "ws_core:gorse"})
        end
      end
    end
  end,
})