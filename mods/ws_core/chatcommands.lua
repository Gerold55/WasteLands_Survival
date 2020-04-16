
minetest.register_chatcommand("heal", {
	description = "sets maximum HP, thirst, breath and hunger values",
	privs = {fly = true},
	func = function(name)
    local player = minetest.get_player_by_name(name)
    thirst.set_player_thirst(name, 20)
    hbhunger.heal(player)
    player:set_hp(20)
		player:set_breath(11)
		return true, "You have been healed!"
	end,
})

minetest.register_chatcommand("thirst", {
	params = "<amount>",
	description = "Set thirst value to <amount>.",
	privs = {debug = true},
	func = function(name, param)
		if not minetest.settings:get_bool("enable_damage") then
			return false, "If enable_damage is not on, the thirst mod is not active."
		end
		if not thirst then
			return false, "Thirst mod not found."
		end
		if type(tonumber(param)) ~= "number" then
			return false, "The parameter must be a number!"
		end
	    local player = minetest.get_player_by_name(name)
	    thirst.set_player_thirst(name, tonumber(param))
		return true, "Your thirst has been set!"
	end,
})
