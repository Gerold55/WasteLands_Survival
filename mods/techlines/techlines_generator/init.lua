-- Techlines Generator Mod Initialization

-- Create the techlines_generator namespace
techlines_generator = {}

-- Load necessary files
local mod_path = minetest.get_modpath("techlines_generator")

dofile(mod_path .. "/generator.lua")

-- Log to console that the mod has loaded successfully
minetest.log("action", "[Techlines Generator] Loaded Techlines Generator Mod")
