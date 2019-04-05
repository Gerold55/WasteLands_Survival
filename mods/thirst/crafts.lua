minetest.register_craft({
    output = "thirst:straw",
    type = "shapeless",
    recipe = {"ws_core:stick", "ws_core:sandy_dirt"},
})

minetest.register_craft({
    output = "thirst:canteen",
    type = "shapeless",
    recipe = {"bucket:bucket_empty", "ws_core:iron_lump"},
})
