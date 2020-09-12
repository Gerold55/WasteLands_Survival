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

minetest.register_craftitem("food:bug_3_cooked", {
	description = "Coocked Cockroach",
	inventory_image = "food_cockroach_cooked.png",
	groups = {food_bugs = 1},
	on_use = minetest.item_eat(2),
})

minetest.register_craftitem("food:bug_4_cooked", {
	description = "Coocked Larva",
	inventory_image = "food_larva_cooked.png",
	groups = {food_bugs = 1},
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	type = "cooking",
	output = "food:bug_3_cooked",
	recipe = "food:bug_3",
	cooktime = 3,
})

minetest.register_craft({
	type = "cooking",
	output = "food:bug_4_cooked",
	recipe = "food:bug_4",
	cooktime = 3,
})
