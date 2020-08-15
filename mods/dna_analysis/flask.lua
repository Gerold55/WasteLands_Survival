local dnapi = dna_analysis.require("api")

minetest.register_craftitem("dna_analysis:flask_empty",{
  description = "empty sample flask",
  inventory_image = "dna_analysis_flask.png",
  liquids_pointable = true,
  on_use = function(itemstack, user, pointed_thing)
    if pointed_thing.type == "object" then
      --TODO get a sample from that life form
      pointed_thing.ref:punch(user, 1.0, { full_punch_interval=1.0 }, nil)
      return user:get_wielded_item()
    elseif pointed_thing.type ~= "node" then
      -- do nothing if it's neither object nor node
      return
    end
    --TODO get a sample from the node
    local pos = pointed_thing.under
    local node = minetest.get_node(pos)
    local sample = dnapi.get_dna_from(node.name,pos,node)
    if #sample == 0 then
      return
    end
    
    local stack = ItemStack("dna_analysis:flask_filled")
    local meta = stack:get_meta()
    local mtable = meta:to_table()
    mtable["dna_analysis_sample"] = sample
    meta:from_table(mtable)

    if itemstack:get_count() > 1 then
      local inv = user:get_inventory()
      if inv:room_for_item("main", stack) then
        inv:add_item("main", stack)
      else
        local pos = user:get_pos()
        pos.y = math.floor(pos.y + 0.5)
        minetest.add_item(pos, stack)
      end
      itemstack:take_item()
      return itemstack
    else
      return stack
    end
  end,
})

minetest.register_craftitem("dna_analysis:flask_filled", {
  description = "filled sample flask",
  inventory_image = "dna_analysis_flask_filled.png",
  stack_max = 1,
  liquids_pointable = true,
  on_use = function(itemstack, user, pointed_thing)
    return ItemStack("dna_analysis:flask_empty")
  end,
})
