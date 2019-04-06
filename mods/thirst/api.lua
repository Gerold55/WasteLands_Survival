-- Thirst API

local damage_enabled = minetest.settings:get_bool("enable_damage")

if damage_enabled then

    hb.register_hudbar("thirst", 0xFFFFFF, "Thirst", { icon = "thirst_hud_icon.png", bgicon = "thirst_hud_bg.png",  bar = "" }, 20, 30, false)

    -- Global table, which contains the API
    thirst = {}

    -- Maximum thirst value, and default for new players.
    thirst.max_thirst = 20

    -- Local var for easier use, don't ask me why
    max_thirst = 20

    -- Every x seconds, the player thirst is decreased by 1 if they're in water.
    thirst.water_quench_rate = 2

    -- Every x seconds, if the player is not in water, their thirst is increased by 1.
    thirst.thirst_rate = 30

    -- HP taken off a player for every thirst_rate they have insufficient thirst.
    thirst.hp_penalty = 3

    -- Every x seconds, thirst data is saved.
    thirst.data_storage_rate = 10

    -- Returns the thirst a player has, or nil if the player does not exist.
    thirst.get_player_thirst = function(name)

        local player = minetest.get_player_by_name(name)

        if player then

            local meta = player:get_meta()

            local pthirst = meta:get("thirst")

            if not pthirst then

                meta:set_int("thirst", max_thirst)

                pthirst = max_thirst
            end

            return tonumber(pthirst)
        end

        return nil
    end

    -- Sets player thirst to a value.
    thirst.set_player_thirst = function(name, amount)

        local player = minetest.get_player_by_name(name)

        if player then

            local meta = player:get_meta()

            if amount > max_thirst then
                amount = max_thirst
            end

            if amount < 0 then
                amount = 0
            end

            meta:set_int("thirst", amount)

            hb.change_hudbar(player, "thirst", amount, max_thirst, "thirst_hud_icon.png", "thirst_hud_bg.png",  "", "Thirst", 0xFFFF)
        end
    end

    -- Returns true if the player is in a drinkable liquid; false otherwise.
    thirst.is_player_in_water = function(name)

        local player = minetest.get_player_by_name(name)

        local pos = player:get_pos()

        local node = minetest.get_node_or_nil(pos)

        if node then

            return node.name == "ws_core:water_source"
        end

        return false
    end

    -- Decreases player thirst by an amount.
    thirst.decrease_thirst = function(name, amount)

        local pthirst = thirst.get_player_thirst(name)

        thirst.set_player_thirst(name, pthirst + amount)
    end

    -- Adding the thirst HUD to new players.
    minetest.register_on_joinplayer(function(player)

        local name = player:get_player_name()

        hb.init_hudbar(player, "thirst", thirst.get_player_thirst(name), max_thirst, false)
    end)

    -- Reset player thirst on die.
    minetest.register_on_respawnplayer(function(player)

        local name = player:get_player_name()

        thirst.set_player_thirst(name, max_thirst)
    end)

    local timer = 0

    local timer2 = 0

    local timer_store_data = 0

    -- Globalstep to run everything.
    minetest.register_globalstep(function(dtime)

        if dtime then

            timer = timer + dtime

            timer2 = timer2 + dtime

            timer_store_data = timer_store_data + dtime
        end

        if timer >= thirst.water_quench_rate then

            timer = 0

            for index, player in pairs(minetest.get_connected_players()) do

                local name = player:get_player_name()

                if name then

                    local pos = player:get_pos()

                    local node = minetest.get_node_or_nil(pos)

                    if thirst.is_player_in_water(name) then

                        thirst.decrease_thirst(name, 1)
                    end
                end
            end
        end

        if timer2 >= thirst.thirst_rate then

            timer2 = 0

            for index, player in pairs(minetest.get_connected_players()) do

                local name = player:get_player_name()

                if name then
                    
                    if not thirst.is_player_in_water(name) then

                        if thirst.get_player_thirst(name) > 1 then

                            thirst.decrease_thirst(name, -1)
                        end

                        if thirst.get_player_thirst(name) < 2 then

                            player:set_hp(player:get_hp() - thirst.hp_penalty)
                        end
                    end
                end
            end
        end
    end)
end
