minetest.register_node("dna_analysis:incubator", {
	description = "cloning lab",
	groups = dna_analysis.default_machine_groups,
	--TODO: new textures
	tiles = {
		"dna_analysis_analyzer_bottom.png", -- top
		"dna_analysis_analyzer_bottom.png", -- bottom
		"dna_analysis_analyzer_sides.png",
		"dna_analysis_analyzer_sides.png",
		"dna_analysis_analyzer_sides.png", --back
		"dna_analysis_analyzer_top.png" -- front
	},
	paramtype2 = "facedir",
})
