-- Acid Rain
weather_mod.register_downfall("ws_weather:acidrain",{
	min_pos = {x=-9, y=7, z=-9},
	max_pos = {x= 9, y=7, z= 9},
	falling_speed=10,
	amount=15,
	exptime=0.8,
	size=25,
	texture="ws_weather_acidrain.png",
	enable_lightning=true,
	damage_player={amount = 1, chance = .8, time = 60},
})
