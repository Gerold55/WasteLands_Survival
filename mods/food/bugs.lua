minetest.register_craftitem("food:bug_1", {
	description = "Beetle",
	inventory_image = "food_beetle.png",
	groups = {food_bugs = 1, flammable = 1},
	on_use = minetest.item_eat(1),
})

minetest.register_craftitem("food:bug_2", {
	description = "Worm",
	inventory_image = "food_worm.png",
	groups = {food_bugs = 1, flammable = 1},
	on_use = minetest.item_eat(1),
})

minetest.register_craftitem("food:bug_3", {
	description = "Cockroach",
	inventory_image = "food_cockroach.png",
	groups = {food_bugs = 1, flammable = 1},
	on_use = minetest.item_eat(1),
})

minetest.register_craftitem("food:bug_4", {
	description = "Larva",
	inventory_image = "food_larva.png",
	groups = {food_bugs = 1, flammable = 1},
	on_use = minetest.item_eat(1),
})

minetest.register_craftitem("food:bug_5", {
	description = "Moth",
	inventory_image = "food_moth.png",
	groups = {food_bugs = 1, flammable = 1},
	on_use = minetest.item_eat(1),
})