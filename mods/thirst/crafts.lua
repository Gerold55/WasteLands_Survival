minetest.register_craft({
    output = "thirst:straw",
    type = "shapeless",
    recipe = {"ws_core:stick", "ws_core:sandy_dirt"},
})

minetest.register_craft({
    output = "thirst:canteen 1 65530",
    type = "shapeless",
    recipe = {"bucket:bucket_empty", "ws_core:iron_lump"},
})
