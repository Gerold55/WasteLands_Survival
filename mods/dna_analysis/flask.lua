local dnapi = dna_analysis.require("api")

local flask_api = {}

local new_sample_id = dna_analysis.mod_storage:get_int("new_sample_id")
if new_sample_id == 0 then
  new_sample_id = 1
end
local sample_file = minetest.get_worldpath() .. "/dna_analysis_samples"
local sample_data = (function()
  local file = io.open(sample_file, "r")
  if file ~= nil then
    local data = file:read("*a")
    file:close()
    local record = minetest.deserialize(data)
    if record then
      return record
    end
  end
  return {}
end) ()
minetest.register_on_shutdown(function()
  dna_analysis.mod_storage:set_int("new_sample_id",new_sample_id)
  local file = io.open(sample_file, "w")
  file:write(minetest.serialize(sample_data))
  file:close()
end)

flask_api.sample_data = sample_data

function flask_api.generate_sample(pos)
  local node = minetest.get_node(pos)
  local sample = dnapi.get_dna_from(node.name,pos,node)
  if #sample == 0 then
    return false
  end
  local id = new_sample_id
  sample_data[id] = sample
  new_sample_id = new_sample_id + 1
  return id,sample
end

minetest.register_craftitem("dna_analysis:flask_empty",{
  description = "empty sample flask",
  inventory_image = "dna_analysis_flask.png",
  wield_scale = {x = .5, y = .5, z = .5},
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
    local sample_id = flask_api.generate_sample(pointed_thing.under)
    if not sample_id then return end
    
    local stack = ItemStack("dna_analysis:flask_filled")
    local meta = stack:get_meta()
    meta:set_int("dna_analysis_sample_id",sample_id)

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
  wield_scale = {x = .5, y = .5, z = .5},
  stack_max = 1,
  liquids_pointable = true,
  on_use = function(itemstack, user, pointed_thing)
    return ItemStack("dna_analysis:flask_empty")
  end,
})

return flask_api
