cmsg = {} -- API map
cmsg.time = 10
cmsg.max_messages = 15
cmsg.color = "FFFFFF"

local keys = {} -- map
local messages = {} -- map of lists
local huds = {} -- map

local function generate_clojure(player, key)
    local pn = player:get_player_name()
    keys[pn] = key
    minetest.after(cmsg.time, function()
        if keys[pn] == key then
            messages[pn] = {}
            player:hud_change(huds[pn], "text", "")
        end
    end)
end

minetest.register_on_joinplayer(function(player)
    local pn = player:get_player_name()
    huds[pn] = player:hud_add{
        hud_elem_type = "text",
        text = "",
        number = tonumber(cmsg.color, 16),
        position = {x = 0.85, y = 0.475},
        offset = {x = -0, y = -256},
        direction = 3,
        alignment = {x = 0, y = 1},
        scale = {x = 800, y = 20 * cmsg.max_messages},
    }
    messages[pn] = {}
end)

function cmsg.push_message_player(player, message)
    local pn = player:get_player_name()
    table.insert(messages[pn], message)
    if #messages[pn] >= cmsg.max_messages then
        table.remove(messages[pn], 1)
    end
    generate_clojure(player, {})
    player:hud_change(huds[pn], "text", table.concat(messages[pn], "\n"))
end
