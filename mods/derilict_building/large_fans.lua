local fdir_to_front = {
  {x=0, z=1},
  {x=1, z=0},
  {x=0, z=-1},
  {x=-1, z=0}
}

local function checkwall(pos,length,height)
  --TODO: restructure up this mess
  local fdir = minetest.get_node(pos).param2
  local front = fdir_to_front[fdir + 1]
  local maxx = pos.x + front.x * length
  local maxy = pos.y + height
  local maxz = pos.z + front.z * length
  local minx = math.min(maxx,pos.x)
  local minz = math.min(maxz,pos.z)
  for x = minx, math.max(maxx,pos.x) do
    for y = pos.y, maxy do
      for z = minz, math.max(maxz,pos.z) do
        local cpos = {x=x, y=y, z=z}
        local cn = minetest.get_node(cpos)
        if not cn or not minetest.registered_nodes[cn.name]
            or not minetest.registered_nodes[cn.name].buildable_to then
          if not vector.equals(pos,cpos) then
            return true
          end
        end
      end
    end
  end

  return false
end

minetest.register_node("derilict_building:fan_large_plain", {
  description = "large fan",
  drawtype = "mesh",
  mesh = "derilict_building_fan_large.obj",
  tiles = {"derilict_building_fan_large_plain.png"},
  paramtype  = "light",
  paramtype2 = "facedir",
  groups = {cracky = 2},
  selection_box = {
    type = "fixed",
    fixed = {
          {-0.5, -0.5,-0.50, 0.50,  1.5, 1.5},
      }
  },
  collision_box = {
    type = "fixed",
    fixed = {
          {-0.50, -0.5,-0.50, 0.50,  1.5, 1.5},
      }
  },
  sounds = ws_core and ws_core.node_sound_metal_ws_cores(),
  after_place_node = function(pos, placer, itemstack)
    if checkwall(pos,1,1) then
      minetest.set_node(pos, {name = "air"})
      return true
    end
  end,
})

minetest.register_node("derilict_building:fan_large_rusted", {
  description = "large rusted fan",
  drawtype = "mesh",
  mesh = "derilict_building_fan_large.obj",
  tiles = {"derilict_building_fan_large_rusted.png"},
  paramtype  = "light",
  paramtype2 = "facedir",
  groups = {cracky = 2},
  selection_box = {
    type = "fixed",
    fixed = {
          {-0.5, -0.5,-0.50, 0.50,  1.5, 1.5},
      }
  },
  collision_box = {
    type = "fixed",
    fixed = {
          {-0.50, -0.5,-0.50, 0.50,  1.5, 1.5},
      }
  },
  sounds = ws_core and ws_core.node_sound_metal_ws_cores(),
  after_place_node = function(pos, placer, itemstack)
    if checkwall(pos,1,1) then
      minetest.set_node(pos, {name = "air"})
      return true
    end
  end,
})
