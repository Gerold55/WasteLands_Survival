local http = ...
local make_fs, get_inventory_fs = i3.files.gui()

IMPORT("FS")
IMPORT("sorter", "sort_inventory", "play_sound")
IMPORT("sort", "concat", "copy", "insert", "remove")
IMPORT("get_player_by_name", "add_hud_waypoint", "init_hud_notif")
IMPORT("gmatch", "split", "S", "err", "fmt", "reg_items", "pos_to_str")
IMPORT("true_str", "true_table", "is_str", "is_func", "is_table", "clean_name")

function i3.register_craft_type(name, def)
	if not true_str(name) then
		return err "i3.register_craft_type: name missing"
	elseif not true_table(def) then
		return err "i3.register_craft_type: definition missing"
	elseif not is_str(def.description) then
		def.description = ""
	end

	i3.craft_types[name] = def
end

function i3.register_craft(def)
	local width, c = 0, 0

	if http and true_str(def.url) then
		http.fetch({url = def.url}, function(result)
			if result.succeeded then
				local t = core.parse_json(result.data)
				if is_table(t) then
					return i3.register_craft(t)
				end
			end
		end)

		return
	end

	if not true_table(def) then
		return err "i3.register_craft: craft definition missing"
	end

	if #def > 1 then
		for _, v in pairs(def) do
			i3.register_craft(v)
		end
		return
	end

	if def.result then
		def.output = def.result -- Backward compatibility
		def.result = nil
	end

	if not true_str(def.output) and not def.url then
		return err "i3.register_craft: output missing"
	end

	if not is_table(def.items) then
		def.items = {}
	end

	if def.grid then
		if not is_table(def.grid) then
			def.grid = {}
		end

		if not is_table(def.key) then
			def.key = {}
		end

		local cp = copy(def.grid)
		sort(cp, function(a, b) return #a > #b end)

		width = #cp[1]

		for i = 1, #def.grid do
			while #def.grid[i] < width do
				def.grid[i] = def.grid[i] .. " "
			end
		end

		for symbol in gmatch(concat(def.grid), ".") do
			c++
			def.items[c] = def.key[symbol]
		end
	else
		local items = copy(def.items)
		local lines = {}
		def.items = {}

		for i = 1, #items do
			lines[i] = split(items[i], ",", true)

			if #lines[i] > width then
				width = #lines[i]
			end
		end

		for i = 1, #items do
			while #lines[i] < width do
				insert(lines[i], items[i])
			end
		end

		for _, line in ipairs(lines) do
			for _, v in ipairs(line) do
				c++
				def.items[c] = clean_name(v)
			end
		end
	end

	local item = ItemStack(def.output):get_name()
	i3.recipes_cache[item] = i3.recipes_cache[item] or {}

	def.custom = true
	def.width = width

	insert(i3.recipes_cache[item], def)
end

function i3.add_recipe_filter(name, f)
	if not true_str(name) then
		return err "i3.add_recipe_filter: name missing"
	elseif not is_func(f) then
		return err "i3.add_recipe_filter: function missing"
	end

	i3.recipe_filters[name] = f
end

function i3.set_recipe_filter(name, f)
	if not is_str(name) then
		return err "i3.set_recipe_filter: name missing"
	elseif not is_func(f) then
		return err "i3.set_recipe_filter: function missing"
	end

	i3.recipe_filters = {[name] = f}
end

function i3.add_search_filter(name, f)
	if not true_str(name) then
		return err "i3.add_search_filter: name missing"
	elseif not is_func(f) then
		return err "i3.add_search_filter: function missing"
	end

	i3.search_filters[name] = f
end

function i3.get_recipes(item)
	item = core.registered_aliases[item] or item
	local recipes = i3.recipes_cache[item]
	local usages = i3.usages_cache[item]

	return {recipes = recipes, usages = usages}
end

function i3.set_fs(player)
	if not player or player.is_fake_player then return end
	local name = player:get_player_name()
	local data = i3.data[name]
	if not data then return end

	if data.auto_sorting then
		sort_inventory(player, data)
	end

	for i, tab in ipairs(i3.tabs) do
		if data.tab == i and tab.access and not tab.access(player, data) then
			data.tab = 1
			break
		end
	end

	local fs = make_fs(player, data)
	player:set_inventory_formspec(fs)
end

function i3.new_tab(name, def)
	if not true_str(name) then
		return err "i3.new_tab: tab name missing"
	elseif not true_table(def) then
		return err "i3.new_tab: tab definition missing"
	elseif not true_str(def.description) then
		return err "i3.new_tab: description missing"
	elseif #i3.tabs == 6 then
		return err(fmt("i3.new_tab: cannot add '%s' tab. Limit reached (6).", def.name))
	end

	def.name = name
	insert(i3.tabs, def)
end

i3.new_tab("inventory", {
	description = S("Inventory"),
	formspec = get_inventory_fs,
	slots = true,
})

function i3.remove_tab(name)
	if not true_str(name) then
		return err "i3.remove_tab: tab name missing"
	end

	for i = #i3.tabs, 2, -1 do
		local def = i3.tabs[i]
		if def and name == def.name then
			remove(i3.tabs, i)
		end
	end
end

function i3.get_current_tab(player)
	local name = player:get_player_name()
	local data = i3.data[name]

	return data.tab
end

function i3.set_tab(player, tabname)
	local name = player:get_player_name()
	local data = i3.data[name]

	if not tabname or tabname == "" then
		data.tab = 0
		return
	end

	for i, tab in ipairs(i3.tabs) do
		if tab.name == tabname then
			data.tab = i
			return
		end
	end

	err(fmt("i3.set_tab: tab name '%s' does not exist", tabname))
end

function i3.override_tab(name, newdef)
	if not true_str(name) then
		return err "i3.override_tab: tab name missing"
	elseif not true_table(newdef) then
		return err "i3.override_tab: tab definition missing"
	elseif not true_str(newdef.description) then
		return err "i3.override_tab: description missing"
	end

	newdef.name = name

	for i, def in ipairs(i3.tabs) do
		if def.name == name then
			i3.tabs[i] = newdef
			break
		end
	end
end

i3.register_craft_type("digging", {
	description = S("Digging"),
	icon = "i3_steelpick.png",
})

i3.register_craft_type("digging_chance", {
	description = S("Digging (by chance)"),
	icon = "i3_mesepick.png",
})

i3.add_search_filter("groups", function(item, groups)
	local def = reg_items[item]
	local has_groups = true

	for _, group in ipairs(groups) do
		if not def.groups[group] then
			has_groups = nil
			break
		end
	end

	return has_groups
end)

function i3.compress(item, def)
	if not true_str(item) then
		return err "i3.compress: item name missing"
	elseif not true_table(def) then
		return err "i3.compress: replace definition missing"
	elseif not true_str(def.replace) then
		return err "i3.compress: replace string missing"
	elseif not is_table(def.by) then
		return err "i3.compress: replace substrings missing"
	elseif i3.compressed[item] then
		return err(fmt("i3.compress: item '%s' is already compressed", item))
	end

	local t = {}
	i3.compress_groups[item] = i3.compress_groups[item] or {}

	for _, str in ipairs(def.by) do
		local it = item:gsub(def.replace, str)

		insert(t, it)
		insert(i3.compress_groups[item], it)

		i3.compressed[it] = true
	end
end

function i3.hud_notif(name, msg, img)
	if not true_str(name) then
		return err "i3.hud_notif: player name missing"
	elseif not true_str(msg) then
		return err "i3.hud_notif: message missing"
	end

	local data = i3.data[name]
	if not data then
		return err "i3.hud_notif: no player data initialized"
	end

	local player = get_player_by_name(name)
	if not player then return end
	local max_y = -125

	local def = {
		show = true,
		max = {x = -330, y = max_y},
		hud_msg = msg,
		hud_img = img and fmt("%s^[resize:64x64", img) or nil,
		hud_timer = 0,
		elems = init_hud_notif(player),
	}

	insert(data.hud.notifs, def)
	play_sound(name, "i3_achievement", 1.0)

	local nb_notifs = #data.hud.notifs
	for i = 1, nb_notifs - 1 do
		local notif = data.hud.notifs[i]
		if notif then
			notif.show = true
			notif.max.y = ((nb_notifs - i) + 1) * max_y
			notif.hud_timer = 0.5 * (nb_notifs - i)
		end
	end
end

function i3.add_sorting_method(name, def)
	if not true_str(name) then
		return err "i3.add_sorting_method: name missing"
	elseif not true_table(def) then
		return err "i3.add_sorting_method: definition missing"
	elseif not is_func(def.func) then
		return err "i3.add_sorting_method: function missing"
	end

	def.name = name
	insert(i3.sorting_methods, def)
end

i3.add_sorting_method("alphabetical", {
	description = S("Sort items by name (A-Z)"),
	func = function(list, data)
		sorter(list, data, 1)
		return list
	end
})

i3.add_sorting_method("numerical", {
	description = S("Sort items by number of items per stack"),
	func = function(list, data)
		sorter(list, data, 2)
		return list
	end,
})

function i3.add_waypoint(name, def)
	if not true_str(name) then
		return err "i3.add_waypoint: name missing"
	elseif not true_table(def) then
		return err "i3.add_waypoint: definition missing"
	elseif not true_str(def.player) then
		return err "i3.add_waypoint: player name missing"
	end

	local data = i3.data[def.player]
	if not data then
		return err "i3.add_waypoint: no player data initialized"
	end

	local player = get_player_by_name(def.player)
	local id = player and add_hud_waypoint(player, name, def.pos, def.color, def.image) or nil

	insert(data.waypoints, {
		name  = name,
		pos   = pos_to_str(def.pos, 1),
		color = def.color,
		image = def.image,
		id    = id,
	})

	if data.subcat == 5 then
		data.scrbar_inv += 1000
	end

	i3.set_fs(player)
end

function i3.remove_waypoint(player_name, name)
	if not true_str(player_name) then
		return err "i3.remove_waypoint: player name missing"
	elseif not true_str(name) then
		return err "i3.remove_waypoint: waypoint name missing"
	end

	local data = i3.data[player_name]
	if not data then
		return err "i3.remove_waypoint: no player data initialized"
	end

	local player = get_player_by_name(player_name)

	for i = #data.waypoints, 1, -1 do
		local waypoint = data.waypoints[i]
		if waypoint and name == waypoint.name then
			if player then
				player:hud_remove(waypoint.id)
			end

			remove(data.waypoints, i)
		end
	end

	i3.set_fs(player)
end

function i3.get_waypoints(player_name)
	if not true_str(player_name) then
		return err "i3.get_waypoints: player name missing"
	end

	local data = i3.data[player_name]
	if not data then
		return err "i3.get_waypoints: no player data initialized"
	end

	return data.waypoints
end

function i3.new_minitab(name, def)
	if #i3.minitabs == 6 then
		return err "i3.new_minitab: limit reached (6)"
	elseif not true_str(name) then
		return err "i3.new_minitab: name missing"
	elseif not true_table(def) then
		return err "i3.new_minitab: definition missing"
	end

	def.name = name
	insert(i3.minitabs, def)
end

function i3.remove_minitab(name)
	if not true_str(name) then
		return err "i3.remove_minitab: name missing"
	end

	for i = #i3.minitabs, 2, -1 do
		local v = i3.minitabs[i]
		if v and v.name == name then
			remove(i3.minitabs, i)
		end
	end
end

i3.new_minitab("all", {
	description = FS("All"),

	sorter = function()
		return true
	end
})

i3.new_minitab("nodes", {
	description = FS("Nodes"),

	sorter = function(item)
		return core.registered_nodes[item]
	end
})

i3.new_minitab("items", {
	description = FS("Items"),

	sorter = function(item)
		return core.registered_craftitems[item] or core.registered_tools[item]
	end
})
