-- LOAD ATLAS/SOUNDS FOR JOKER
SMODS.Atlas {
    key  = 'quiet',
    path = 'quiet.png',
    px   = 71, 
    py   = 95, 
  }

SMODS.Joker {
    key = 'quiet',
    atlas = 'quiet',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            xmult = 5,
            xmult_lose = 1,
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
            key = 'tiptoe',
            vars = {
            }
        }
        return {
            vars = {
                card.ability.extra.xmult_lose,
                card.ability.extra.xmult,
            }
        }  
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            card.ability.extra.xmult = card.ability.extra.xmult - card.ability.extra.xmult_lose
            return {
                message = "-1X Mult",
                colour = G.C.MULT
            }
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
        if context.after then
         card.ability.extra.xmult = 5
        end
    end
}