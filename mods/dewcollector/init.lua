--perhaps corrupt barrels after a while if they stay open or filled
--perhaps save water level on dig

local barrel_capacity = 5.0 --Units are amount of buckets fillable
local barrel_interval = 300 --In seconds

--Since you can get water from the dew barrels it should somehow be finite.
--Therefore the water in the buckets should be finite.
--This is the lazy and insufficient solution:
--These overrides stop water sources from being created between others.
minetest.override_item("ws_core:water_source", {
  liquid_renewable = false,
})

minetest.override_item("ws_core:water_flowing", {
  liquid_renewable = false,
})

local function barrel_drink(pos,player)
	local name = player:get_player_name()
	if minetest.is_protected(pos, name) 
		and not minetest.check_player_privs(name, {protection_bypass=true}) 
	then return end
	
	local meta = minetest.get_meta(pos)
	local water = meta:get_float("water") or 0.0
	local amount = thirst.max_thirst - thirst.get_player_thirst(name)
	if amount / 10 > water then
    amount = water * 10
	end
	thirst.decrease_thirst(name,amount)
	meta:set_float("water", water - amount / 10)
end

local function barrel_drain(pos, listname, index, stack, player)
  local name = player:get_player_name()
  if minetest.is_protected(pos, name) 
    and not minetest.check_player_privs(name, {protection_bypass=true}) 
  then return end
  
  local meta = minetest.get_meta(pos)
  local water = meta:get_float("water") or 0.0
  if water < 1 then
    --perhaps send a chat messsage
    return
  end
  
  --check what bucket as soon as implementation for them exists
  --"bucket:bucket_clay_empty","bucket:bucket_fired_empty"

  --perhaps abort if multiple buckets
  
  local giving_back = "bucket:bucket_clay_water"
  local inv = meta:get_inventory()
  inv:set_stack("main", 1, giving_back)
  
  meta:set_float("water", water - 1)
end

local function construct_barrel(pos)
  local meta = minetest.get_meta(pos)
  local inv = meta:get_inventory()
  inv:set_size("main",1)
end

local function set_formspec(pos,enabled)
  local meta = minetest.get_meta(pos)
  if enabled then
    meta:set_string("formspec",
            "size[8,9]"..
            "button[1,2;3,1;drink;drink water]"..
            "label[5,1.5;fill:]"..
            "list[context;main;5,2;1,1;]"..
            "list[current_player;main;0,5;8,4;]"..
            "listring[context;main]"..
            "listring[current_player;main]")
  else
    meta:set_string("formspec","")
  end
end

local function barrel_fill(pos,capacity)
  if minetest.get_node(vector.add(pos,{x=0,y=1,z=0})).name ~= "air" then
    return
  end
	local meta = minetest.get_meta(pos)
	local water = meta:get_float("water") or 0.0
	local raise = (math.random(1,3)/2) --0.5, 1, or 1.5
	if (water + raise) < capacity then 
		water = water + raise
	else
		water = capacity
	end
	meta:set_float("water", water)	
end

local function close_barrel(pos, node, puncher, pointed_thing)
  minetest.swap_node(pos,{name = "dewcollector:barrel_closed"})
  set_formspec(pos,false)
  minetest.get_node_timer(pos):start(barrel_interval)
end

minetest.register_node("dewcollector:barrel_closed", {
  description = "Dew Collection Barrel",
  drawtype = "nodebox",
  node_box = {
    type = "fixed",
    fixed = {
      {-1/2, -1/2, -1/2,  1/2, -3/8,  1/2},
      {-1/2, -1/2, -1/2, -3/8,  1/2,  1/2},
      { 3/8, -1/2, -1/2,  1/2,  1/2,  1/2},
      {-1/2, -1/2, -1/2,  1/2,  1/2, -3/8},
      {-1/2, -1/2,  3/8,  1/2,  1/2,  1/2},
      {-3/8,  3/8, -3/8,  3/8,  1/2,  3/8}
    },
  },
  paramtype = "light",
  groups = {choppy=2,oddly_breakable_by_hand=1},
  tiles = {"ws_planks_old.png^ws_woven_mat.png", "ws_planks_old.png"},
  is_ground_content = false,
  on_punch = function(pos)
    local meta = minetest.get_meta(pos)
    local water = meta:get_float("water") or 0.0
    if water > 0 then
      set_formspec(pos,true)
      minetest.swap_node(pos,{name = "dewcollector:barrel_filled"})
    else
      minetest.swap_node(pos,{name = "dewcollector:barrel_empty"})
    end
  end,
  on_timer = function(pos)
    barrel_fill(pos, barrel_capacity)
    minetest.get_node_timer(pos):start(barrel_interval)
  end,
  on_construct = function(pos)
    minetest.get_node_timer(pos):start(barrel_interval)
    construct_barrel(pos)
  end,
})

minetest.register_node("dewcollector:barrel_empty", {
	description = "Dew Collection Barrel",
	drawtype = "nodebox",
	node_box = {
    type = "fixed",
    fixed = {
      {-1/2, -1/2, -1/2,  1/2, -3/8,  1/2},
      {-1/2, -1/2, -1/2, -3/8,  1/2,  1/2},
      { 3/8, -1/2, -1/2,  1/2,  1/2,  1/2},
      {-1/2, -1/2, -1/2,  1/2,  1/2, -3/8},
      {-1/2, -1/2,  3/8,  1/2,  1/2,  1/2},
    },
  },
	paramtype = "light",
	drop = "dewcollector:barrel_closed",
	groups = {choppy=2,oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	tiles = {"ws_planks_old.png"},
  on_punch = close_barrel,
  on_construct = function(pos)
    construct_barrel(pos)
    set_formspec(pos,true)
  end,
})

minetest.register_node("dewcollector:barrel_filled", {
  description = "Dew Collection Barrel",
  drawtype = "nodebox",
  node_box = {
    type = "fixed",
    fixed = {
      {-1/2, -1/2, -1/2,  1/2, -3/8,  1/2},
      {-1/2, -1/2, -1/2, -3/8,  1/2,  1/2},
      { 3/8, -1/2, -1/2,  1/2,  1/2,  1/2},
      {-1/2, -1/2, -1/2,  1/2,  1/2, -3/8},
      {-1/2, -1/2,  3/8,  1/2,  1/2,  1/2},
      {-3/8, -1/2, -3/8,  3/8,  3/8,  3/8}
    },
  },
  paramtype = "light",
  groups = {choppy=2,oddly_breakable_by_hand=1,not_in_creative_inventory=1},
  drop = "dewcollector:barrel_closed",
  tiles = {"ws_planks_old.png^(ws_water.png^[mask:dewcollector_innermask.png)", "ws_planks_old.png"},
  is_ground_content = false,
  on_punch = close_barrel,
  on_construct = function(pos)
    construct_barrel(pos)
    set_formspec(pos,true)
  end,
  on_receive_fields = function(pos, formname, fields, sender)
    if fields.drink then
      barrel_drink(pos,sender)
    end
  end,
  allow_metadata_inventory_put = function(pos, listname, index, stack, player)
    if stack:get_name() == "bucket:bucket_clay_empty" then
      return 1
    end
    return 0
  end,
  on_metadata_inventory_put = barrel_drain,
})

local w = "group:wood"
local c = "" --should be plastic sheeting, does not exist yet
minetest.register_craft({
  output="dewcollector:barrel_closed",
  recipe={
    {w, c, w},
    {w,"", w},
    {w, w, w},
  }
})
