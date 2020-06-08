local function filter_formspec(percent)
  local formstring = "size[8,8.5]"..
      "list[context;src;1.25,1;2,2;]"
  if percent then
    formstring = formstring ..
      "image[3.25,1.5;1,1;gui_furnace_arrow_bg.png^[transformR90^[lowpart:"..
      (percent)..":gui_furnace_arrow_fg.png^[transformR270]"
  else
    formstring = formstring ..
      "image[3.25,1.5;1,1;gui_furnace_arrow_bg.png]"
  end
  return formstring ..
    "list[context;dst;4.25,1;2,2;]"..
    "list[current_player;main;0,4.25;8,1;]"..
    "list[current_player;main;0,5.5;8,3;8]"..
    "listring[context;dst]"..
    "listring[current_player;main]"..
    "listring[context;src]"..
    "listring[current_player;main]"
end

minetest.register_node("ws_core:filter", {
  description = "water filter",
  tiles = {
    "ws_filter_top.png", "ws_filter_bottom.png",
    "ws_filter_sides.png", "ws_filter_sides.png",
    "ws_filter_sides.png", "ws_filter_front.png"
  },
  paramtype2 = "facedir",
  groups = {oddly_breakable_by_hand = 1}, --you don't want to destroy it, you want to take it
  is_ground_content = false,
  on_construct = function(pos)
    local meta = minetest.get_meta(pos)
    meta:set_string("formspec", filter_formspec())
    meta:set_string("infotext", "water filter")
    local inv = meta:get_inventory()
    inv:set_size("src", 4)
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

minetest.register_abm({
  nodenames = {"ws_core:filter"},
  interval = 1.0,
  chance = 1,
  action = function(pos, node)
    local meta = minetest.get_meta(pos)
    --initialize values
    for _, name in ipairs({"src_totaltime","src_time"}) do
      if meta:get_string(name) == "" then
        meta:set_float(name, 0.0)
      end
    end

    local inv = meta:get_inventory()

    local srclist = inv:get_list("src")
    local filtered = nil

    if srclist then
      --TODO: add recipe registration for filtering
      for _,stack in pairs(srclist) do
        local item = stack:get_name()
        if item == "bucket:bucket_water_toxic" then
          filtered = {time = 20, item = ItemStack("bucket:bucket_water"), base = stack}
        elseif item == "bucket:bucket_clay_water_toxic" then
          filtered = {time = 20, item = ItemStack("bucket:bucket_clay_water"), base = stack}
        end
      end
    end
    
    if not filtered then
      if meta:get_float("src_time") > 0 then
        meta:set_float("src_time", 0)
        meta:set_string("formspec", filter_formspec())
      end
      return
    end

    meta:set_float("src_time", meta:get_float("src_time") + 1)
    local percent = math.floor(meta:get_float("src_time") /
          filtered.time * 100)
    meta:set_string("formspec", filter_formspec(percent))
    if filtered.item and percent >= 100 then
      -- check if there's room for output in "dst" list
      if inv:room_for_item("dst",filtered.item) then
        -- Put result in "dst" list
        inv:add_item("dst", filtered.item)
        -- take stuff from "src" list
        inv:remove_item("src", filtered.base)
        meta:set_string("formspec", filter_formspec())
      else
        minetest.log("info","Could not insert '"..filtered.item:to_string()
                            .."' into destination list of filter at "..minetest.pos_to_string(pos))
      end
      meta:set_string("src_time", 0)
    end
  end,
})

local s = "ws_core:scrap" --shoud be iron ingot, does not exist yet
local b = "bucket:bucket_empty"
local f = "ws_core:coal_block" -- a filtering material
minetest.register_craft({
  output="ws_core:filter",
  recipe={
    {s,b,s},
    {s,f,s},
    {s,b,s},
  }
})
