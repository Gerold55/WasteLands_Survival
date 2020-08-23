--the time when this mod started loading
local init = os.clock()
if minetest.settings:get_bool("log_mods") then
  minetest.log("action", "[MOD] "..minetest.get_current_modname()..": loading")
else
  print("[MOD] "..minetest.get_current_modname()..": loading")
end

dna_analysis = {
  modpath=minetest.get_modpath("dna_analysis"),
  mod_storage=minetest.get_mod_storage()
}

local modules = {
  init = dna_analysis,
  log = modutil.require("logging").make_loggers(),
  --translations = modutil.require("translations","venus")("dna_analysis")
}

modutil.require("local_require")(dna_analysis,modules)

-- dna_analysis.require("flask") is loaded in the analyzer
-- dna_analysis.require("memory") also loaded in the analyzer
dna_analysis.require("analyzer")

--the time needed for loading
local time_to_load= os.clock() - init
if minetest.settings:get_bool("log_mods") then
  minetest.log("action", string.format("[MOD] %s: loaded in %.4f s", minetest.get_current_modname(), time_to_load))
else
  print(string.format("[MOD] %s: loaded in %.4f s",minetest.get_current_modname(), time_to_load))
end

return dna_analysis
