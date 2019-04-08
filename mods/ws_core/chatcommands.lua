
minetest.register_chatcommand("heal", {
	description = "sets maximum HP, thirst, breath and hunger values",
	privs = {fly = true},
	func = function(name)
    local player = minetest.get_player_by_name(name)
    thirst.set_player_thirst(name, 20)
    hbhunger.heal(player)
    inv = player:get_inventory()
    player:set_hp(20)
		player:set_breath(11)
		return true, "You have been healed!"
	end,
})
