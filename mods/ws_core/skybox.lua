-- Skybox

local day_sky = "#AF8957"
local day_horizon = "#C4A883"
local dawn_sky = "#AF8957"
local dawn_horizon = "C4A883"
local night_sky = "#00013F"
local night_horizon = "#00015B"
local sun_tint = "#CE5200"
local moon_tint = "#96A6FF"

local cloud_color = "#FFDAAA"
local star_color = "#FFDAAA"

minetest.register_on_joinplayer(function(player)
	player:set_sky({
	type = "regular",
	clouds = true,
	sky_color = {
		day_sky = day_sky,
		day_horizon = day_horizon,
		dawn_sky = dawn_sky,
		night_sky = night_sky,
		night_horizon = night_horizon,
	}
})

player:set_clouds({
	color = cloud_color
})

player:set_stars({
	count = 3000,
	star_color = star_color,
	scale = 0.8
})
end)