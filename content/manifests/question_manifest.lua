HORROR.Manifest {
    key = 'question_manifest',
    badge_colour = HEX("123287"),
    atlas = 'question_mark',
    pos = { x = 0, y = 0 },
    config = { 
        mult = 0
    },
    card_compat = true,
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                card.ability.mult 
            } 
        }
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local poker_hand_times = (G.GAME.hands[context.scoring_name].played or 0)
            card.ability.mult =  card.ability.mult + poker_hand_times
            return {
                mult = card.ability.mult 
            }
        end
    end
}