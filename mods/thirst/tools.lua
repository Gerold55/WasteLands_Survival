-- Canteen code by Bug_Rat aka Stix

minetest.register_tool("thirst:canteen", {
    description = "Canteen",
    inventory_image = "thirst_canteen.png",
    liquids_pointable = true,
    on_use = function(itemstack, user)
        if itemstack:get_wear() < 65500 then
            if thirst.get_player_thirst(user:get_player_name()) < 20 then                   
                thirst.decrease_thirst(user:get_player_name(), 5) 
                itemstack:add_wear(16383)
                return itemstack
            end
        end
    end,

    on_place = function(itemstack, placer, pointed_thing)
        local pos = minetest.get_pointed_thing_position(pointed_thing, false)
        if pos then
            local node = minetest.get_node_or_nil(pos)
            if node then
                if node.name == "ws_core:water_source" then
                    itemstack:set_wear(0)
                    return itemstack
                end
            end
        end
    end,            
})

minetest.register_tool("thirst:straw", {
    description = "Filtering Straw",
    inventory_image = "thirst_straw.png",
    liquids_pointable = true,
    on_use = function(itemstack, user, pointed_thing)
        local pos = minetest.get_pointed_thing_position(pointed_thing, false)
        if pos then
            local node = minetest.get_node_or_nil(pos)
            if node then
                if node.name == "ws_core:water_source_toxic" then
                    local name = user:get_player_name()
                    if thirst.get_player_thirst(name) < 20 then
                        thirst.decrease_thirst(name, 4)
                        itemstack:add_wear(8000)
                        return itemstack
                    end
                end
            end
        end
    end,
})
