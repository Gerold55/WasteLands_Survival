-- Function to register a metal panel node with given properties
local function register_metal_panel(name, description, tiles, sounds, material)
    minetest.register_node(name, {
        description = description,
        drawtype = "nodebox",
        node_box = {
            type = "connected",
            fixed =              {-1/8, -1/2, -1/8,  1/8,  1/2,  1/8},   -- Fixed part of the node
            disconnected_sides = {-1/2, -1/2, -1/8,  1/2,  1/2,  1/8},   -- Disconnected sides
            connect_front =      {-1/8, -1/2, -1/2,  1/8,  1/2, -1/8},   -- Connects to front
            connect_left =       {-1/2, -1/2, -1/8, -1/8,  1/2,  1/8},   -- Connects to left
            connect_back =       {-1/8, -1/2,  1/8,  1/8,  1/2,  1/2},   -- Connects to back
            connect_right =      { 1/8, -1/2, -1/8,  1/2,  1/2,  1/8},   -- Connects to right
        },
        connects_to = { "group:wall", "group:cracky" },   -- Define what this node can connect to
        paramtype = "light",                             -- Allows light to pass through nodes (lighting)
        is_ground_content = false,                       -- Not generated as ground content
        tiles = tiles,                                   -- Texture for the node
        walkable = true,                                 -- Can be walked on
        groups = { choppy = 3, cracky = 2, wall = 1, level = 2 },  -- Node groups
        sounds = sounds,                                 -- Sound properties of the node
        drop = {
            max_items = 1,
            items = {
                material and {                             -- If material is provided, drop material
                    tools = {"group:pickaxe"},             -- Requires pickaxe to drop
                    items = {material .. " 6"},            -- Drop 6 of the material
                } or {                                     -- Otherwise, drop the node itself
                    items = {name},
                }
            }
        }
    })

    -- Register crafting recipe if material is provided
    if material then
        minetest.register_craft({
            output = name .. " 6",   -- Output 6 panels
            recipe = {
                { "", "", "" },      -- Empty row
                { material, material, material },   -- Second row: 3 materials
                { material, material, material },   -- Third row: 3 materials
            }
        })
    end
end

-- Define sounds for metal panels (if ws_core is available)
local metal_sounds = ws_core and ws_core.node_sound_metal_defaults()

-- Register different metal panels
register_metal_panel("ruins:metal_panel_shiny", "Shiny Metal Panel", {"ruins_steel.png"}, metal_sounds, nil)
register_metal_panel("ruins:metal_panel_dark", "Dark Metal Panel", {"ruins_steel_dark.png"}, metal_sounds, nil)
register_metal_panel("ruins:metal_panel_rusted", "Rusty Metal Panel", {"ruins_copper_rusty.png"}, metal_sounds, nil)
