-- Register the inactive generator
minetest.register_node("techlines_generator:generator_off", {
    description = "Coal Generator (Inactive)",
    tiles = {"techlines_generator_off.png"},
    groups = {cracky = 3, mesecon_receptor_off = 1},
    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        local item = itemstack:get_name()
        if item == "ws_core:coal_lump" then
            -- Consume the coal
            itemstack:take_item()
            minetest.swap_node(pos, {name = "techlines_generator:generator_on"})
            minetest.get_node_timer(pos):start(30) -- Burn for 30 seconds
            return itemstack
        else
            minetest.chat_send_player(clicker:get_player_name(), "Insert coal to power the generator!")
        end
    end,
})

-- Register the active generator
minetest.register_node("techlines_generator:generator_on", {
    description = "Coal Generator (Active)",
    tiles = {"techlines_generator_on.png"},
    groups = {cracky = 3, mesecon_receptor_on = 1, not_in_creative_inventory = 1},
    drop = "techlines_generator:generator_off",
    light_source = 5, -- Emit light when active
    mesecons = {
        receptor = {
            state = mesecon.state.on
        }
    },
    on_timer = function(pos)
        -- Burn fuel for 30 seconds, then stop
        minetest.swap_node(pos, {name = "techlines:generator_off"})
        mesecon.receptor_off(pos)
    end,
})

-- Register crafting recipe for the generator
minetest.register_craft({
    output = "techlines_generator:generator_off",
    recipe = {
        {"ws_core:steel_ingot", "ws_core:coal_lump", "ws_core:steel_ingot"},
        {"ws_core:steel_ingot", "ws_core:furnace", "ws_core:steel_ingot"},
        {"", "ws_core:steel_ingot", ""},
    },
})
