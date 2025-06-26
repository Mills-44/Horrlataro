-- LOAD ATLAS/SOUNDS FOR JOKER
SMODS.Atlas {
    key  = 'christy',
    path = 'christy.png',
    px   = 71, 
    py   = 95, 
}

SMODS.Joker {
    key = 'christy',
    atlas = 'christy',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            mult_tracker = 35,
            mult = 5,
            mult_gain = 0,
            mult_checker = 0
        }
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
            key = 'auto',
            vars = {
              card.ability.extra.mult_tracker
            }
        }
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.mult_gain
            }
        }  
    end,
    calculate = function(self, card, context)
         if context.discard and context.other_card:is_suit("Hearts") then
                card.ability.extra.mult_gain = 0
                card.ability.extra.mult_checker = 0
                return {
                    message = "Reset!",
                    colour = G.C.FILTER
                }
         end
         if context.joker_main then
            card.ability.extra.mult_gain = card.ability.extra.mult_gain + card.ability.extra.mult
            card.ability.extra.mult_checker =  card.ability.extra.mult_checker +  card.ability.extra.mult
            return {
                mult = card.ability.extra.mult_gain
            }
         end
         if card.ability.extra.mult_checker == 35 then
            card.ability.extra.mult_checker = card.ability.extra.mult_checker - 35
            card.ability.extra.mult_tracker = card.ability.extra.mult_tracker + 35
            local jokers = {}
                for k, v in ipairs(G.jokers.cards) do
                    if not v.edition then 
                        jokers[#jokers + 1] = v                
                    end
                    local joker = pseudorandom_element(jokers, pseudoseed('christy_joker'))
                    joker:set_edition("e_negative", nil, true)
                    break
                end
            end
        end
}