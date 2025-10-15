
hands = {}

function hands.register_hand(handstring, def)
  if not handstring then return minetest.log("[hands.register_hand] missing handstring") end

  minetest.register_item(handstring, {
    type = "none",
    wield_image = def.wield_image or "hands_hand.png",
    wield_scale = def.wield_scale or {x=1,y=1,z=2.5},
    tool_capabilities = def.tool_capabilities or {
  		full_punch_interval = 0.9,
  		max_drop_level = 0,
  		groupcaps = {
  			crumbly = {times={[2]=3.00, [3]=0.70}, uses=0, maxlevel=1},
  			snappy = {times={[3]=0.40}, uses=0, maxlevel=1},
  			oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.70}, uses=0}
  		},
  		damage_groups = {fleshy=1},
  	}
  })
end

function hands.set_hand(player, hand_str)

    if hand_str == "default" then
        player:get_inventory():set_size("hand", 0)
        print("set default hand")
        return true
    end

    player:get_inventory():set_size("hand", 1)
    player:get_inventory():set_stack("hand", 1, hand_str)
    print("set hand to " .. hand_str)
    return true
end

-- for testing purposes
minetest.register_chatcommand("sethand", {
    params = "<new_hand> | itemstring",
    description = "Change player's hand.",
    func = function(name, param)
        local player = minetest.get_player_by_name(name)

        hands.set_hand(player, param)
    end,
})

hands.register_hand("industrial_dawn:latex_gloves_hand", {
    wield_image = "hands_latex_gloves.png",
})

hands.register_hand("industrial_dawn:default_hand", {
    wield_image = "hands_hand.png",
})

-- we want the actual item to be different than the worn one
minetest.register_alias("latex_gloves_hand", "industrial_dawn:latex_gloves_hand")
minetest.register_alias("default_hand", "industrial_dawn:default_hand")

-- hands.register_hand("hands:grey", {
--   wield_image = "hands_grey.png",
-- })