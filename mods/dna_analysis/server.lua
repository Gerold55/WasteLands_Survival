minetest.register_node("dna_analysis:server", {
	description = "DNA computer",
	groups = dna_analysis.default_machine_groups,
	--TODO: more server/computer/tower like textures
	tiles = {
		"dna_analysis_terminal_bottom.png", -- top
		"dna_analysis_terminal_plain.png", -- bottom
		"dna_analysis_terminal_side.png",
		"dna_analysis_terminal_side.png",
		"dna_analysis_terminal_back.png",
		"dna_analysis_terminal_back.png" -- front
	},
	paramtype2 = "facedir",
})
