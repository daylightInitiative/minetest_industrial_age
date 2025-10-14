
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