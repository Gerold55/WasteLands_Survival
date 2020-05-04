local vent_panel = {
  { -1/2, -1/2, -1/8,  1/2,  1/2,  1/8},
}

minetest.register_node("derilict_building:vent", {
  description = "vent",
  drawtype = "nodebox",
  selection_box = {
    type = "fixed",
    fixed = vent_panel,
  },
  node_box = {
    type = "fixed",
    fixed = vent_panel,
  },
  paramtype = "light",
  paramtype2 = "facedir",
  groups = {
    --when you thrust an axe into it it'll come off
    choppy=2,
    --hacking it with a pickaxe can also open it
    cracky=3,
    --pulling it off with your hands is also possible 
    oddly_breakable_by_hand=1
  },
  tiles = {"derilict_building_steel.png", "derilict_building_steel.png", --left, right
    "derilict_building_steel.png", "derilict_building_steel.png", --top, bottom
    "derilict_building_steel.png^derilict_building_vent_slits.png", --front
    "derilict_building_steel.png^derilict_building_vent_slits.png" --back
  },
  is_ground_content = false,
  sounds = ws_core and ws_core.node_sound_metal_defaults(),
})

---
--TODO: craft
--maybe work a plate/sheet at a special crafting station
