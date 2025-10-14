
hands.register_hand("industrial_dawn:latex_gloves_hand", {
    wield_image = "hands_latex_gloves.png",
})

-- we want the actual item to be different than the worn one
minetest.register_alias("latex_gloves_hand", "industrial_dawn:latex_gloves_hand")

-- hands.register_hand("hands:grey", {
--   wield_image = "hands_grey.png",
-- })