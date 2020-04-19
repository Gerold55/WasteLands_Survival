local girder_nodebox = {
  { -3/8, -1/2, -1/2,  3/8, -3/8,  1/2},
  { -3/8,  3/8, -1/2,  3/8,  1/2,  1/2},
  { -1/8,  3/8, -1/2,  1/8, -3/8,  1/2},
}

minetest.register_node("derilict_building:girder", {
  description = "steel girder",
  drawtype = "nodebox",
  selection_box = {
    type = "fixed",
    fixed = girder_nodebox,
  },
  node_box = {
    type = "fixed",
    fixed = girder_nodebox,
  },
  paramtype = "light",
  paramtype2 = "facedir",
  groups = {cracky=1, level = 2},
  tiles = {"derilict_building_steel_red.png"},
  is_ground_content = false,
  sounds = ws_core and ws_core.node_sound_metal_defaults(),
})

--TODO: craft t-shape out of bars
