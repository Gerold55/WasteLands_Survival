local function furnace_top_formspec(percent)
  local formstring = "size[8,8.5]"..
      "list[context;src;1.75,1.5;1,1;]"
  if percent then
    formstring = formstring ..
      "image[2.75,1.5;1,1;gui_furnace_arrow_bg.png^[transformR90^[lowpart:"..
      (percent)..":gui_furnace_arrow_fg.png^[transformR270]"
  else
    formstring = formstring ..
      "image[2.75,1.5;1,1;gui_furnace_arrow_bg.png]"
  end
  return formstring ..
    "list[context;dst;3.75,0.96;2,2;]"..
    "list[current_player;main;0,4.25;8,1;]"..
    "list[current_player;main;0,5.5;8,3;8]"..
    "listring[context;dst]"..
    "listring[current_player;main]"..
    "listring[context;src]"..
    "listring[current_player;main]"
end

local function furnace_bottom_formspec(percent)
  local formstring = "size[8,8.5]"..
      "list[context;fuel;3.5,2.5;1,1;]"
  if percent then
    formstring = formstring ..
      "image[3.5,1.5;1,1;ws_cobble.png^ws_furnace_front.png^[lowpart:"..
      (100-percent)..":ws_furnace_burning_part.png]"
  else
    formstring = formstring ..
      "image[3.5,1.5;1,1;ws_cobble.png^ws_furnace_front.png]"
  end
  return formstring ..
    "list[current_player;main;0,4.25;8,1;]"..
    "list[current_player;main;0,5.5;8,3;8]"..
    "listring[context;fuel]"..
    "listring[current_player;main]"
end

minetest.register_node("ws_core:furnace_top", {
  description = "pot",
  tiles = {
    {
      name = "ws_toxic_water_source_animated.png",
      backface_culling = false,
      animation = {
        type = "vertical_frames",
        aspect_w = 16,
        aspect_h = 16,
        length = 2.0,
      },
  }, "ws_pot_bottom.png", "ws_pot.png"},
  groups = {oddly_breakable_by_hand = 2},
  is_ground_content = false,
  on_construct = function(pos)
    local meta = minetest.get_meta(pos)
    meta:set_string("formspec", furnace_top_formspec())
    meta:set_string("infotext", "pot")
    local inv = meta:get_inventory()
    inv:set_size("src", 1)
    inv:set_size("dst", 4)
  end,
  can_dig = function(pos)
    local meta = minetest.get_meta(pos);
    local inv = meta:get_inventory()
    if not inv:is_empty("dst") then
      return false
    elseif not inv:is_empty("src") then
      return false
    end
    return true
  end,
  allow_metadata_inventory_put = function(pos, listname, _, stack)
    -- args: pos, listname, index, stack, player
    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory()
    if listname == "src" then
      return stack:get_count()
    elseif listname == "dst" then
      return 0
    end
  end,
  allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, _, count)
    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory()
    local stack = inv:get_stack(from_list, from_index)
    if to_list == "src" then
      return count
    elseif to_list == "dst" then
      return 0
    end
  end,
})

minetest.register_node("ws_core:furnace_top_active", {
  description = "furnace top",
  tiles = {
    {
      name = "ws_toxic_water_source_animated.png",
      backface_culling = false,
      animation = {
        type = "vertical_frames",
        aspect_w = 16,
        aspect_h = 16,
        length = 2.0,
      },
  }, "ws_pot_bottom.png", "ws_pot.png"},
  drop = "ws_core:furnace_top",
  groups = {oddly_breakable_by_hand = 2, not_in_creative_inventory=1},
  is_ground_content = false,
  can_dig = function(pos)
    local meta = minetest.get_meta(pos);
    local inv = meta:get_inventory()
    if not inv:is_empty("dst") then
      return false
    elseif not inv:is_empty("src") then
      return false
    end
    return true
  end,
  allow_metadata_inventory_put = function(pos, listname, _, stack)
    -- args: pos, listname, index, stack, player
    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory()
    if listname == "src" then
      return stack:get_count()
    elseif listname == "dst" then
      return 0
    end
  end,
  allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, _, count)
    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory()
    local stack = inv:get_stack(from_list, from_index)
    if to_list == "src" then
      return count
    elseif to_list == "dst" then
      return 0
    end
  end,
})

local function is_hot_below(pos)
  local bpos = vector.add(pos,{x=0,y=-1,z=0})
  local node = minetest.get_node(bpos)
  return minetest.get_item_group(node.name, "hot") > 0
end

minetest.register_abm({
  nodenames = {"ws_core:furnace_top", "ws_core:furnace_top_active"},
  interval = 1.0,
  chance = 1,
  action = function(pos, node)
    local meta = minetest.get_meta(pos)
    for _, name in ipairs({"src_totaltime","src_time"}) do
      if meta:get_string(name) == "" then
        meta:set_float(name, 0.0)
      end
    end

    local inv = meta:get_inventory()

    local srclist = inv:get_list("src")
    local cooked = nil
    local aftercooked

    if srclist then
      cooked, aftercooked = minetest.get_craft_result({method = "cooking", width = 1, items = srclist})
    end

    local was_active = false

    if is_hot_below(pos) then
      was_active = true
      minetest.swap_node(pos,{name = "ws_core:furnace_top_active", param2 = node.param2})
      meta:set_float("src_time", meta:get_float("src_time") + 1)
      local percent = math.floor(meta:get_float("src_time") /
          cooked.time * 100)
      meta:set_string("formspec", furnace_top_formspec(percent))
      if cooked and cooked.item and percent >= 100 then
        -- check if there's room for output in "dst" list
        if inv:room_for_item("dst",cooked.item) then
          -- Put result in "dst" list
          inv:add_item("dst", cooked.item)
          -- take stuff from "src" list
          inv:set_stack("src", 1, aftercooked.items[1])
        else
          minetest.log("info","Could not insert '"..cooked.item:to_string()
                              .."' into destination list of furnace at "..minetest.pos_to_string(pos))
        end
        meta:set_string("src_time", 0)
      end
    else
       minetest.swap_node(pos,{name="ws_core:furnace_top", param2 = node.param2})
    end

    cooked = nil
    srclist = inv:get_list("src")

    if srclist then
      cooked = minetest.get_craft_result({method = "cooking", width = 1, items = srclist})
    end

    if cooked == nil or cooked.item:is_empty() then
      if was_active then
        meta:set_string("infotext","empty pot")
        meta:set_string("formspec", furnace_top_formspec())
      end
      return
    end
  end,
})

minetest.register_node("ws_core:furnace_bottom", {
  description = "furnace bottom",
  tiles = {
    "ws_cobble.png^ws_hole.png",
	"ws_cobble.png",
    "ws_cobble.png",
	"ws_cobble.png",
	"ws_cobble.png",
	"ws_cobble.png^ws_furnace_front.png",
  },
  paramtype2 = "facedir",
  groups = {cracky=2},
  is_ground_content = false,
  on_construct = function(pos)
    local meta = minetest.get_meta(pos)
    meta:set_string("formspec", furnace_bottom_formspec())
    meta:set_string("infotext", "furnace bottom");
    local inv = meta:get_inventory()
    inv:set_size("fuel", 1)
  end,
  can_dig = function(pos)
    local meta = minetest.get_meta(pos);
    local inv = meta:get_inventory()
    if not inv:is_empty("fuel") then
      return false
    end
    return true
  end,
  allow_metadata_inventory_put = function(pos, listname, _, stack)
    -- args: pos, listname, index, stack, player
    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory()
    if listname == "fuel" then
      if minetest.get_craft_result({method="fuel",width=1,items={stack}}).time ~= 0 then
        return stack:get_count()
      else
        return 0
      end
    end
  end,
  allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, _, count)
    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory()
    local stack = inv:get_stack(from_list, from_index)
    if to_list == "fuel" then
      if minetest.get_craft_result({method="fuel",width=1,items={stack}}).time ~= 0 then
        return count
      else
        return 0
      end
    end
  end,
})

minetest.register_node("ws_core:furnace_bottom_active", {
  description = "furnace bottom (burning)",
  tiles = {
    {
      name = "ws_furnace_hole.png",
      backface_culling = false,
      animation = {
        type = "vertical_frames",
        aspect_w = 16,
        aspect_h = 16,
        length = 6.0,
      },
    },
    "ws_cobble.png",
	"ws_cobble.png",
	"ws_cobble.png",
	"ws_cobble.png",
    {
      name = "ws_furnace_burning.png",
      backface_culling = false,
      animation = {
        type = "vertical_frames",
        aspect_w = 16,
        aspect_h = 16,
        length = 4.0,
      },
    },
  },
  paramtype2 = "facedir",
  light_source = 14,
  groups = {cracky=2, not_in_creative_inventory=1, hot=1},
  drop = "ws_core:furnace_bottom",
  is_ground_content = false,
  can_dig = function(pos)
    local meta = minetest.get_meta(pos);
    local inv = meta:get_inventory()
    if not inv:is_empty("fuel") then
      return false
    end
    return true
  end,
  allow_metadata_inventory_put = function(pos, listname, _, stack)
    -- args: pos, listname, index, stack, player
    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory()
    if listname == "fuel" then
      if minetest.get_craft_result({method="fuel",width=1,items={stack}}).time ~= 0 then
        return stack:get_count()
      else
        return 0
      end
    end
  end,
  allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, _, count)
    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory()
    local stack = inv:get_stack(from_list, from_index)
    if to_list == "fuel" then
      if minetest.get_craft_result({method="fuel",width=1,items={stack}}).time ~= 0 then
        return count
      else
        return 0
      end
    end
  end,
})

minetest.register_abm({
  nodenames = {"ws_core:furnace_bottom","ws_core:furnace_bottom_active"},
  interval = 1.0,
  chance = 1,
  action = function(pos, node)
    local meta = minetest.get_meta(pos)
    for _, name in ipairs({"fuel_totaltime","fuel_time"}) do
      if meta:get_string(name) == "" then
        meta:set_float(name, 0.0)
      end
    end

    local inv = meta:get_inventory()

    local was_active = false

    if meta:get_float("fuel_time") < meta:get_float("fuel_totaltime") then
      was_active = true
      meta:set_float("fuel_time", meta:get_float("fuel_time") + 1)
    end

    if meta:get_float("fuel_time") < meta:get_float("fuel_totaltime") then
      local percent = math.floor(meta:get_float("fuel_time") /
          meta:get_float("fuel_totaltime") * 100)
      minetest.swap_node(pos,{name = "ws_core:furnace_bottom_active", param2 = node.param2})
      meta:set_string("formspec",furnace_bottom_formspec(percent))
      return
    end

    local fuel = nil
    local afterfuel
    local fuellist = inv:get_list("fuel")

    if fuellist then
      fuel, afterfuel = minetest.get_craft_result({method = "fuel", width = 1, items = fuellist})
    end

    if fuel and fuel.time > 0 then
      meta:set_string("fuel_totaltime", fuel.time)
      meta:set_string("fuel_time", 0)
      inv:set_stack("fuel", 1, afterfuel.items[1])
    else
      minetest.swap_node(pos,{name = "ws_core:furnace_bottom", param2 = node.param2})
      meta:set_string("formspec", furnace_bottom_formspec())
    end
  end,
})
