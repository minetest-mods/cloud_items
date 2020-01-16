--[[
Adds powerful cloud tools for Minetest.

Copyright (C) 2019-2020 David Leal (halfpacho@gmail.com)
Copyright (C) Various other Minetest developers/contributors

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
USA

==========================================================================

Dependencies: default (included in minetest_game)
Optional dependencies: 3D Armor
--]]

-----------------
-- Ores/blocks --
-----------------

minetest.register_node("cloud_items:cloud_ore", {
	description = "Cloud Ore",
	tiles = {"default_stone.png^cloud_items_mineral_cloud.png"},
	light_source = 7,
	groups = {cracky = 1, level = 3},
	drop = "cloud_items:cloud_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("cloud_items:cloudblock", {
	description = "Cloud Block",
	tiles = {"cloud_items_cloud_block.png"},
	light_source = 5,
	is_ground_content = false,
	groups = {cracky = 1, level = 3.9},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("cloud_items:decoration_block", {
	description = "Cloud decoration Block",
	tiles = {"cloud_items_decorationblock.png"},
	light_source = 5,
	is_ground_content = false,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("cloud_items:cloud", {
	description = "Cloud",
	tiles = {"default_cloud.png"},
	light_source = 2,
	is_ground_content = false,
	groups = {cracky = 1, level = 3, not_in_creative_inventory = 1},
	drop = "",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("cloud_items:decorative_cloud", {
	description = "Decorative cloud",
	tiles = {"default_cloud.png"},
	light_source = 2,
	is_ground_content = false,
	groups = {cracky = 1, level = 3, not_in_creative_inventory = 1},
	sounds = default.node_sound_stone_defaults(),
})


-------------
-- Mapgen --
-------------

-- Credits to Brett O'Donnell (cornernote) for the "place_schem" function.

local schem_offset_x = -3
local schem_offset_y = -4
local schem_offset_z = -3

local schempath = minetest.get_modpath(minetest.get_current_modname())..'/schems'
local function place_schem(origin, filename)
	local file = io.open(schempath..'/'..filename, 'rb')
	local value = file:read('*a')
	file:close()

	local nodes = minetest.deserialize(value)
	if not nodes then return nil end

	for _,entry in ipairs(nodes) do
		local pos = {
			x=entry.x + origin.x + schem_offset_x,
			y=entry.y + origin.y + schem_offset_y,
			z=entry.z + origin.z + schem_offset_z,
		}
		if minetest.get_node(pos).name == 'air' then
			minetest.add_node(pos, {name=entry.name})
		end
	end
end

--[[
Functions from Minetest Game's nyancat (LGPLv2.1+).

This is a modified work.
See the mod license (https://github.com/clinew/nyancat/blob/master/license.txt) for more information.
--]]

local function generate_small(minp, maxp, seed)
	local height_min = 200
	local height_max = 1000
	if maxp.y < height_min or minp.y > height_max then
		return
	end
	local y_min = math.max(minp.y, height_min)
	local y_max = math.min(maxp.y, height_max)
	local volume = (maxp.x - minp.x + 1) * (y_max - y_min + 1) * (maxp.z - minp.z + 1)
	local pr = PseudoRandom(seed + 9324342)
	local max_num_schematics = math.floor(volume / (34 * 34 * 34))
	for i = 1, max_num_schematics do
		if pr:next(0, 1000) == 0 then
			local x0 = pr:next(minp.x, maxp.x)
			local y0 = pr:next(minp.y, maxp.y)
			local z0 = pr:next(minp.z, maxp.z)
			local p0 = {x = x0, y = y0, z = z0}
			place_schem(p0, "cloud_small_1.we")
		end
	end
end

-- Generate the small schematic without the ore. 🤭
-- There are more chances to find an small schematic without an ore.
local function generate_small_without_ore(minp, maxp, seed)
	local height_min = 200
	local height_max = 1000
	if maxp.y < height_min or minp.y > height_max then
		return
	end
	local y_min = math.max(minp.y, height_min)
	local y_max = math.min(maxp.y, height_max)
	local volume = (maxp.x - minp.x + 1) * (y_max - y_min + 1) * (maxp.z - minp.z + 1)
	local pr = PseudoRandom(seed + 9324342)
	local max_num_schematics = math.floor(volume / (30 * 30 * 30))
	for i = 1, max_num_schematics do
		if pr:next(0, 1000) == 0 then
			local x0 = pr:next(minp.x, maxp.x)
			local y0 = pr:next(minp.y, maxp.y)
			local z0 = pr:next(minp.z, maxp.z)
			local p0 = {x = x0, y = y0, z = z0}
			place_schem(p0, "cloud_small_2.we")
		end
	end
end

-- Medium.
local function generate_medium(minp, maxp, seed)
	local height_min = 380
	local height_max = 1180
	if maxp.y < height_min or minp.y > height_max then
		return
	end
	local y_min = math.max(minp.y, height_min)
	local y_max = math.min(maxp.y, height_max)
	local volume = (maxp.x - minp.x + 1) * (y_max - y_min + 1) * (maxp.z - minp.z + 1)
	local pr = PseudoRandom(seed + 9324342)
	local max_num_schematics = math.floor(volume / (42 * 42 * 42))
	for i = 1, max_num_schematics do
		if pr:next(0, 1000) == 0 then
			local x0 = pr:next(minp.x, maxp.x)
			local y0 = pr:next(minp.y, maxp.y)
			local z0 = pr:next(minp.z, maxp.z)
			local p0 = {x = x0, y = y0, z = z0}
			place_schem(p0, "cloud_medium_1.we")
		end
	end
end

-- Medium (without ore).
local function generate_medium_without_ore(minp, maxp, seed)
	local height_min = 380
	local height_max = 1180
	if maxp.y < height_min or minp.y > height_max then
		return
	end
	local y_min = math.max(minp.y, height_min)
	local y_max = math.min(maxp.y, height_max)
	local volume = (maxp.x - minp.x + 1) * (y_max - y_min + 1) * (maxp.z - minp.z + 1)
	local pr = PseudoRandom(seed + 9324342)
	local max_num_schematics = math.floor(volume / (38 * 38 * 38))
	for i = 1, max_num_schematics do
		if pr:next(0, 1000) == 0 then
			local x0 = pr:next(minp.x, maxp.x)
			local y0 = pr:next(minp.y, maxp.y)
			local z0 = pr:next(minp.z, maxp.z)
			local p0 = {x = x0, y = y0, z = z0}
			place_schem(p0, "cloud_medium_2.we")
		end
	end
end

-- Big.
local function generate_big(minp, maxp, seed)
	local height_min = 580
	local height_max = 1380
	if maxp.y < height_min or minp.y > height_max then
		return
	end
	local y_min = math.max(minp.y, height_min)
	local y_max = math.min(maxp.y, height_max)
	local volume = (maxp.x - minp.x + 1) * (y_max - y_min + 1) * (maxp.z - minp.z + 1)
	local pr = PseudoRandom(seed + 9324342)
	local max_num_schematics = math.floor(volume / (50 * 50 * 50))
	for i = 1, max_num_schematics do
		if pr:next(0, 1000) == 0 then
			local x0 = pr:next(minp.x, maxp.x)
			local y0 = pr:next(minp.y, maxp.y)
			local z0 = pr:next(minp.z, maxp.z)
			local p0 = {x = x0, y = y0, z = z0}
			place_schem(p0, "cloud_big_1.we")
		end
	end
end

-- Big (without ore).
local function generate_big_without_ore(minp, maxp, seed)
	local height_min = 580
	local height_max = 1380
	if maxp.y < height_min or minp.y > height_max then
		return
	end
	local y_min = math.max(minp.y, height_min)
	local y_max = math.min(maxp.y, height_max)
	local volume = (maxp.x - minp.x + 1) * (y_max - y_min + 1) * (maxp.z - minp.z + 1)
	local pr = PseudoRandom(seed + 9324342)
	local max_num_schematics = math.floor(volume / (46 * 46 * 46))
	for i = 1, max_num_schematics do
		if pr:next(0, 1000) == 0 then
			local x0 = pr:next(minp.x, maxp.x)
			local y0 = pr:next(minp.y, maxp.y)
			local z0 = pr:next(minp.z, maxp.z)
			local p0 = {x = x0, y = y0, z = z0}
			place_schem(p0, "cloud_big_2.we")
		end
	end
end

-- Generate/place the schematics.
minetest.register_on_generated(function(minp, maxp, seed)
	generate_small(minp, maxp, seed)
	generate_small_without_ore(minp, maxp, seed)
	generate_medium(minp, maxp, seed)
	generate_medium_without_ore(minp, maxp, seed)
	generate_big(minp, maxp, seed)
	generate_big_without_ore(minp, maxp, seed)
end)

------------------
-- Craftitems --
------------------

minetest.register_craftitem("cloud_items:cloud_lump", {
	description = "Cloud Lump",
	inventory_image = "cloud_items_cloud_lump.png",
})

minetest.register_craftitem("cloud_items:cloud_ingot", {
	description = "Cloud Ingot",
	inventory_image = "cloud_items_cloud_ingot.png",
})

------------
-- Tools --
------------

minetest.register_tool("cloud_items:cloud_sword", {
	description = "Cloud Sword",
	inventory_image = "cloud_items_tool_cloudsword.png",
	range = 5,
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=90, maxlevel=3},
		},
		damage_groups = {fleshy=11},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

minetest.register_tool("cloud_items:cloud_pickaxe", {
	description = "Cloud Pickaxe",
	inventory_image = "cloud_items_tool_cloudpick.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=1.0, [2]=1.0, [3]=0.50}, uses=60, maxlevel=3},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})

minetest.register_tool("cloud_items:cloud_shovel", {
	description = "Cloud Shovel",
	inventory_image = "cloud_items_tool_cloudshovel.png",
	wield_image = "cloud_items_tool_cloudshovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=0.5, [2]=0.50, [3]=0.30}, uses=60, maxlevel=3},
		},
		damage_groups = {fleshy=4.50},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})

minetest.register_tool("cloud_items:cloud_axe", {
	description = "Cloud Axe",
	inventory_image = "cloud_items_tool_cloudaxe.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=0.5, [2]=0.60, [3]=0.60}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=7.50},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})

-------------
-- Crafts --
-------------

minetest.register_craft({
	output = "cloud_items:cloud_sword",
	recipe = {
		{"cloud_items:cloud_ingot"},
		{"cloud_items:cloud_ingot"},
		{"group:stick"},
	}
})

minetest.register_craft({
	output = "cloud_items:cloud_pickaxe",
	recipe = {
		{"cloud_items:cloud_ingot", "cloud_items:cloud_ingot", "cloud_items:cloud_ingot"},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "cloud_items:cloud_shovel",
	recipe = {
		{"cloud_items:cloud_ingot"},
		{"group:stick"},
		{"group:stick"},
	}
})

minetest.register_craft({
	output = "cloud_items:cloud_axe",
	recipe = {
		{"cloud_items:cloud_ingot", "cloud_items:cloud_ingot"},
		{"cloud_items:cloud_ingot", "group:stick"},
		{"", "group:stick"},
	}
})

minetest.register_craft({
	output = "cloud_items:cloudblock",
	recipe = {
		{"cloud_items:cloud_ingot", "cloud_items:cloud_ingot", "cloud_items:cloud_ingot"},
		{"cloud_items:cloud_ingot", "cloud_items:cloud_ingot", "cloud_items:cloud_ingot"},
		{"cloud_items:cloud_ingot", "cloud_items:cloud_ingot", "cloud_items:cloud_ingot"},
	}
})

minetest.register_craft({
	output = "cloud_items:cloud_ingot 9",
	recipe = {
		{"cloud_items:cloudblock"},
	}
})

-- Decoration block
minetest.register_craft({
	output = "cloud_items:decoration_block 7",
	recipe = {
		{"cloud_items:cloud_ingot", "cloud_items:cloud_ingot", ""},
		{"cloud_items:cloud_ingot", "cloud_items:cloud_ingot", ""},
		{"", "", ""},
	}
})

-----------------------
-- 3D Armor support --
-----------------------

if minetest.get_modpath("3d_armor") then
	armor:register_armor("cloud_items:helmet_cloud", {
		description = "Cloud Helmet",
		inventory_image = "cloud_items_inv_helmet_cloud.png",
		groups = {armor_head=1, armor_heal=16, armor_use=70},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=2, snappy=1, level=6},
	})

	armor:register_armor("cloud_items:leggings_cloud", {
		description = "Cloud Leggings",
		inventory_image = "cloud_items_inv_leggings_cloud.png",
		groups = {armor_legs=1, armor_heal=16, armor_use=70},
		armor_groups = {fleshy=30},
		damage_groups = {cracky=2, snappy=1, level=6},
	})

	armor:register_armor("cloud_items:chestplate_cloud", {
		description = "Cloud Chestplate",
		inventory_image = "cloud_items_inv_chestplate_cloud.png",
		groups = {armor_torso=1, armor_heal=16, armor_use=70},
		armor_groups = {fleshy=30},
		damage_groups = {cracky=2, snappy=1, level=6},
	})

		armor:register_armor("cloud_items:boots_cloud", {
		description = "Cloud Boots",
		inventory_image = "cloud_items_inv_boots_cloud.png",
		groups = {armor_feet=1, armor_heal=16, armor_use=70, physics_speed=1,
				physics_jump=0.5},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=2, snappy=1, level=6},
	})

	if minetest.get_modpath("shields") then
		armor:register_armor("cloud_items:shield_cloud", {
			description = "Cloud Shield",
			inventory_image = "cloud_items_inv_shield_cloud.png",
			groups = {armor_shield=1, armor_heal=12, armor_use=70},
			armor_groups = {fleshy=10},
			damage_groups = {cracky=2, snappy=1, level=6},
		})
	end

	---------------
	-- Crafting --
	---------------

	minetest.register_craft({
		output = "cloud_items:helmet_cloud",
		recipe = {
			{"cloud_items:cloud_ingot", "cloud_items:cloud_ingot", "cloud_items:cloud_ingot"},
			{"cloud_items:cloud_ingot", "", "cloud_items:cloud_ingot"},
			{"", "", ""},
		},
	})
	minetest.register_craft({
		output = "cloud_items:chestplate_cloud",
		recipe = {
			{"cloud_items:cloud_ingot", "", "cloud_items:cloud_ingot"},
			{"cloud_items:cloud_ingot", "cloud_items:cloud_ingot", "cloud_items:cloud_ingot"},
			{"cloud_items:cloud_ingot", "cloud_items:cloud_ingot", "cloud_items:cloud_ingot"},
		},
	})
	minetest.register_craft({
		output = "cloud_items:leggings_cloud",
		recipe = {
			{"cloud_items:cloud_ingot", "cloud_items:cloud_ingot", "cloud_items:cloud_ingot"},
			{"cloud_items:cloud_ingot", "", "cloud_items:cloud_ingot"},
			{"cloud_items:cloud_ingot", "", "cloud_items:cloud_ingot"},
		},
	})
	minetest.register_craft({
		output = "cloud_items:boots_cloud",
		recipe = {
			{"cloud_items:cloud_ingot", "", "cloud_items:cloud_ingot"},
			{"cloud_items:cloud_ingot", "", "cloud_items:cloud_ingot"},
		},
	})
end

-- Log
if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "[Cloud Items] Loaded.")
end