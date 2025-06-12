-- LOAD ATLAS/SOUNDS FOR JOKER
SMODS.Atlas {
    key  = 'ghosty',
    path = 'ghosty.png',
    px   = 71, 
    py   = 95, 
  }

SMODS.Joker {
    key = 'ghosty',
    atlas = 'ghosty',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            tracker = 0,
            chips = 0
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
            key = 'pop_quiz',
            vars = {
              card.ability.extra.tracker
            }
        }
        return {
            vars = {
                card.ability.extra.chips
            }
        }  
    end,
    calculate = function(self, card, context)
        if context.joker_main or context.main_scoring then
            local poker_hand_times = (G.GAME.hands[context.scoring_name].played or 0)
            card.ability.extra.tracker = card.ability.extra.tracker + poker_hand_times
            if next(context.poker_hands['Pair']) then
                card.ability.extra.chips = card.ability.extra.chips + 5
            end
            return {
                chips = card.ability.extra.chips 
            }
       end
       if context.end_of_round and context.cardarea == G.jokers then
        if (pseudorandom('horror_ghosty') < G.GAME.probabilities.tracker / 100 ) then
            return {
                
            }
        else 
            return {
                message = "Nope!",
                colours = G.C.MULT
            }
       end
       end
    end
}