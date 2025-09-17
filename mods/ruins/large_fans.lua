-- Direction vectors based on node facing direction (param2 values)
local fdir_to_front = {
    {x = 0, z = 1},   -- 0: Facing South
    {x = 1, z = 0},   -- 1: Facing East
    {x = 0, z = -1},  -- 2: Facing North
    {x = -1, z = 0}   -- 3: Facing West
}

-- Function to check if there's an obstruction where the wall should be
local function check_wall(pos, length, height)
    local node = minetest.get_node(pos)
    local fdir = node.param2
    local front = fdir_to_front[fdir + 1] -- Get front direction based on facing

    -- Calculate max x, y, and z based on direction and wall dimensions
    local maxx = pos.x + front.x * length
    local maxy = pos.y + height
    local maxz = pos.z + front.z * length

    -- Calculate minimum x and z coordinates for loop bounds
    local minx = math.min(pos.x, maxx)
    local minz = math.min(pos.z, maxz)

    -- Loop through the area to check for obstructions
    for x = minx, math.max(pos.x, maxx) do
        for y = pos.y, maxy do
            for z = minz, math.max(pos.z, maxz) do
                local cpos = {x = x, y = y, z = z}
                local node_at_pos = minetest.get_node(cpos)
                local node_def = minetest.registered_nodes[node_at_pos.name]

                -- Check if the current node is not air or buildable
                if not node_def or not node_def.buildable_to then
                    -- Exclude the starting position of the fan itself
                    if not vector.equals(pos, cpos) then
                        return true -- Obstruction found
                    end
                end
            end
        end
    end

    return false -- No obstruction found
end

-- Function to register fan nodes with given parameters
local function register_fan_node(name, description, texture, mesh)
    minetest.register_node(name, {
        description = description,
        drawtype = "mesh",
        mesh = mesh,
        tiles = {texture}, -- Texture for the fan
        paramtype = "light",
        paramtype2 = "facedir", -- Allows the node to face different directions
        groups = {cracky = 2}, -- Group definition for mining difficulty
        selection_box = {
            type = "fixed",
            fixed = {-0.5, -0.5, -0.5, 0.5, 1.5, 1.5}, -- Defines selection box
        },
        collision_box = {
            type = "fixed",
            fixed = {-0.5, -0.5, -0.5, 0.5, 1.5, 1.5}, -- Defines collision box
        },
        sounds = ws_core and ws_core.node_sound_metal_defaults(), -- Metal sound if `ws_core` is present
        after_place_node = function(pos, placer, itemstack)
            -- Remove the node if there's an obstruction
            if check_wall(pos, 1, 1) then
                minetest.set_node(pos, {name = "air"}) -- Replace the fan with air
                return true
            end
        end,
    })
end

-- Register fan nodes with different textures (plain and rusted)
register_fan_node("ruins:fan_large_plain", "Large Fan", "ruins_fan_large_plain.png", "ruins_fan_large.obj")
register_fan_node("ruins:fan_large_rusted", "Large Rusted Fan", "ruins_fan_large_rusted.png", "ruins_fan_large.obj")
