-- LOAD ATLAS/SOUNDS FOR JOKER
SMODS.Atlas {
    key  = 'art',
    path = 'art.png',
    px   = 71, 
    py   = 95, 
  }

SMODS.Joker {
    key = 'art',
    atlas = 'art',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            art_total = 0,
        },
    },
    rarity = 1,
    cost = 5,
    unlocked = true,
    discovered = false, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {
            set = 'Other',
            key = 'clowning_around',
            vars = {
                card.ability.extra.art_total
            }
        }
        return {
            vars = {
            }
        }  
    end,
    calculate = function(self, card, context)
        if context.end_of_round then
            local requirement = (G.GAME.blind.chips * 1.3)
            if requirement == G.GAME.blind.chips then 
                return {
                    message = "hi!"
                }
        end
    end
    end
}

