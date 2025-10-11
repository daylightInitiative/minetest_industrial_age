

print("Loading industrial_dawn mod...")


minetest.register_alias("bucket_rubber", "industrial_dawn:bucket_rubber")
minetest.register_alias("rubber_tree_leaves", "industrial_dawn:rubber_tree_leaves")

minetest.register_node("industrial_dawn:rubber_tree", {
	description = "Rubber Tree",
	tiles = {"industrial_dawn_rubber_tree_top_v2.png", "industrial_dawn_rubber_tree_top_v2.png",
		"industrial_dawn_rubber_tree_v2.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("industrial_dawn:rubber_tree_leaves", {
    description = "Rubber Tree Leaves",
    waving = 1,
    paramtype = "light",
    drawtype = "allfaces_optional",
    is_ground_content = false,
    tiles = {"industrial_dawn_rubber_tree_leaves_v2.png"},
    drop = {
		max_items = 1,
		items = {
			--{items = {"default:junglesapling"}, rarity = 20}, sapling
			{items = {"industrial_dawn:rubber_tree_leaves_v2"}}
		}
	},
    sounds = default.node_sound_leaves_defaults(),
    groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
})

minetest.register_decoration({
    name = "default:rubber_tree",
    deco_type = "schematic",
    place_on = {"default:dirt_with_rainforest_litter"},
    sidelen = 80,
    fill_ratio = 0.06,
    biomes = {"rainforest", "rainforest_under", "rainforest_ocean"},
    y_max = 31000,
    y_min = 1,
    schematic = minetest.get_modpath("industrial_dawn") .. "/schematics/industrial_dawn_rubber_tree.mts",
    flags = "place_center_x, place_center_z",
    rotation = "random",
})

minetest.register_node("industrial_dawn:rubber_block", {
    description = "This is a node",
    tiles = {"mymod_node.png"},
    groups = {cracky = 1}
})

minetest.register_craftitem("industrial_dawn:bucket_rubber", {
    description = "Unprocessed rubber bucket",
    inventory_image = "industrial_dawn_bucket_rubber.png"
})

minetest.register_craft({
    type = "shapeless",
    output = "industrial_dawn:rubber_block 3",
    recipe = { "default:dirt" },
})