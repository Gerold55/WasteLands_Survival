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
  on_place = function(itemstack, placer, pointed_thing)
    if pointed_thing.type ~= "node" then
      return itemstack
    end

    return minetest.rotate_and_place(itemstack, placer, pointed_thing)
  end,
})

minetest.register_node("derilict_building:girder_rusty", {
  description = "rusty steel girder",
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
  tiles = {"derilict_building_steel_red_rusty.png"},
  is_ground_content = false,
  sounds = ws_core and ws_core.node_sound_metal_defaults(),
  on_place = function(itemstack, placer, pointed_thing)
    if pointed_thing.type ~= "node" then
      return itemstack
    end

    return minetest.rotate_and_place(itemstack, placer, pointed_thing)
  end,
})

--TODO: craft t-shape out of bars
