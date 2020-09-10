food = {}

dofile(minetest.get_modpath('food')..'/bugs.lua')

minetest.register_craftitem("food:can", {
	description = "A Can of Preserved Food",
	inventory_image = "food_can.png",
	groups = {food = 1},
	on_use = minetest.item_eat(6),
})
