-- Function to check if creative mode is enabled for the player
local function is_creative_enabled_for(player_name)
    local privs = minetest.get_player_privs(player_name)
    return privs and privs.creative == true
end

-- Register the creative tool (Instant Breaker)
minetest.register_tool("creative:instant_breaker", {
    description = "Instant Block Breaker (Creative Only)",
    inventory_image = "instant_breaker.png",  -- Make sure to add a texture for the tool in your mod's textures folder

    -- When the tool is used on a block, break the block instantly
    on_use = function(itemstack, user, pointed_thing)
        -- Check if the pointed_thing is a node (a block)
        if pointed_thing.type == "node" then
            local player_name = user:get_player_name()

            -- Check if the player is in creative mode
            if is_creative_enabled_for(player_name) then
                -- Get the position of the node being pointed at
                local pos = pointed_thing.under
                local node = minetest.get_node(pos)

                -- Break the block (simulate breaking without needing a tool)
                minetest.node_dig(pos, node, user, ItemStack())
            else
                minetest.chat_send_player(player_name, "You must be in Creative mode to use this tool.")
            end
        end
        return itemstack
    end,
})

-- Give the tool to players in creative mode when they join
minetest.register_on_joinplayer(function(player)
    local player_name = player:get_player_name()

    -- Check if the player is in creative mode
    if is_creative_enabled_for(player_name) then
        -- Give the creative tool to the player
        player:get_inventory():add_item("main", "creative:instant_breaker")
    end
end)
