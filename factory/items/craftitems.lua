local S = factory.S
minetest.register_craftitem("factory:tree_sap", {
	description = S("Tree Sap"),
	inventory_image = "factory_tree_sap.png"
})

minetest.register_craftitem("factory:compressed_clay", {
	description = S("Compressed Clay"),
	inventory_image = "factory_compressed_clay.png"
})

minetest.register_craftitem("factory:factory_lump", {
	description = S("Factory Lump"),
	inventory_image = "factory_lump.png"
})

minetest.register_craftitem("factory:scanner_chip", {
	description = S("Item Scanning Microchip"),
	inventory_image = "factory_scanner_chip.png"
})

minetest.register_craftitem("factory:fan_blade", {
	description = S("Small Fanblade"),
	inventory_image = "factory_fan_blade.png"
})

--TODO: tar from cooking tree sap
