



minetest.register_craftitem("industrial_dawn:bucket_rubber", {
    description = "Unprocessed rubber bucket",
    inventory_image = "industrial_dawn_bucket_rubber_v2.png"
})

minetest.register_craftitem("industrial_dawn:latex_sheet", {
    description = "Unvulcanized rubber sheet",
    inventory_image = "industrial_dawn_rubber_sheet.png"
})


minetest.register_craftitem("industrial_dawn:latex_gloves", {
    description = "Latex Gloves",
    inventory_image = "industrial_dawn_rubber_gloves.png",
    on_secondary_use = function(itemstack, user, pointed_thing)
        if user:is_player() then
            local isWearingGloves = meta.get_bool("isWearingGloves")
            local isWearing = not isWearingGloves

            if isWearing == true then
                hands.set_hand(user, "default_hand")
                minetest.chat_send_player(user:get_player_name(), "Took gloves off")
            else
                hands.set_hand(user, "latex_gloves_hand")
                minetest.chat_send_player(user:get_player_name(), "Put gloves on")
            end

            meta.set_bool("isWearingGloves", isWearing)
            
        end
    end,
})

minetest.register_craft({
    type = "shapeless",
    output = "industrial_dawn:latex_gloves",
    recipe = { "industrial_dawn:latex_sheet", "industrial_dawn:latex_sheet" },
})

minetest.register_craft({
    type = "shapeless",
    output = "industrial_dawn:rubber_block 3",
    recipe = { "default:dirt" },
})

dofile(minetest.get_modpath("industrial_dawn") .. "/hands.lua")