minetest.register_craftitem("bucket:bucket_clay_unfired", {
	description = minetest.colorize("#FFFFFF", "Unfired Clay Bucket\n")..minetest.colorize("#ababab", "An unfired clay bucket which, when cooked, will hold water."),
	inventory_image = "bucket_clay_unfired.png",
	groups = {coal = 1, flammable = 1}
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "bucket:bucket_clay_empty",
	recipe = "bucket:bucket_clay_unfired"
})

if minetest.registered_items["ws_core:clay_lump"] then
	minetest.register_craft({
		output = "bucket:bucket_clay_unfired 1",
		recipe = {
			{'ws_core:clay_lump', '', 'ws_core:clay_lump'},
			{'', 'ws_core:clay_lump', ''},
		}
	})
end

-- Clay bucket
bucket.register_bucket(
	{ -- empty bucket
		item_name = "bucket:bucket_clay_empty",
		description = minetest.colorize("#FFFFFF", "Empty Clay Bucket\n")..minetest.colorize("#ababab", "Use empty bucket to collect toxic water."),
		inventory_image = "bucket_clay_empty.png",
		groups = {bucket = 1},
	},
	{ -- list of full buckets
		{
			liquid_source = "ws_core:water_source_toxic",
			item_name = "bucket:bucket_clay_water_toxic",
			description = "Toxic Water Bucket (Clay)",
			inventory_image = "bucket_clay_water_toxic.png",
			groups = {water_bucket = 1},
			force_renew = false,
		},
		{
			liquid_source = "ws_core:water_source",
			item_name = "bucket:bucket_clay_water",
			description = "Water Bucket (Clay)",
			inventory_image = "bucket_clay_water.png",
			groups = {water_bucket = 1},
			force_renew = true,
		},
	}
)

-- Metal bucket
bucket.register_bucket(
	{
		item_name = "bucket:bucket_metal_empty",
		description = minetest.colorize("#FFFFFF", "Empty Metal Bucket\n")..minetest.colorize("#ababab", "Use empty bucket to collect toxic water."),
		inventory_image = "bucket_metal_empty.png",
		groups = {bucket = 1},
	},
	{
		{
			liquid_source = "ws_core:water_source_toxic",
			item_name = "bucket:bucket_meatl_water_toxic",
			description = "Toxic Water Bucket (Metal)",
			inventory_image = "bucket_metal_water_toxic.png",
			groups = {water_bucket = 1},
			force_renew = false,
		},
		{
			liquid_source = "ws_core:water_source",
			item_name = "bucket:bucket_metal_water",
			description = "Water Bucket (Metal)",
			inventory_image = "bucket_metal_water.png",
			groups = {water_bucket = 1},
			force_renew = true,
		},
		{
			liquid_source = "ws_core:oil_source",
			item_name = "bucket:bucket_metal_oil",
			description = "Oil Bucket (Metal)",
			inventory_image = "bucket_metal_oil.png",
			groups = {water_bucket = 1},
			force_renew = true,
		},
	}
)
