-- LOAD ATLAS/SOUNDS FOR JOKER
SMODS.Atlas {
    key  = 'ghosty',
    path = 'ghosty.png',
    px   = 71, 
    py   = 95, 
  }

HORROR.GHOSTY_JOKER = {
    "scary_movie",
    "favorite_movie",
    "where_am_i"
}

for _, key in ipairs(HORROR.GHOSTY_JOKER) do
SMODS.Sound {
    key  = key, 
    path = key .. '.ogg', 
    volume = 1.5, 
    pitch = 1.0 
}
end

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
            chips = 0,
            chip_pair = 5
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
                card.ability.extra.chip_pair,
                card.ability.extra.chips,
            }
        }  
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local poker_hand_times = (G.GAME.hands[context.scoring_name].played or 0)
            card.ability.extra.tracker = card.ability.extra.tracker + poker_hand_times
            if next(context.poker_hands['Pair']) then
                card.ability.extra.chips = card.ability.extra.chips + 5
            end
            if HORROR.random_chance(.33) then
                play_sound('horror_scary_movie')
            elseif HORROR.random_chance(.66) then
                play_sound('horror_favorite_movie')
            else
                play_sound('horror_where_am_i')
            end
            return {
                chips = card.ability.extra.chips
            }
       end
       if context.end_of_round and context.cardarea == G.jokers then
        if (pseudorandom('horror_ghosty') < card.ability.extra.tracker / 100 ) then
             G.E_MANAGER:add_event(Event({
                trigger = 'after', 
                delay = 0.4, 
                func = function()
                local card = create_card('Task', G.consumeables, nil, nil, nil, nil, 'c_horror_pop_quiz' )       
                card:add_to_deck()
                G.consumeables:emplace(card)
                card:juice_up(0.3, 0.5) 
        return true
    end
    }))
    card.ability.extra.tracker = 0
        else 
            return {
                message = "Nope!",
                colours = G.C.MULT
            }
       end
       end
    end
}