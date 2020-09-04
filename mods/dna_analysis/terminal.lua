--TODO: interactive UI to control all the connected components

minetest.register_node("dna_analysis:terminal", {
	description = "DNA computer terminal",
	groups = dna_analysis.default_machine_groups,
	tiles = {
		"dna_analysis_terminal_top.png",
		"dna_analysis_terminal_bottom.png",
		"dna_analysis_terminal_side.png",
		"dna_analysis_terminal_side.png",
		"dna_analysis_terminal_back.png",
		"dna_analysis_terminal_front.png"
	},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5,  -0.375, 0.5,   0.5,   0.5}, -- Base
			{-0.5, -0.375,-0.5,  -0.375, 0.375,-0.375}, -- LeftBorder
			{0.375,-0.375,-0.5,   0.5,   0.375,-0.375}, -- RightBorder
			{-0.5,  0.375,-0.5,   0.5,   0.5,  -0.375}, -- TopBorder
			{-0.5, -0.5,  -0.5,   0.5,  -0.375,-0.375}, -- BottomBorder
		}
	},
	paramtype2 = "facedir",
})
