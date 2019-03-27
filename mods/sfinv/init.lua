dofile(minetest.get_modpath("sfinv") .. "/api.lua")

sfinv.register_page("sfinv:crafting", {
	title = "Crafting",
	get = function(self, player, context)
		return sfinv.make_formspec(player, context, [[
				listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]
				list[current_player;craft;6.5,0.5;3,3;]
				list[current_player;craftpreview;11,1.5;1,1;]
				image[9.5,1.5;1,1;gui_furnace_arrow_bg.png]
				listring[current_player;main]
				listring[current_player;craft]
				list[current_player;main;4.8,6.9;8,1;]
				list[current_player;main;4.8,3.6;8,3;8]
				image[4.8,6.9;1,1;gui_hb_bg.png]
				image[5,6.9;1,1;gui_hb_bg.png]
				image[5.8,6.9;1,1;gui_hb_bg.png]
				image[6,6.9;1,1;gui_hb_bg.png]
				image[6.8,6.9;1,1;gui_hb_bg.png]
				image[7,6.9;1,1;gui_hb_bg.png]
				image[7.8,6.9;1,1;gui_hb_bg.png]
				image[8,6.9;1,1;gui_hb_bg.png]
			]], false)
	end
})