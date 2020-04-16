minetest.register_node("derilict_building:fan_large_plain", {
  description = "large fan",
  drawtype = "mesh",
  mesh = "derilict_building_fan_large.obj",
  tiles = {"derilict_building_fan_large_plain.png"},
  paramtype  = "light",
  paramtype2 = "facedir",
  groups = {cracky = 2},
  selection_box = {
    type = "fixed",
    fixed = {
          {-0.5, -0.5,-0.50, 0.50,  1.5, 1.5},
      }
  },
  collision_box = {
    type = "fixed",
    fixed = {
          {-0.50, -0.5,-0.50, 0.50,  1.5, 1.5},
      }
  },
  sounds = ws_core and ws_core.node_sound_metal_ws_cores(),
})

minetest.register_node("derilict_building:fan_large_rusted", {
  description = "large rusted fan",
  drawtype = "mesh",
  mesh = "derilict_building_fan_large.obj",
  tiles = {"derilict_building_fan_large_rusted.png"},
  paramtype  = "light",
  paramtype2 = "facedir",
  groups = {cracky = 2},
  selection_box = {
    type = "fixed",
    fixed = {
          {-0.5, -0.5,-0.50, 0.50,  1.5, 1.5},
      }
  },
  collision_box = {
    type = "fixed",
    fixed = {
          {-0.50, -0.5,-0.50, 0.50,  1.5, 1.5},
      }
  },
  sounds = ws_core and ws_core.node_sound_metal_ws_cores(),
})
