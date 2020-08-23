local memory = {}

local new_memory_id = dna_analysis.mod_storage:get_int("new_memory_id")
if new_memory_id == 0 then
  new_memory_id = 1
end
local memory_file = minetest.get_worldpath() .. "/dna_analysis_memory"
local mem_data = (function()
  local file = io.open(memory_file, "r")
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
  dna_analysis.mod_storage:set_int("new_sample_id",new_memory_id)
  local file = io.open(memory_file, "w")
  file:write(minetest.serialize(mem_data))
  file:close()
end)
memory.mem_data = mem_data

minetest.register_craftitem("dna_analysis:memory_stick_32", {
  description = "memory stick",
  inventory_image = "dna_analysis_memory_stick_32.png",
  wield_scale = {x = .5, y = .5, z = .8},
  stack_max = 1,
})

function memory.create_dna_storage()
  local mem_id = new_memory_id
  new_memory_id = new_memory_id + 1
  local mem = {raws = {}, info = {}}
  mem_data[mem_id] = mem
  return mem_id, mem
end

return memory
