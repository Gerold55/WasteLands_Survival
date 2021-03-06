local entries = journal.require "entries"
local triggers = journal.require "triggers"

entries.register_page("ws_story:survivor","survivors log","a tale of the last survivors in this world")

-- creative mode
triggers.register_on_join({
	id = "ws_story:creative",
	call_once = true,
	is_active = function (playerName)
		return creative.is_enabled_for(playerName)
	end,
	call = function(data)
		entries.add_entry(data.playerName,"ws_story:survivor","--- In creative mode the story "..
			"of wastelands survival may lose it's consistency. ---",false)
	end,
})

--add entry symbolizing a new owner
--called everytime a player spawns
local function find_journal(pname)
	entries.add_entry(pname,"ws_story:survivor","Today I found this old journal. "..
		"Poor bastard who left this behind... I guess I'll just write a bit about my own life into this. "..
		"Today even my last rations came to an end, will I be the next victim of these wastelands?",true)
end

--write first entry when joining
triggers.register_on_join({
	id = "ws_story:start",
	call_once = true,
	call = function(data)
		find_journal(data.playerName)
		--the plot
		minetest.after(10,entries.add_entry,data.playerName,"ws_story:survivor",
			"But first let me explain what happened: Robbers stole a secret formula from the miliary, a bio weapon. "..
			"On their flight it got dropped into some water and quickly spread into the oceans. "..
			"A while later this killed the whole planet, food and clean water became too rare for humans to survive. "..
			"Now me and perhaps a small group of other survivors live in these wastelands.",false)
		minetest.after(20,entries.add_entry,data.playerName,"ws_story:survivor","Also there are ogres and other evil critter. "..
			"They were formed by all sorts of animals and also humans who suffered from the toxic water. ",false)
		minetest.after(30,entries.add_entry,data.playerName,"ws_story:survivor","I have to survive somehow. "..
			"I'll need something to craft other than my hands. If I had a wooden table to put the stuff on that would make things easier.",false)
	end,
})

--entry when dying, somebody else continues the journal
triggers.register_on_die(function(data)
	find_journal(data.playerName)
end)

--wood breaks into pieces if you don't cut it
triggers.register_on_dig({
	target = {"group:tree", "group:wood"},
	id = "ws_story:treepunch",
	call_once = true,
	call = function(data)
		--print("wood dug")
		if minetest.get_item_group(data.tool, "hatchet") == 0 and minetest.get_item_group(data.tool, "axe") == 0 then
			entries.add_entry(data.playerName,"ws_story:survivor","Ouch, just hitting wood won't do."..
				"I guess I need a hatchet or an axe.",true)
		end
	end
})

triggers.register_on_craft({
	target = "crafting:crafting_table",
	id = "ws_story:crafting_table",
	call_once = true,
	call = function(data)
		entries.add_entry(data.playerName,"ws_story:survivor","I've got the crafting table. "..
			"Now I need something against the unbearable thirst. "..
			"If I remember correctly you can collect dew in a wooden barrel that has a plastic sheet on top instead of a wooden lid."..
			-- FIXME: create the plastic sheet, correct the craft recipe, then remove this
			"\n--- The dew barrel is currently craftable without plastic sheeting ---",true)
	end,
})

triggers.register_counter("ws_story:dew_barrel_count","craft","dewcollector:barrel_closed",false)

triggers.register_on_craft({
	target = "dewcollector:barrel_closed",
	id = "ws_story:dew_barrel",
	call_once = true,
	call = function(data)
		entries.add_entry(data.playerName,"ws_story:survivor","It is done, a dew collection barrel! "..
			"Now I just have to place it somewhere and wait until it fills up, "..
			"Then I can have a fresh drink. I guess I should build more of these.",true)
	end,
})

triggers.register_on_craft({
	target = "dewcollector:barrel_closed",
	id = "ws_story:some_dew_barrels",
	call_once = true,
	is_active = function(player)
		return triggers.get_count("ws_story:dew_barrel_count",player) > 2
	end,
	call = function(data)
		entries.add_entry(data.playerName,"ws_story:survivor",
			"I guess three barrels are enough to survive for now. "..
			"Maybe I should repair and extend a shelter...",true)
	end,
})

triggers.register_on_craft({
	target = "dewcollector:barrel_closed",
	id = "ws_story:many_dew_barrels",
	call_once = true,
	is_active = function(player)
		return triggers.get_count("ws_story:dew_barrel_count",player) > 4
	end,
	call = function(data)
		entries.add_entry(data.playerName,"ws_story:survivor",
			"These dew barrels are quite inefficient. "..
			"I should try building a filter to clean the toxic water.",true)
	end,
})

--craft wood blocks from multiple stairs
triggers.register_on_dig({
	target = {"group:stair"},
	id = "ws_story:staircombine",
	call_once = true,
	call = function(data)
		entries.add_entry(data.playerName,"ws_story:survivor",
			"I get all these broken planks from the ruins... "..
			"Maybe I can combine them back into full walls.",true)
	end
})
