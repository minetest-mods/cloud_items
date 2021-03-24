-- Code from the Vehicle Mash mod (WTFPL license)

-- Translation support
local S = minetest.get_translator("cloud_items")

local name = "cloud_ship"
local definition = ...

definition.description = S("Cloud ship")
definition.inventory_image = "cloud_items_cloud_ship_inventory.png"
definition.wield_image = "cloud_items_cloud_ship_inventory.png"
definition.mesh = "cloud_items_cloud_ship.obj"
definition.drop_on_destroy = {"cloud_items:cloudblock", "cloud_items:cloud_ingot 2"}
definition.can_go_down = true
definition.can_go_up = true
definition.recipe = {
	{"cloud_items:cloud_ingot",			"cloud_items:cloudblock",				"cloud_items:cloud_ingot"},
	{"cloud_items:cloudblock",			"cloud_items:cloudblock",				"cloud_items:cloudblock"},
	{"cloud_items:cloud_ingot",			"cloud_items:cloudblock",				"cloud_items:cloud_ingot"}
}

vehicle_mash.register_vehicle("cloud_items:" .. name, definition)
