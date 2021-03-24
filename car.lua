-- Code from the Vehicle Mash mod (WTFPL license)

-- Translation support
local S = minetest.get_translator("cloud_items")

local name = "car_cloud"
local definition = ...

definition.description = S("Cloud car")
definition.inventory_image = "cloud_items_car_cloud_inventory.png"
definition.wield_image = "cloud_items_car_cloud_inventory.png"
definition.textures = {"cloud_items_car_cloud.png"}
definition.recipe = {
    {"vehicle_mash:tire", "vehicle_mash:windshield", "vehicle_mash:tire"},
    {"cloud_items:cloudblock", "vehicle_mash:motor", "cloud_items:cloudblock"},
    {"vehicle_mash:tire", "vehicle_mash:battery", "vehicle_mash:tire"},
}

vehicle_mash.register_vehicle("cloud_items:" .. name, definition)
