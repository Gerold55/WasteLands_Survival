-- LemonLake's Factories: Config

-- NB: miners require fans in the crafting recipe. recommended to enable fans if miners are enabled.
-- 	   alternatively change the crafting recipe manually in crafting.lua

factory.enableMiner = true
factory.enableFan = true
factory.enableVacuum = true

factory.fertilizerGeneration = true

factory.minerDigLimit = 512

--TODO: turn into registrations
-- Sapling IO for the Sapling Treatment Plant
factory.stpIO = {	{input = "ws_core:sapling", output = "ws_core:tree",				min = 4, 	max = 7},
					-- these moretrees values are incorrect, please change them to your liking
					-- your trees here
		 }