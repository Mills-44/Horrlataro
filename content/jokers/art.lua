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
            money = 1,
            art_double = 0
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
                card.ability.extra.art_double
            }
        }
        return {
            vars = {
                card.ability.extra.money
            }
        }  
    end,
    calculate = function(self, card, context)
        if context.skipping_booster then
            card.ability.extra.art_double = card.ability.extra.art_double + 1
            for k, v in ipairs(G.jokers.cards) do
                if v.set_cost then 
                    v.ability.extra_value = (v.ability.extra_value or 0) + card.ability.extra.money
                    v:set_cost()
                end
            end
            if card.ability.extra.art_double == 5 then
                card.ability.extra.art_double = 0
                card.ability.extra.money = card.ability.extra.money * 2
            end
            return {
                message = "+$" .. tostring(card.ability.extra.money),
                colour = G.C.GOLD
            }
        end
    end
}

