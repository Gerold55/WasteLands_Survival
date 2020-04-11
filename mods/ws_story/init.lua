journal.register_page("ws_story:survivor","survivors log","a tale of the last survivors in this world")

-- creative mode
journal.triggers.register_on_join({
	id = "ws_story:creative",
	call_once = true,
	is_active = function (playerName)
		return creative.is_enabled_for(playerName)
	end,
	call = function(data)
		journal.add_entry(data.playerName,"ws_story:survivor","--- In creative mode the story "..
			"of wastelands survival may lose it's consistency. ---",false)
	end,
})

--write first entry when joining
journal.triggers.register_on_join({
	id = "ws_story:start",
	call_once = true,
	call = function(data)
		journal.add_entry(data.playerName,"ws_story:survivor","Today I found this old journal. "..
			"Poor bastard who left this behind... I guess I'll just write a bit about my own life into this. "..
			"Today even my last rations came to an end, will I be the next victim of these wastelands?",true)
		--the plot
		minetest.after(10,journal.add_entry,data.playerName,"ws_story:survivor",
			"But first let me explain what happened: Robbers stole a secret formula from the miliary, a bio weapon. "..
			"On their flight it got dropped into some water and quickly spread into the oceans. "..
			"A while later this killed the whole planet, food and clean water became too rare for humans to survive. "..
			"Now me and perhaps a small group of other survivors live in these wastelands.",false)
		minetest.after(20,journal.add_entry,data.playerName,"ws_story:survivor","Also there are ogres and other evil critter. "..
			"They were formed by all sorts of animals and also humans who suffered from the toxic water. ",false)
	end,
})

--entry when dying, somebody else continues the journal
journal.triggers.register_on_die(function(data)
	journal.add_entry(data.playerName,"ws_story:survivor","Today I found this old journal. "..
		"Poor bastard who left this behind... I guess I'll just write a bit about my own life into this. "..
		"Today even my last rations came to an end, will I be the next victim of these wastelands?", true)
end)

--wood breaks into pieces if you don't cut it
journal.triggers.register_on_dig({
	target = {"group:tree", "group:wood"},
	id = "ws_story:treepunch",
	call_once = true,
	call = function(data)
		--print("wood dug")
		if minetest.get_item_group(data.tool, "hatchet") == 0 and minetest.get_item_group(data.tool, "axe") == 0 then
			journal.add_entry(data.playerName,"ws_story:survivor","Ouch, just hitting wood won't do."..
				"I guess I need a hatchet or an axe.",true)
		end
	end
})
