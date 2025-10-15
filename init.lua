

print("Loading industrial_dawn mod...")

local modpath = minetest.get_modpath(minetest.get_current_modname())

dofile(modpath .. "/items.lua")
dofile(modpath .. "/nodes.lua")
dofile(modpath .. "/decorations.lua")
dofile(modpath .. "/easymeta.lua")

init_mod_storage({
    isWearingGloves = false,
    playerArmor = {
        helmet = "none"
    }
})






