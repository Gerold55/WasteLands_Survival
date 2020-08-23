local log = dna_analysis.require("log")
local flask = dna_analysis.require("flask")
local memory = dna_analysis.require("memory")

-- TODO: add settings for these
local max_analyzer_jobs = 6
-- pre and post analysis work amount
local analyze_extra_work = 5

--TODO: add jobs to UI

local function construct_analyzer(pos)
  local meta = minetest.get_meta(pos)
  meta:set_string("formspec",
            "size[8,9]"..
            "label[0.2,0.5;memory stick]"..
            "list[context;ext_mem;0.5,1;1,1;]"..
            "label[0.2,2.5;sample input]"..
            "list[context;main;0.5,3;1,1;]"..
            "list[current_player;main;0,5;8,4;]")
  local inv = meta:get_inventory()
  inv:set_size("main", 1)
  inv:set_size("ext_mem", 1)
end

minetest.register_node("dna_analysis:analyzer", {
  description = "DNA analyzer",
  groups = {
    oddly_breakable_by_hand = 1, -- you want to pick it up if you want to take it
    heavy = 1, -- why ever I added this custom group
  },
  tiles = {"dna_analysis_analyzer_top.png", "dna_analysis_analyzer_bottom.png",
    "dna_analysis_analyzer_sides.png", "dna_analysis_analyzer_sides.png",
    "dna_analysis_analyzer_back.png", "dna_analysis_analyzer_front.png"},
  paramtype2 = "facedir",
  on_construct = construct_analyzer, --caution: this is not called by bulk placement
  allow_metadata_inventory_put = function(pos, listname, index, stack, player)
    if listname == "main" then
      if stack:get_name() == "dna_analysis:flask_filled" then
        return 1
      end
    elseif listname == "ext_mem" then
      if stack:get_name() == "dna_analysis:memory_stick_32" then
        return 1
      end
    end
    return 0
  end,
  on_metadata_inventory_put = function(pos, listname, index, stack, player)
    local meta = minetest.get_meta(pos)
    if listname == "main" then
      -- increment running jobs
      local running_jobs = meta:get_int("running_jobs")
      if running_jobs >= max_analyzer_jobs then return end
      running_jobs = running_jobs + 1
      
      -- start new job
      local job_id = "job_"..running_jobs
      local sample_id = stack:get_meta():get_int("dna_analysis_sample_id")
      if sample_id == 0 then
        log.warning("filled flask without sample id")
      end
      meta:set_int(job_id.."_sample_id",sample_id)
      meta:set_float(job_id.."_progress",1)
      local sample = flask.sample_data[sample_id]
      if sample then
        local work = analyze_extra_work
        local mem = 0
        for _,s in pairs(sample) do
          work = work + s.amount
          mem = mem + math.max(s.amount - s.corruption, 0)
        end
        meta:set_int(job_id.."_workload", work)
        meta:set_int(job_id.."_mem_needed", mem)
      else
        meta:set_int(job_id.."_workload", analyze_extra_work)
        meta:set_int(job_id.."_mem_needed", 0)
      end
      --TODO show new running job in UI
    elseif listname == "ext_mem" then
      if stack:get_name() == "dna_analysis:memory_stick_32" then
        meta:set_int("mem_free",32)
      end
    end
  end,
  on_metadata_inventory_take = function(pos, listname, index, stack, player)
    if listname == "ext_mem" then
      local meta = minetest.get_meta(pos)
      meta:set_int("mem_free",0)
    end
  end,
})

local function analyze_progress(meta,job_id)
  local progress = meta:get_int(job_id.."_progress")
  if progress < 1 then return end
  if progress > meta:get_int(job_id.."_workload") then
    -- check space on memory stick
    local mem_free = meta:get_int("mem_free")
    local mem_needed = meta:get_int(job_id.."_mem_needed")
    if mem_free < mem_needed then
      return
    end

    -- check if a memory stick is present
    local inv = meta:get_inventory()
    local stack = inv:get_stack("ext_mem", 1)
    if stack:is_empty() then
      return
    end
    
    -- store data on memory stick
    local mem_id = stack:get_meta():get_int("dna_analysis_mem_id")
    local mem_data
    if mem_id == 0 then
      log.info("memory stick without mem_id")
      mem_id, mem_data = memory.create_dna_storage()
      stack:get_meta():set_int("dna_analysis_mem_id",mem_id)
    else
      mem_data = memory.mem_data[mem_id]
    end    
    table.insert(mem_data.raws,meta:get_int(job_id.."_sample_id"))
    meta:set_int("mem_free", mem_free - mem_needed)
    
    -- clean up
    meta:set_int(job_id.."_sample_id",0)
    meta:set_float(job_id.."_progress",0)
    meta:set_int(job_id.."_workload", 0)
    meta:set_int(job_id.."_mem_needed", 0)
    return
  end
  meta:set_int(job_id.."_progress", progress + 0.5)
end

minetest.register_abm({
  label = "DNA analysis",
  nodenames = {"dna_analysis:analyzer"},
  interval = 5,
  chance = 1,
  action = function(pos)
    local meta = minetest.get_meta(pos)
    for j = 1, max_analyzer_jobs do
      analyze_progress(meta, "job_"..j)
    end
    --TODO: update UI
  end,
})

-- for testing
local dnapi = dna_analysis.require("api")
dnapi.register_dna_deposit({
  life_form = "dna_analysis:unknown",
  place_filter = {
    nodenames = {"ws_core:dirt_dry"}
  },
  average_amount = 1,
  amount_variance = 1,
  average_corruption = 0.5,
  corruption_variance = 0.5
})
