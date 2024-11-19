local log = dna_analysis.require("log")
local cmnp = modutil.require("check_prefix","venus")

local dnapi = {}

local registered_life_forms = {}
dnapi.registered_life_forms = registered_life_forms
local registered_dna_deposits = {}
dnapi.registered_dna_deposits = registered_dna_deposits
local registered_cloning_recipes = {}
dnapi.registered_cloning_recipes = registered_cloning_recipes

---
-- registers a new life form that the player can find out about
function dnapi.register_life_form(name,def)
  local id = cmnp(name)
  -- description
  if not def.description then
    def.description = "[unnamed life form]"
  end
  if registered_life_forms[id] then
    log.warning("overriding already registered life form: " .. id)
  end
end

---
-- returns the display name of a life form
-- if the life from is not registered "[unregistered life from]" will be returned
function dnapi.get_life_form_name(id)
  local rl = registered_life_forms[id]
  if not rl then
    return "[unregistered life form]"
  end
  return rl.description
end

---
-- Registers a place where certain DNA samples can be found in a certain amount.
-- Multiple types of DNA can be registered to occur in the same place.
function dnapi.register_dna_deposit(deposit)
  assert(deposit.life_form, "please give a life_form to register a DNA deposit")
  if not registered_life_forms[deposit.life_form] then
    log.warning("registering a DNA deposit for an unregistered life form " .. deposit.life_form)
  end
  -- place_filter
  local pft = type(deposit.place_filter)
  if pft == "string" then
    deposit.place_filter = {nodenames = {}}
    deposit.place_filter.nodenames[deposit.place_filter] = true
  elseif pft == "boolean" then
    deposit.place_filter = {everywhere = deposit.place_filter}
  elseif pft == "function" then
    deposit.place_filter = {predicate = deposit.place_filter}
  elseif pft ~= "table" then
    error("a place_filter of type ".. pft .. " is not supported")
  end
  -- average_amount, amount_variance, average_corruption, corruption_variance
  assert(deposit.average_amount, "please give an average_amount to register a DNA deposit\n"
    .. "(it indicates the average amount of data the user gets from one sample and the average time needed to analyze it)")
  assert(deposit.amount_variance, "please give an amount_variance to register a DNA deposit (0 to indicate that the amount found is always the same)")
  assert(deposit.average_corruption, "please give an average_corruption to register a DNA deposit (it indicates the average amount of data that is not usable)")
  assert(deposit.corruption_variance, "please give an corruption_variance to register a DNA deposit (0 to indicate that the amount found is always the same)")
  -- maybe find some way to map them at least a little
  table.insert(registered_dna_deposits,deposit)
end

---
-- checks whether the given place_filter matches for the given location 
function dnapi.can_be_found(pf, nodename, pos, node)
  if pf.everywhere then
    return true
  end
  local nodename_found = false
  if pf.nodenames then
    if pf.nodenames[nodename] then
      nodename_found = true
    else
      for _,n in ipairs(pf.nodenames) do
        if n == nodename then
          nodename_found = true
          break
        end
      end
      if not nodename_found then
        return false
      end
    end
  end
  if pf.predicate then
    return pf.predicate(nodename, pos, node)
  end
  return nodename_found
end

---
-- generates one random sample from the given deposit
function dnapi.get_sample_from(deposit)
  local amount = deposit.average_amount
  if (deposit.amount_variance ~= 0) then
    amount = amount + deposit.amount_variance * math.random() * 2 - deposit.amount_variance
  end
  if amount < 0 then
    amount = 0
  end
  local corruption = deposit.average_corruption
  if deposit.corruption_variance ~= 0 then
    corruption = corruption + deposit.corruption_variance * math.random() * 2 - deposit.corruption_variance
  end
  return {life_form = deposit.life_form, amount = amount, corruption = corruption}
end

---
-- randomly generates a table that represents one taken sample from a certain position
function dnapi.get_dna_from(nodename,pos,node)
  local sample = {}
  for _,d in pairs(dnapi.registered_dna_deposits) do
    if dnapi.can_be_found(d.place_filter, nodename, pos, node) then
      table.insert(sample, dnapi.get_sample_from(d))
    end
  end
  return sample
end

---
-- makes a life_form cloneable
function dnapi.register_cloning_recipe(clone_process)
  assert(clone_process.life_form, "please give a life_form to register a cloning recipe")
  if not registered_life_forms[clone_process.life_form] then
    log.warning("registering a cloning recipe for an unregistered life form " .. clone_process.life_form)
  end
  assert(clone_process.data_amount, "please specify the data_amount needed to unlock the cloning recipe")
  local bnt = type(clone_process.base_nutrients)
  if bnt == "string" then
    clone_process.base_nutrients = ItemStack(clone_process.base_nutrients):to_table()
  elseif bnt == "userdata" then
    clone_process.base_nutrients = clone_process.base_nutrients:to_table()
  elseif bnt ~= "table" then
    error("please provide the base_nutrients for the cloning recipe as table or as string",2)
  end
  assert(clone_process.base_nutrients.name,"please provide the name of the base_nutrients")
  assert(clone_process.base_nutrients.count,"please provide the count of the base_nutrients")
  assert(clone_process.time, "please specify the time needed to clone the life_form")
  local rit = type(clone_process.result_item)
  if rit == "string" or rit == "table" then
    clone_process.result_item = ItemStack(clone_process.result_item)
  elseif rit == "userdata" then
    clone_process.result_item = ItemStack(clone_process.result_item)
  else
    error("please provide the result_item for the cloning recipe as table or as string",2)
  end
  if not registered_cloning_recipes[clone_process.life_form] then
    registered_cloning_recipes[clone_process.life_form] = {}
  end
  table.insert(registered_cloning_recipes[clone_process.life_form],clone_process)
end

---
-- returns all cloning recipes that are available with the given amount of data
function dnapi.get_researched_recipes(life_form, data_amount)
  local ret = {}
  for _,r in pairs(registered_cloning_recipes[life_form]) do
    if r.data_amount <= data_amount then
      table.insert(ret,r)
    end
  end
  return ret
end

---
-- finds a recipe from the list that can be made with the given items and needs the fewest of them
function dnapi.find_cheapest_possible_recipe(recipes, item_index)
  local min_count, best_recipe
  for _,r in pairs(recipes) do
    local n = r.base_nutrients
    local available = item_index[n.name]
    if available and available >= n.count then
      if (not min_count) or min_count > available then
        best_recipe = r
        min_count = n.count
      end
    end
  end
  return best_recipe
end

return dnapi
