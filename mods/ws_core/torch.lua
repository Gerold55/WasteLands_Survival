-- Table to track temporary light nodes
local temporary_lights = {}

-- Update light emission when carrying the torch
minetest.register_globalstep(function(dtime)
    local new_temporary_lights = {}

    for _, player in ipairs(minetest.get_connected_players()) do
        local wielded_item = player:get_wielded_item():get_name()
        local player_name = player:get_player_name()
        local pos = player:get_pos()

        -- Remove existing light node if no torch is being wielded
        if temporary_lights[player_name] and wielded_item ~= "ws_core:torch" then
            local old_pos = temporary_lights[player_name]
            if old_pos then
                minetest.remove_node(old_pos)
            end
            temporary_lights[player_name] = nil
        end

        -- Add a light node if the player is wielding a torch
        if wielded_item == "ws_core:torch" and pos then
            -- Round position to prevent excessive node updates
            local light_pos = vector.round({x = pos.x, y = pos.y + 1, z = pos.z})

            -- Only place a new light node if the position has changed
            if temporary_lights[player_name] ~= light_pos then
                -- Remove the old light node
                if temporary_lights[player_name] then
                    minetest.remove_node(temporary_lights[player_name])
                end

                -- Place the new light node
                minetest.set_node(light_pos, {name = "ws_core:temporary_light"})
                temporary_lights[player_name] = light_pos
                new_temporary_lights[light_pos] = true
            end
        end
    end

    -- Clean up any leftover temporary light nodes
    for pos, _ in pairs(temporary_lights) do
        if not new_temporary_lights[pos] then
            minetest.remove_node(pos)
        end
    end

    -- Update the tracking table
    temporary_lights = new_temporary_lights
end)

-- Register the temporary light node
minetest.register_node("ws_core:temporary_light", {
    description = "Temporary Light",
    drawtype = "airlike",
    paramtype = "light",
    sunlight_propagates = true,
    light_source = 10,
    walkable = false,
    pointable = false,
    diggable = false,
    buildable_to = true,
    groups = {not_in_creative_inventory = 1},
})
