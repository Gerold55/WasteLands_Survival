<<<<<<< HEAD
--the time when this mod started loading
local init = os.clock()
if minetest.settings:get_bool("log_mods") then
  minetest.log("action", "[MOD] "..minetest.get_current_modname()..": loading")
else
  print("[MOD] "..minetest.get_current_modname()..": loading")
end

dna_analysis = {
  -- modpath is needed for local_require
  modpath = minetest.get_modpath("dna_analysis"),
  -- the mod-individual metadata
  mod_storage = minetest.get_mod_storage(),
  -- this might be (re)moved in the future
  default_machine_groups = {
    oddly_breakable_by_hand = 1, -- you want to pick it up if you dig it
    heavy = 1, -- why ever I added this custom group
    level = 1 -- actually nevermind, picking it up is not that easy
  },
}

local modules = {
  init = dna_analysis,
  log = modutil.require("logging").make_loggers(),
  --translations = modutil.require("translations","venus")("dna_analysis")
}

modutil.require("local_require")(dna_analysis,modules)

-- testing
dna_analysis.require("terminal")
dna_analysis.require("server")
dna_analysis.require("incubator")
--TODO: dna_analysis.require("cryotank")

-- load components
-- dna_analysis.require("flask") is loaded in the sequencer
-- dna_analysis.require("memory") also loaded in the sequencer
dna_analysis.require("sequencer")

--the time needed for loading
local time_to_load= os.clock() - init
if minetest.settings:get_bool("log_mods") then
  minetest.log("action", string.format("[MOD] %s: loaded in %.4f s", minetest.get_current_modname(), time_to_load))
else
  print(string.format("[MOD] %s: loaded in %.4f s",minetest.get_current_modname(), time_to_load))
end

return dna_analysis
=======
--the time when this mod started loading
local init = os.clock()
if minetest.settings:get_bool("log_mods") then
  minetest.log("action", "[MOD] "..minetest.get_current_modname()..": loading")
else
  print("[MOD] "..minetest.get_current_modname()..": loading")
end

dna_analysis = {
  -- modpath is needed for local_require
  modpath = minetest.get_modpath("dna_analysis"),
  -- the mod-individual metadata
  mod_storage = minetest.get_mod_storage(),
  -- this might be (re)moved in the future
  default_machine_groups = {
    oddly_breakable_by_hand = 1, -- you want to pick it up if you dig it
    heavy = 1, -- why ever I added this custom group
    level = 1 -- actually nevermind, picking it up is not that easy
  },
}

local modules = {
  init = dna_analysis,
  log = modutil.require("logging").make_loggers(),
  --translations = modutil.require("translations","venus")("dna_analysis")
}

modutil.require("local_require")(dna_analysis,modules)

-- testing
dna_analysis.require("terminal")
dna_analysis.require("server")
dna_analysis.require("incubator")
--TODO: dna_analysis.require("cryotank")

-- load components
-- dna_analysis.require("flask") is loaded in the sequencer
-- dna_analysis.require("memory") also loaded in the sequencer
dna_analysis.require("sequencer")

--the time needed for loading
local time_to_load= os.clock() - init
if minetest.settings:get_bool("log_mods") then
  minetest.log("action", string.format("[MOD] %s: loaded in %.4f s", minetest.get_current_modname(), time_to_load))
else
  print(string.format("[MOD] %s: loaded in %.4f s",minetest.get_current_modname(), time_to_load))
end

return dna_analysis
>>>>>>> f5fe8b4d33691540d42a2029185ee221b5d35f6b
