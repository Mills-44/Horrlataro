-- LOAD ATLAS/SOUNDS FOR JOKER
SMODS.Atlas {
    key  = 'jigsaw',
    path = 'jigsaw.png',
    px   = 71, 
    py   = 95, 
  }

SMODS.Joker {
    key = 'jigsaw',
    atlas = 'jigsaw',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            xmult = 1,
            tracker = 0
        },
        odds = 6,
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
            key = 'game_over',
            vars = {
              card.ability.extra.tracker
            }
        }
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.odds
            }
        }  
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            for i, k in ipairs(context.scoring_hand) do
                if context.other_card:get_id() == 6 then
                    card.ability.extra.xmult = card.ability.extra.xmult + .5
                    if (pseudorandom('horror_jigsaw') < 1 / 6 ) then
                        ease_dollars(math.max(0,math.min((G.GAME.dollars * .5))))
                    end
                end
            end
            return {
                message = "+X.5!",
                colours = G.C.MULT
            }
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}