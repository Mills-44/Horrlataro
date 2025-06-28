HORROR = {}

Horrlataro = SMODS.current_mod
Horrlataro_config = Horrlataro.config
Horrlataro.enabled = copy_table(Horrlataro_config)
Horrlataro_path = SMODS.current_mod.path


--Load Lib Files
SMODS.load_file("lib/game_adds.lua")() -- Definitions 
SMODS.load_file("lib/utils.lua")() -- Utility functions built
SMODS.load_file("lib/hooks.lua")() -- Hooks
SMODS.load_file("lib/ui.lua")() -- UI
SMODS.load_file("lib/manifest_util.lua")()
SMODS.load_file("lib/pools.lua")()

-- Load Cross Mod Compats
if JokerDisplay then
    SMODS.load_file("crossmods/joker_display.lua")()
end

-- Lovely Fixes
SMODS.load_file("lovely/fixes.toml")

-- Load Killer Jokers
HORROR.file_loader(HORROR.JOKERS, "content/jokers")

-- Load Tasks
HORROR.file_loader(HORROR.TASKS, "content/tasks")

-- Load Manifests
HORROR.file_loader(HORROR.MANIFESTS, "content/manifests")

-- Task Consumable Type
SMODS.ConsumableType{
	key = "Task",
    primary_colour = HEX("0f6c09"),
    secondary_colour = HEX("0f6c09"),
    collection_rows = { 4, 4 },
    shop_rate = 0.0,
    loc_txt = {
        collection = "Task Cards",
        name = "Task",
        label = "Task",
    },
    default = "c_horror_pop_quiz",
    can_stack = true,
    can_divide = true
}

SMODS.Atlas {
    key  = 'modicon',
    path = 'modicon.png',
    px   = 32, 
    py   = 32, 
  }