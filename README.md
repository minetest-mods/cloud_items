# Cloud Items

![Screenshot](https://user-images.githubusercontent.com/51391473/87363638-328a0280-c537-11ea-9e90-f992cbc13ab4.png)

[![Build status](https://github.com/minetest-mods/cloud_items/workflows/build/badge.svg)](https://github.com/minetest-mods/cloud_items/actions)
[![ContentDB](https://content.minetest.net/packages/Panquesito7/cloud_items/shields/downloads/)](https://content.minetest.net/packages/Panquesito7/cloud_items/)
[![License](https://img.shields.io/badge/license-LGPLv2.1%2B-blue.svg)](https://www.gnu.org/licenses/old-licenses/lgpl-2.1.en.html)
[![Donate](https://liberapay.com/assets/widgets/donate.svg)](https://liberapay.com/Panquesito7/donate)

Adds powerful cloud tools for Minetest.  
Stronger than diamond and other materials.  

## Installation

- Unzip the archive, rename the folder to `cloud_items` and
place it in .. minetest/mods/

- GNU/Linux: If you use a system-wide installation place
    it in ~/.minetest/mods/.

- If you only want this to be used in a single world, place
    the folder in .. worldmods/ in your world directory.

For further information or help, see:\
<https://wiki.minetest.net/Installing_Mods>

## Features

Take a look at this mod's features.\
Have any questions/comments? Submit an [issue](https://github.com/minetest-mods/cloud_items/issues/new) or [contact me](mailto:halfpacho@gmail.com).

### Difference beetwen normal ores

This "ore", doesn't spawn underground!\
Instead, it spawns at the sky; that's why it's called "cloud".

An ore will be spawned somewhere in the schematic!\
You'll have certain probabilities to have an ore or not!

- For small clouds: 2.5% of getting an ore per node.
- For medium clouds: 5% of getting an ore per node.
- For big clouds: 7.5% of getting an ore per node.

Small schematic
![Small schematic](https://user-images.githubusercontent.com/51391473/69098689-af9fbf00-0a1e-11ea-9e88-c74a6b74baa3.png)

Medium schematic
![Medium schematic](https://user-images.githubusercontent.com/51391473/87362981-bfcc5780-c535-11ea-8caa-018af03e33d1.png)

Big schematic
![Big schematic](https://user-images.githubusercontent.com/51391473/87363085-03bf5c80-c536-11ea-8ab5-155a931e7400.png)

### Vehicles

There are some nice-craftable vehicles you can ride on.\
Here is one screenshot for each of the available vehicles:

![Cloud car](https://user-images.githubusercontent.com/51391473/99441120-13ccbb80-28dd-11eb-9eb1-8af7aa699b02.png)
![Cloud ship](https://user-images.githubusercontent.com/51391473/99441264-424a9680-28dd-11eb-8dba-fb8297fef92b.png)

### Cloud house

If you go above 1500 blocks up, you may find a cloud house!\
This cloud house includes great things such as chests with stuff!

![Cloud house](https://user-images.githubusercontent.com/51391473/88605632-178fb600-d040-11ea-8a38-e107881fb49b.png)
![Cloud house (1st floor)](https://user-images.githubusercontent.com/51391473/88605633-18284c80-d040-11ea-8452-3fd8fbbeb8f6.png)
![Cloud house (2nd floor)](https://user-images.githubusercontent.com/51391473/88605634-18c0e300-d040-11ea-9bc6-ddfd7dcd3a0e.png)

### Types of cloud

There are 4 types of cloud:

- Normal cloud
  - Hard to find.
  - You may find from 1 to 4 ores.
  - Stronger than diamond.
  - Damage: 11
    - Can kill players with 2 hits.
  - Spawns at 200 blocks and above.
- Cloud star (comming soon)
  - Difficult to find.
  - You may find from 1 to 4 ores.
  - Stronger than cloud and diamond.
  - Damage: 12
    - Can kill players with 2 hits.
  - Spawns at 350 blocks and above.  
- Cloud meteor (comming soon)
  - Very hard to find.
  - You may find from 1 to 3 ores.
  - Stronger than cloud (star) and diamond.
  - Damage: 14
    - Can kill players with 2 hits.
  - Spawns at 500 blocks and above.
- Cloud comet (comming soon)
  - Very difficult to find.
  - You may find only 1 ore.
  - Stronger than all materials.
  - Damage: 17
    - Very strong, can kill a player with 2 hits.
  - Spawns at 800 blocks and above.

## Dependencies

- `default` (included in [Minetest Game](https://github.com/minetest/minetest_game))
- [`worldedit`](https://github.com/Uberi/Minetest-WorldEdit)
  - This is required due to the `worldedit.deserialize` function.
- [`vehicle_mash`](https://github.com/minetest-mods/vehicle_mash)

### Optional dependencies

- [`3d_armor`](https://github.com/minetest-mods/3d_armor)
- [`toolranks`](https://github.com/lisacvuk/minetest-toolranks)
- [`moreblocks`](https://github.com/minetest-mods/moreblocks)
- [`multitools`](https://github.com/ChimneySwift/multitools)
- [`3d_armor_gloves`](https://github.com/sirrobzeroone/3d_armor_gloves)
- `stairs` (included in [Minetest Game](https://github.com/minetest/minetest_game))

## Requirements

Cloud Items is currently tested with Minetest 5.4.0-dev.\
Issues may arise if you use older or newer versions.

It shall work with MT 5.0.0 and above, though.

## License

Copyright (C) 2019-2023 Panquesito7, David Leal\
Copyright (C) Various other Minetest developers/contributors

See [`LICENSE.md`](https://github.com/minetest-mods/cloud_items/blob/master/LICENSE.md) for more information.

## Credits

Credits to (in no particular order):

- Various Minetest developers/contributors
- [Brett O'Donnell](https://github.com/cornernote)
  - For the function to load an schematic.

## Issues, suggestions, features & bugfixes

Report bugs or suggest ideas by [creating an issue](https://github.com/minetest-mods/cloud_items/issues/new).\
If you know how to fix an issue, or want something to be added, consider opening a [pull request](https://github.com/minetest-mods/cloud_items/compare).
