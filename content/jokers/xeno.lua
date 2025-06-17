-- LOAD ATLAS/SOUNDS FOR JOKER
SMODS.Atlas {
    key  = 'xeno',
    path = 'xeno.png',
    px   = 71, 
    py   = 95, 
  }

SMODS.Sound {
    key  = 'alien', 
    path = 'alien.ogg', 
    volume = 1.0, 
    pitch = 1.0 
}

SMODS.Joker {
    key = 'xeno',
    atlas = 'xeno',
    pos = {
        x = 0,
        y = 0
    },
    config = {},
    rarity = 2,
    cost = 7,
    unlocked = true,
    discovered = false, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {
            set = 'Other',
            key = 'chest',
            vars = {}
        }
        return {
            vars = {}
        }  
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 11 or context.other_card:get_id() == 12 then
                assert(SMODS.change_base(context.other_card, nil, 'King'))
            end
        end
         if context.before then
             if next(context.poker_hands['Flush Five']) then
                play_sound('horror_alien')
                G.E_MANAGER:add_event(Event({
                    trigger = 'after', 
                    delay = 0.4, 
                    func = function()
                        card:flip()
                        card:juice_up(.3,.5)
                        card:flip()
                return true
                end
            }))
                     G.E_MANAGER:add_event(Event({
                        trigger = 'after', 
                        delay = 0.4, 
                        func = function()
                            local chosen_joker = pseudorandom_element(HORROR.XENO_JOKERS, pseudoseed('choice'))
                            local card = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_'.. chosen_joker)       
                            card:add_to_deck()
                            G.jokers:emplace(card)
                            card:juice_up(0.3, 0.5) 
                        return true
                    end
                }))
                end
            end
    end
}