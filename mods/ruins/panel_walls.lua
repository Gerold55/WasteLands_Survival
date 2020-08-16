local function register_metal_panel(name, description, tiles, sounds, material)
  minetest.register_node(name, {
    description = description,
    drawtype = "nodebox",
    node_box = {
      type = "connected",
      fixed =              {-1/8,-1/2,-1/8, 1/8, 1/2, 1/8},
      disconnected_sides = {-1/2,-1/2,-1/8, 1/2, 1/2, 1/8},
      connect_front =      {-1/8,-1/2,-1/2, 1/8, 1/2,-1/8},
      connect_left =       {-1/2,-1/2,-1/8,-1/8, 1/2, 1/8},
      connect_back =       {-1/8,-1/2, 1/8, 1/8, 1/2, 1/2},
      connect_right =      { 1/8,-1/2,-1/8, 1/2, 1/2, 1/8},
    },
    connects_to = { "group:wall", "group:cracky" },
    paramtype = "light",
    is_ground_content = false,
    tiles = tiles,
    walkable = true,
    groups = { choppy = 3, cracky = 2, wall = 1, level = 2 },
    sounds = sounds,
    drop =  {
      max_items = 1,
      items = {
        material and {
          tools = {"group:pickaxe"},
          items = {material .. " 6"},
        },
        {
          items = {name},
        }
      }
    }
  })

  if material then
    minetest.register_craft({
      output = name .. " 6",
      recipe = {
        { "", "", "" },
        { material, material, material},
        { material, material, material},
      }
    })
  end

end

local metal_sounds = ws_core and ws_core.node_sound_metal_defaults()

register_metal_panel("ruins:metal_panel_shiny", "Shiny Metal Panel", {"ruins_steel.png"}, metal_sounds, nil)
register_metal_panel("ruins:metal_panel_dark", "Dark Metal Panel", {"ruins_steel_dark.png"}, metal_sounds, nil)
register_metal_panel("ruins:metal_panel_rusted", "Rusty Metal Panel", {"ruins_copper_rusty.png"}, metal_sounds, nil)
