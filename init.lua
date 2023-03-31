--[[
Adds powerful cloud tools for Minetest.

Copyright (C) 2019-2023 David Leal (halfpacho@gmail.com)
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

Dependencies: WorldEdit, Vehicle Mash, default (included in Minetest Game)
Optional dependencies: 3D Armor, Tool Ranks, More Blocks, multitools, stairs (included in Minetest Game)
--]]

-- Translation support
local S = minetest.get_translator("cloud_items")

-----------------
-- Ores/blocks --
-----------------

minetest.register_node("cloud_items:cloud_ore", {
	description = S("Cloud Ore"),
	tiles = {"default_cloud.png^cloud_items_mineral_cloud.png"},
	light_source = 7,
	groups = {cracky = 1, level = 3},
	drop = "cloud_items:cloud_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("cloud_items:cloudblock", {
	description = S("Cloud Block"),
	tiles = {"cloud_items_cloud_block.png"},
	light_source = 5,
	is_ground_content = false,
	groups = {cracky = 1, level = 3.9},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("cloud_items:decoration_block", {
	description = S("Cloud decoration Block"),
	tiles = {"cloud_items_decorationblock.png"},
	light_source = 5,
	is_ground_content = false,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("cloud_items:cloud", {
	description = S("Cloud (no drops)"),
	tiles = {"default_cloud.png"},
	light_source = 2,
	is_ground_content = false,
	groups = {cracky = 1, level = 3, not_in_creative_inventory = 1},
	drop = "",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("cloud_items:decorative_cloud", {
	description = S("Decorative cloud"),
	tiles = {"default_cloud.png"},
	light_source = 2,
	is_ground_content = false,
	groups = {cracky = 1, level = 3, not_in_creative_inventory = 1},
	sounds = default.node_sound_stone_defaults(),
})

-- On-generation nodes. These nodes are used
-- immediately right after generation.
minetest.register_node("cloud_items:ongen_small", {
	description = S("On-generation cloud"),
	tiles = {"default_cloud.png"},
	light_source = 2,
	is_ground_content = false,
	groups = {cracky = 1, level = 3, not_in_creative_inventory = 1},
	drop = "",
	sounds = default.node_sound_stone_defaults(),
	on_place = function(itemstack, user, pointed_thing)
		minetest.chat_send_player(user:get_player_name(), "You're not allowed to place on-generation cloud blocks!")
		return itemstack
	end,
})

minetest.register_node("cloud_items:ongen_medium", {
	description = S("On-generation cloud"),
	tiles = {"default_cloud.png"},
	light_source = 2,
	is_ground_content = false,
	groups = {cracky = 1, level = 3, not_in_creative_inventory = 1},
	drop = "",
	sounds = default.node_sound_stone_defaults(),
	on_place = function(itemstack, user, pointed_thing)
		minetest.chat_send_player(user:get_player_name(), "You're not allowed to place on-generation cloud blocks!")
		return itemstack
	end,
})

minetest.register_node("cloud_items:ongen_big", {
	description = S("On-generation cloud"),
	tiles = {"default_cloud.png"},
	light_source = 2,
	is_ground_content = false,
	groups = {cracky = 1, level = 3, not_in_creative_inventory = 1},
	drop = "",
	sounds = default.node_sound_stone_defaults(),
	on_place = function(itemstack, user, pointed_thing)
		minetest.chat_send_player(user:get_player_name(), "You're not allowed to place on-generation cloud blocks!")
		return itemstack
	end,
})

------------
-- Stairs --
------------

-- Decorative cloud (white)
if not minetest.get_modpath("moreblocks") and minetest.get_modpath("stairs") then
	local recipe = "cloud_items:decorative_cloud"
	local groups = {cracky = 1, level = 3, not_in_creative_inventory = 1}
	local images = {"default_cloud.png"}
	local sounds = default.node_sound_stone_defaults()

	stairs.register_stair("decorative_cloud", recipe, groups, images, S("Decorative cloud Stair"),
		sounds, true)
	stairs.register_stair_inner("decorative_cloud", recipe, groups, images, "",
		sounds, true, S("Inner decorative cloud Stair"))
	stairs.register_stair_outer("decorative_cloud", recipe, groups, images, "",
		sounds, true, S("Outer decorative cloud Stair"))
	stairs.register_slab("decorative_cloud", recipe, groups, images, S("Decorative cloud Slab"),
		sounds, true)

	-- Normal cloud block
	recipe = "cloud_items:cloudblock"
	groups = {cracky = 1, level = 3.9}
	images = {"cloud_items_cloud_block.png"}
	sounds = default.node_sound_stone_defaults()

	stairs.register_stair("cloud", recipe, groups, images, S("Cloud Stair"),
		sounds, true)
	stairs.register_stair_inner("cloud", recipe, groups, images, "",
		sounds, true, S("Inner cloud Stair"))
	stairs.register_stair_outer("cloud", recipe, groups, images, "",
		sounds, true, S("Outer cloud Stair"))
	stairs.register_slab("cloud", recipe, groups, images, S("Cloud Slab"),
		sounds, true)

	-- Decorative cloud block
	recipe = "cloud_items:decoration_block"
	groups = {cracky = 1, level = 3}
	images = {"cloud_items_decorationblock.png"}
	sounds = default.node_sound_stone_defaults()

	stairs.register_stair("cloud_decorative_block", recipe, groups, images, S("Decorative cloud Stair"),
		sounds, true)
	stairs.register_stair_inner("cloud_decorative_block", recipe, groups, images, "",
		sounds, true, S("Inner decorative cloud Stair"))
	stairs.register_stair_outer("cloud_decorative_block", recipe, groups, images, "",
		sounds, true, S("Outer decorative cloud Stair"))
	stairs.register_slab("cloud_decorative_block", recipe, groups, images, S("Decorative cloud Slab"),
		sounds, true)
end

-- Moreblocks support
if minetest.get_modpath("moreblocks") then
	-- Decorative cloud (white)
	stairsplus:register_all("cloud_items", "decorative_cloud", "cloud_items:decorative_cloud", {
		description = S("Decorative cloud"),
		tiles = {"default_cloud.png"},
		groups = {cracky = 1, level = 3, not_in_creative_inventory = 1},
		light_source = 2,
		sounds = default.node_sound_stone_defaults()
	})

	-- Normal cloud block
	stairsplus:register_all("cloud_items", "cloudblock", "cloud_items:cloudblock", {
		description = S("Cloud"),
		tiles = {"cloud_items_cloud_block.png"},
		groups = {cracky = 1, level = 3},
		light_source = 5,
		sounds = default.node_sound_stone_defaults()
	})

	-- Decorative cloud block
	stairsplus:register_all("cloud_items", "decoration_block", "cloud_items:decoration_block", {
		description = S("Decorative cloud"),
		tiles = {"cloud_items_decorationblock.png"},
		groups = {cracky = 1, level = 3.9},
		light_source = 5,
		sounds = default.node_sound_stone_defaults()
	})
end

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
	minetest.log("action", "Successfully placed schematic (no metadata)")
end

-- Function to load an schematic with metadata
-- Uses `worldedit.deserialize` function
local function place_schem_metadata(origin, filename)
	local file, _ = io.open(schempath .. '/' .. filename, 'rb')
	local value = file:read('*a')
	file:close()

	local nodes = worldedit.deserialize(origin, value)
	minetest.log("action", "Successfully placed schematic with " .. nodes .. " nodes (metadata)")
end

-- When an schematic is generated, it'll have a special node
-- which will have certain chance to convert to an ore or normal cloud.
local chance = math.random(1, 100)

minetest.register_lbm({
	label = "Replace cloud nodes with ore if succeeded",
	name = "cloud_items:chance_add_ore",

	nodenames = {"cloud_items:ongen_small", "cloud_items:ongen_medium", "cloud_items:ongen_big"},
	run_at_every_load = true,

	action = function(pos, node)
		chance = math.random(1, 100)
		if node.name == "cloud_items:ongen_small" then
			if chance < 2.5 then
				minetest.remove_node(pos)
				minetest.add_node(pos, {name="cloud_items:cloud_ore"})
				minetest.log("action", "cloud_items: Replaced on-generation cloud with cloud ore.")
			else
				minetest.remove_node(pos)
				minetest.add_node(pos, {name="cloud_items:cloud"})
				minetest.log("action", "cloud_items: Replaced on-generation cloud with normal cloud.")
			end
		elseif node.name == "cloud_items:ongen_medium" then
			if chance < 5 then
				minetest.remove_node(pos)
				minetest.add_node(pos, {name="cloud_items:cloud_ore"})
				minetest.log("action", "cloud_items: Replaced on-generation cloud with cloud ore.")
			else
				minetest.remove_node(pos)
				minetest.add_node(pos, {name="cloud_items:cloud"})
				minetest.log("action", "cloud_items: Replaced on-generation cloud with normal cloud.")
			end
		elseif node.name == "cloud_items:ongen_big" then
			if chance < 7.5 then
				minetest.remove_node(pos)
				minetest.add_node(pos, {name="cloud_items:cloud_ore"})
				minetest.log("action", "cloud_items: Replaced on-generation cloud with cloud ore.")
			else
				minetest.remove_node(pos)
				minetest.add_node(pos, {name="cloud_items:cloud"})
				minetest.log("action", "cloud_items: Replaced on-generation cloud with normal cloud.")
			end
		end
	end,
})

--[[
Functions from Minetest Game's nyancat (LGPLv2.1+).

This is a modified work.
See the mod license (https://github.com/clinew/nyancat/blob/master/license.txt) for more information.
--]]

local function generate_small(minp, maxp, seed)
	local height_min = 200
	local height_max = 1500
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

-- Medium.
local function generate_medium(minp, maxp, seed)
	local height_min = 380
	local height_max = 1680
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

-- Big.
local function generate_big(minp, maxp, seed)
	local height_min = 580
	local height_max = 1880
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

-- Cloud house.
local function generate_cloud_house(minp, maxp, seed)
	local height_min = 1500
	local height_max = 3750
	if maxp.y < height_min or minp.y > height_max then
		return
	end
	local y_min = math.max(minp.y, height_min)
	local y_max = math.min(maxp.y, height_max)
	local volume = (maxp.x - minp.x + 1) * (y_max - y_min + 1) * (maxp.z - minp.z + 1)
	local pr = PseudoRandom(seed + 9324342)
	local max_num_schematics = math.floor(volume / (65 * 65 * 65))
	for i = 1, max_num_schematics do
		if pr:next(0, 1000) == 0 then
			local x0 = pr:next(minp.x, maxp.x)
			local y0 = pr:next(minp.y, maxp.y)
			local z0 = pr:next(minp.z, maxp.z)
			local p0 = {x = x0, y = y0, z = z0}
			if not minetest.get_modpath("moreblocks") then
				place_schem_metadata(p0, "cloud_house_1.we")
			else
				place_schem_metadata(p0, "cloud_house_2.we")
			end
		end
	end
end

-- Generate/place the schematics.
minetest.register_on_generated(function(minp, maxp, seed)
	generate_small(minp, maxp, seed)
	generate_medium(minp, maxp, seed)
	generate_big(minp, maxp, seed)
	generate_cloud_house(minp, maxp, seed)
end)

------------------
-- Craftitems --
------------------

minetest.register_craftitem("cloud_items:cloud_lump", {
	description = S("Cloud Lump"),
	inventory_image = "cloud_items_cloud_lump.png",
})

minetest.register_craftitem("cloud_items:cloud_ingot", {
	description = S("Cloud Ingot"),
	inventory_image = "cloud_items_cloud_ingot.png",
})

------------
-- Tools --
------------

local toolranks_loaded = minetest.get_modpath("toolranks")

local sword_desc = S("Cloud Sword")
minetest.register_tool("cloud_items:cloud_sword", {
	description = toolranks_loaded and toolranks.create_description(sword_desc) or sword_desc,
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
	groups = {sword = 1},
	-- toolranks support
	original_description = toolranks_loaded and sword_desc or nil,
	after_use = toolranks_loaded and toolranks.new_afteruse or nil,
})

local pickaxe_desc = S("Cloud Pickaxe")
minetest.register_tool("cloud_items:cloud_pickaxe", {
	description = toolranks_loaded and toolranks.create_description(pickaxe_desc) or pickaxe_desc,
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
	groups = {pickaxe = 1},
	-- toolranks support
	original_description = toolranks_loaded and pickaxe_desc or nil,
	after_use = toolranks_loaded and toolranks.new_afteruse or nil,
})

local shovel_desc = S("Cloud Shovel")
minetest.register_tool("cloud_items:cloud_shovel", {
	description = toolranks_loaded and toolranks.create_description(pickaxe_desc) or shovel_desc,
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
	groups = {shovel = 1},
	-- toolranks support
	original_description = toolranks_loaded and shovel_desc or nil,
	after_use = toolranks_loaded and toolranks.new_afteruse or nil,
})

local axe_desc = S("Cloud Axe")
minetest.register_tool("cloud_items:cloud_axe", {
	description = toolranks_loaded and toolranks.create_description(pickaxe_desc) or axe_desc,
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
	groups = {axe = 1},
	-- toolranks support
	original_description = toolranks_loaded and axe_desc or nil,
	after_use = toolranks_loaded and toolranks.new_afteruse or nil,
})

-- Multitools support
if minetest.get_modpath("multitools") then
	multitools.register_multitool("cloud_items", "cloud", S("Cloud multitool"), "cloud_items_multitool_cloud.png", nil,
	{
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=1.0, [2]=1.0, [3]=0.50}, uses=60, maxlevel=3},
			choppy = {times={[1]=0.5, [2]=0.60, [3]=0.60}, uses=40, maxlevel=3},
			crumbly = {times={[1]=0.5, [2]=0.50, [3]=0.30}, uses=60, maxlevel=3},
			snappy = {times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=90, maxlevel=3},
		},
		damage_groups = {fleshy=7.25}, -- Average damage from all cloud tools
	}
)
end

------------------
-- Cloud ship --
------------------

-- Code is taken and modified from the Vehicle Mash (https://github.com/minetest-mods/vehicle_mash) mod (WTFPL license).
-- See the mod license (https://github.com/minetest-mods/vehicle_mash/blob/master/LICENSE.md) for more information.
local ship_def = {
	terrain_type = 3,
	max_speed_forward = 10,
	max_speed_reverse = 7,
	max_speed_upwards = 5,
	max_speed_downwards = 3.5,

	accel = 4,
	braking = 5,
	turn_speed = 6,
	stepheight = 1.5,
	-- model specific stuff
	visual = "mesh",
	visual_size = {x=1, y=1},
	wield_scale = {x=1, y=1, z=1},
	collisionbox = {-2.3, -0.3, -2, 2.5, 1.9, 2},
	can_fly = true,
	enable_crash = false,
	onplace_position_adj = 0,
	textures = {"default_cloud.png"},
	-- player specific stuff
	player_rotation = {x=0, y=0, z=0},
	driver_attach_at = {x=-0.6, y=19, z=0},
	driver_eye_offset = {x=-0.6, y=19, z=0},
	number_of_passengers = 0
}

-- Cloud ship (based on the Vehicle Mash boat)
local ship_enabled = minetest.settings:get_bool("cloud_items.enable_cloud_ship")
if ship_enabled or ship_enabled == nil then
	loadfile(minetest.get_modpath(minetest.get_current_modname()) .. "/ship.lua")(table.copy(ship_def))
end

----------------
-- Cloud car --
----------------

-- Code is taken and modified from the Vehicle Mash (https://github.com/minetest-mods/vehicle_mash) mod (WTFPL license).
-- See the mod license (https://github.com/minetest-mods/vehicle_mash/blob/master/LICENSE.md) for more information.
local car_def = {
		terrain_type = 1,
		max_speed_forward = 13,
		max_speed_reverse = 10,
		accel = 4,
		braking = 6,
		turn_speed = 4,
		stepheight = 1.3,

		visual = "mesh",
		mesh = "car.x", -- Model is from the Vehicle Mash mod; licensed under CC BY-NC-SA 3.0
		visual_size = {x=1, y=1},
		wield_scale = {x=1, y=1, z=1},
		collisionbox = {-0.6, -0.05, -0.6, 0.6, 1, 0.6},
		onplace_position_adj = -0.45,

		player_rotation = {x=0,y=90,z=0},
		driver_attach_at = {x=3.5,y=3.7,z=3.5},
		driver_eye_offset = {x=-4, y=0, z=0},
		number_of_passengers = 3,
		passenger_attach_at = {x=3.5,y=3.7,z=-3.5},
		passenger_eye_offset = {x=4, y=0, z=0},

		passenger2_attach_at = {x=-4,y=3.7,z=3.5},
		passenger2_eye_offset = {x=-4, y=3, z=0},

		passenger3_attach_at = {x=-4,y=3.7,z=-3.5},
		passenger3_eye_offset = {x=4, y=3, z=0},

		enable_crash = false,

		drop_on_destroy = {"vehicle_mash:tire 2", "vehicle_mash:windshield",
			"vehicle_mash:battery", "vehicle_mash:motor"},
}

-- Cloud car (similar from the CAR01 from Vehicle Mash)
local car_enabled = minetest.settings:get_bool("cloud_items.enable_cloud_car")
if car_enabled or car_enabled == nil then
	loadfile(minetest.get_modpath(minetest.get_current_modname()) .. "/car.lua")(table.copy(car_def))
end

-------------
-- Crafts --
-------------

minetest.register_craft({
	output = "cloud_items:cloud_sword",
	recipe = {
		{"", "cloud_items:cloud_ingot", ""},
		{"", "cloud_items:cloud_ingot", ""},
		{"", "group:stick", ""},
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
		{"", "cloud_items:cloud_ingot", ""},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
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

-- Multitools support for crafting
if minetest.get_modpath("multitools") then
	minetest.register_craft({
		output = "cloud_items:multitool_cloud",
		recipe = {
			{"", "cloud_items:cloud_shovel", ""},
			{"cloud_items:cloud_axe", "cloud_items:cloud_pickaxe", "cloud_items:cloud_sword"},
		}
	})
end

-- Decoration block
minetest.register_craft({
	output = "cloud_items:decoration_block 7",
	recipe = {
		{"cloud_items:cloud_ingot", "cloud_items:cloud_ingot", ""},
		{"cloud_items:cloud_ingot", "cloud_items:cloud_ingot", ""},
		{"", "", ""},
	}
})

-- Cooking
minetest.register_craft({
	type = "cooking",
	output = "cloud_items:cloud_ingot",
	recipe = "cloud_items:cloud_lump",
	cooktime = 30,
})

-----------------------
-- 3D Armor support --
-----------------------

if minetest.get_modpath("3d_armor") then
	armor:register_armor("cloud_items:helmet_cloud", {
		description = S("Cloud Helmet"),
		inventory_image = "cloud_items_inv_helmet_cloud.png",
		groups = {armor_head=1, armor_heal=16, armor_use=70},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=2, snappy=1, level=6},
	})

	armor:register_armor("cloud_items:leggings_cloud", {
		description = S("Cloud Leggings"),
		inventory_image = "cloud_items_inv_leggings_cloud.png",
		groups = {armor_legs=1, armor_heal=16, armor_use=70},
		armor_groups = {fleshy=30},
		damage_groups = {cracky=2, snappy=1, level=6},
	})

	armor:register_armor("cloud_items:chestplate_cloud", {
		description = S("Cloud Chestplate"),
		inventory_image = "cloud_items_inv_chestplate_cloud.png",
		groups = {armor_torso=1, armor_heal=16, armor_use=70},
		armor_groups = {fleshy=30},
		damage_groups = {cracky=2, snappy=1, level=6},
	})

		armor:register_armor("cloud_items:boots_cloud", {
		description = S("Cloud Boots"),
		inventory_image = "cloud_items_inv_boots_cloud.png",
		groups = {armor_feet=1, armor_heal=16, armor_use=70, physics_speed=1,
				physics_jump=0.5},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=2, snappy=1, level=6},
	})

	if minetest.get_modpath("shields") then
		armor:register_armor("cloud_items:shield_cloud", {
			description = S("Cloud Shield"),
			inventory_image = "cloud_items_inv_shield_cloud.png",
			groups = {armor_shield=1, armor_heal=12, armor_use=70},
			armor_groups = {fleshy=10},
			damage_groups = {cracky=2, snappy=1, level=6},
		})

		minetest.register_craft({
			output = "cloud_items:shield_cloud",
			recipe = {
				{"cloud_items:cloud_ingot", "cloud_items:cloud_ingot", "cloud_items:cloud_ingot"},
				{"cloud_items:cloud_ingot", "cloud_items:cloud_ingot", "cloud_items:cloud_ingot"},
				{"", "cloud_items:cloud_ingot", ""}
			}
		})
	end

	-- Support for 3D Armor Gloves/Gauntlets
	if minetest.get_modpath("3d_armor_gloves") then
		armor:register_armor("cloud_items:gloves_cloud", {
			description = S("Cloud Gauntlets"),
			inventory_image = "cloud_items_inv_gloves_cloud.png",
			groups = {armor_hands=1, armor_heal=12, armor_use=70},
			armor_groups = {fleshy=10},
			damage_groups = {cracky=2, snappy=1, level=6},
		})

		minetest.register_craft({
			output = "cloud_items:gloves_cloud",
			recipe = {
				{"cloud_items:cloud_ingot", "", "cloud_items:cloud_ingot"},
				{"farming:string", "", "farming:string"},
			},
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
