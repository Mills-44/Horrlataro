-- LOAD ATLAS/SOUNDS FOR JOKER
SMODS.Atlas {
    key  = 'penny',
    path = 'penny.png',
    px   = 71, 
    py   = 95, 
  }

SMODS.Joker {
    key = 'penny',
    atlas = 'penny',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
        tracker = 3,
        retrig  = 1,
        },
    },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = false, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {
            set = 'Other',
            key = 'float',
            vars = {
              card.ability.extra.tracker
            }
        }
        return {
            vars = {
               card.ability.extra.retrig
            }
        }  
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit("Hearts") then
            if context.repetition then
                return {
                    repetitions = card.ability.extra.retrig
                }
            end
        end
        if context.skip_blind then
            card.ability.extra.tracker = card.ability.extra.tracker - 1
            if card.ability.extra.tracker == 0 then
                card.ability.extra.retrig = card.ability.extra.retrig + 2
                card.ability.extra.tracker = 3
            end
        end
    end
  }