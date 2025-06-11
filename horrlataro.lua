HORROR = {}

--Load Lib Files
SMODS.load_file("lib/game_adds.lua")() -- Definitions 
SMODS.load_file("lib/utils.lua")() -- Utility functions built

Horrlataro = SMODS.current_mod

-- Load Killer Jokers
HORROR.file_loader(HORROR.JOKERS, "content/jokers")

-- Manifests Class Creation 
Horrlataro.Manifest = SMODS.Sticker:extend{
    rate = 0.0,
    should_apply = false,
    prefix_config = { key = false },
    card_compat = true,
    draw = function(self, card) -- No Shine
		G.shared_stickers[self.key].role.draw_major = card
		G.shared_stickers[self.key]:draw_shader("dissolve", nil, nil, nil, card.children.center)
	end,
    added = function(self, card) end,
    removed = function(self, card) end,
}
-- Task Rewards Consumables
Horrlataro.Task = SMODS.Consumable:extend{
    set = "Task",
    discovered = false,
	should_apply = false,
	cost = 3,
    config = { 
        max_highlighted = 1, 
        sticker_id = "no_manifest" 
    },
    loc_vars = function(self, info_queue)
        info_queue[#info_queue + 1] = { key = self.config.sticker_id, set = "Other", vars = {} }
        return { vars = { self.config.max_highlighted } }
    end,
    can_use = function(self, card) return Horrlataro.can_manifest(self, card) end,
    use = function(self, card, area, copier) Horrlataro.manifest(self, card, area, copier) end,
}