-- Canteen code by Bug_Rat aka Stix

local canteen_wear_per_thirst = 3275 -- 65500 / 20

minetest.register_tool("thirst:canteen", {
    description = "Canteen",
    inventory_image = "thirst_canteen.png",
    liquids_pointable = true,
    on_use = function(itemstack, user)

        local wear = itemstack:get_wear()
        local name = user:get_player_name()
        local pthirst = thirst.get_player_thirst(name)
        local amount = thirst.max_thirst - pthirst
        local wear_needed = amount * canteen_wear_per_thirst

        if wear_needed > (65500 - wear) then
            wear_needed = (65500 - wear) - ((65500 - wear) % canteen_wear_per_thirst)
            amount = wear_needed / canteen_wear_per_thirst
        end

        if itemstack:get_wear() < 65500 then                
            thirst.decrease_thirst(name, amount) 
            itemstack:add_wear(wear_needed)
            return itemstack
        end
    end,

    on_place = function(itemstack, placer, pointed_thing)
        local pos = minetest.get_pointed_thing_position(pointed_thing, false)
        if pos then
            local node = minetest.get_node_or_nil(pos)
            if node then
                if node.name == "ws_core:water_source" then
                    itemstack:set_wear(1)
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
                    if thirst.get_player_thirst(name) < thirst.max_thirst then
                        thirst.decrease_thirst(name, 4)
                        itemstack:add_wear(8000)
                        return itemstack
                    end
                end
            end
        end
    end,
})
