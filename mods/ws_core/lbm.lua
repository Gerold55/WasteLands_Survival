minetest.register_lbm({
  label = "Grow cattails in water",
  name = "ws_core:cattail",

  nodenames = {"ws_core:toxic_water_source"},

  run_at_every_load = false,

  action = function(pos, node)
    if math.random(6) == 1 then
      local under = vector.new(pos)
      under.y = under.y - 1
      local node_under = minetest.registered_nodes[minetest.get_node(under).name]

      if node_under and node_under.walkable then
        minetest.set_node(pos, {name = "ws_core:cattail_bottom"})
      end
    end
  end,
})