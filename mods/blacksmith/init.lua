minetest.register_node("blacksmith:smeltery", {
    description = "Smeltery",
    tiles = {
        "blacksmith_smeltery_top.png",
        "blacksmith_smeltery_bottom.png",
        "blacksmith_smeltery_side.png",
        "blacksmith_smeltery_side.png",
        "blacksmith_smeltery_side.png",
        "blacksmith_smeltery_side.png",
    },
    groups = {cracky=3},
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
        }
    },
    on_rightclick = function(pos, node, player, itemstack, pointed_thing)
        local meta = minetest.get_meta(pos)
        minetest.show_formspec(player:get_player_name(), "blacksmith:smeltery_formspec", 
            "size[8,9]" ..
            "list[context;src;0.5,0.5;1,1;]" ..
            "list[context;dst;2,0.5;1,1;]" ..
            "list[context;fuel;4,0.5;1,1;]" ..
            "label[0.5,2;Input]" ..
            "label[2,2;Output]" ..
            "label[4,2;Fuel]" ..
            "button[6,0;2,1;smelt;Smelt]" ..
            "list[current_player;main;0,5;8,4;]")
        return itemstack
    end,
    on_receive_fields = function(pos, formname, fields, player)
        local meta = minetest.get_meta(pos)
        if fields.smelt then
            -- Handle smelting logic
            local inv = meta:get_inventory()
            local src = inv:get_stack("src", 1)
            local fuel = inv:get_stack("fuel", 1)
            local dst = inv:get_stack("dst", 1)
            if src:get_name() == "blacksmith:iron_ore" and fuel:get_name() == "blacksmith:coal_lump" then
                -- Example smelting logic
                src:take_item()
                fuel:take_item()
                dst:add_item("blacksmith:molten_iron")
                inv:set_stack("src", 1, src)
                inv:set_stack("fuel", 1, fuel)
                inv:set_stack("dst", 1, dst)
            end
        end
    end,
})

minetest.register_craft({
    output = "blacksmith:smeltery",
    recipe = {
        {"ws_core:stone", "ws_core:stone", "ws_core:stone"},
        {"ws_core:stone", "ws_core:furnace", "ws_core:stone"},
        {"ws_core:stone", "ws_core:stone", "ws_core:stone"},
    }
})

minetest.register_node("blacksmith:tool_cooler", {
    description = "Tool Cooler",
    tiles = {"blacksmith_tool_cooler.png"},
    groups = {cracky=3},
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
        }
    },
    on_rightclick = function(pos, node, player, itemstack, pointed_thing)
        local meta = minetest.get_meta(pos)
        minetest.show_formspec(player:get_player_name(), "blacksmith:tool_cooler_formspec", 
            "size[8,9]" ..
            "list[context;template;0.5,0.5;1,1;]" ..
            "list[context;cooling;2,0.5;1,1;]" ..
            "label[0.5,2;Template]" ..
            "label[2,2;Cooling]" ..
            "button[4,0.5;2,1;cool;Cool]" ..
            "list[current_player;main;0,5;8,4;]")
        return itemstack
    end,
    on_receive_fields = function(pos, formname, fields, player)
        local meta = minetest.get_meta(pos)
        if fields.cool then
            local inv = meta:get_inventory()
            local template = inv:get_stack("template", 1)
            local cooling = inv:get_stack("cooling", 1)
            if template:get_name() == "blacksmith:tool_template" and cooling:get_name() == "blacksmith:molten_iron" then
                local part_needed = 200 -- Example amount needed for each tool part
                local liquid_amount = tonumber(meta:get_string("liquid_amount")) or 0
                if liquid_amount >= part_needed then
                    cooling:take_item()
                    inv:remove_item("template", "blacksmith:tool_template")
                    inv:add_item("cooling", "blacksmith:tool_part")
                    liquid_amount = liquid_amount - part_needed
                    meta:set_string("liquid_amount", tostring(liquid_amount))
                    inv:set_stack("cooling", 1, cooling)
                end
            end
        end
    end,
})

minetest.register_craft({
    output = "blacksmith:tool_cooler",
    recipe = {
        {"ws_core:iron_ingot", "ws_core:iron_ingot", "ws_core:iron_ingot"},
        {"ws_core:iron_ingot", "ws_core:chest", "ws_core:iron_ingot"},
        {"ws_core:iron_ingot", "ws_core:iron_ingot", "ws_core:iron_ingot"},
    }
})


minetest.register_node("blacksmith:tool_crafting_table", {
    description = "Tool Crafting Table",
    tiles = {"blacksmith_tool_crafting_table.png"},
    groups = {cracky=3},
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
        }
    },
    on_rightclick = function(pos, node, player, itemstack, pointed_thing)
        minetest.show_formspec(player:get_player_name(), "blacksmith:tool_crafting_table_formspec", 
            "size[8,9]" ..
            "list[context;input;0.5,0.5;3,3;]" ..
            "list[context;result;4.5,0.5;1,1;]" ..
            "label[0.5,4;Input]" ..
            "label[4.5,4;Result]" ..
            "button[6,0.5;2,1;craft;Craft]" ..
            "list[current_player;main;0,5;8,4;]")
    end,
    on_receive_fields = function(pos, formname, fields, player)
        if fields.craft then
            local meta = minetest.get_meta(pos)
            local inv = meta:get_inventory()
            local input = inv:get_list("input")
            local result = inv:get_stack("result", 1)
            
            -- Example crafting logic
            local tool_parts = { "blacksmith:tool_handle", "blacksmith:tool_head" }
            local crafted_tool = "blacksmith:tool"

            -- Crafting conditions
            local parts_count = 0
            for _, part in ipairs(tool_parts) do
                if inv:contains_item("input", part) then
                    parts_count = parts_count + 1
                end
            end

            if parts_count == #tool_parts then
                -- Craft the tool
                inv:remove_item("input", tool_parts[1])
                inv:remove_item("input", tool_parts[2])
                result:add_item(crafted_tool)
                inv:set_stack("result", 1, result)
            end
        end
    end,
})

minetest.register_craft({
    output = "blacksmith:tool_crafting_table",
    recipe = {
        {"ws_core:wood", "ws_core:wood", "ws_core:wood"},
        {"ws_core:wood", "ws_core:crafting_table", "ws_core:wood"},
        {"ws_core:wood", "ws_core:wood", "ws_core:wood"},
    }
})


minetest.register_node("blacksmith:molten_iron", {
    description = "Molten Iron",
    drawtype = "liquid",
    tiles = {"ws_molten_iron.png"},
    liquidtype = "source",
    liquid_alternative_node = "blacksmith:molten_iron_source",
    groups = {liquid=3},
})

-- Define source node if necessary
minetest.register_node("blacksmith:molten_iron_source", {
    description = "Molten Iron Source",
    drawtype = "liquid",
    tiles = {"ws_molten_iron.png"},
    liquidtype = "source",
    groups = {liquid=3},
})