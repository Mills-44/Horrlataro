-- LOAD ATLAS/SOUNDS FOR JOKER
SMODS.Atlas {
    key  = 'xeno',
    path = 'xeno.png',
    px   = 71, 
    py   = 95, 
  }

SMODS.Joker {
    key = 'xeno',
    atlas = 'xeno',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
        },
    },
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
            vars = {
            }
        }
        return {
            vars = {
            }
        }  
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 11 or context.other_card:get_id() == 12 then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after', 
                    delay = 0.4, 
                    func = function()
                        local card = context.other_card
                        card:flip()
                        card:juice_up(0.3, 0.5) 
                        assert(SMODS.change_base(card, nil, 'King'))
                        card:flip()
                        return true 
                    end
                }))
            end
        end
         if context.main_scoring then
             if next(context.poker_hands['Five Of A Kind']) then
                local king_check = false
                local king_amount = 0
                local heart_check = false
                local heart_amount = 0
                local spade_check = false
                local spade_amount = 0
                local diamond_check = false
                local diamond_amount = false
                local club_check = false
                local club_amount = false
                for i = 1. #context.scoring_hand do
                    if context.scoring_hand[i]:get_id() == 13 then 
                        king_amount = king_amount + 1
                    end
                    if context.scoring_hand[i]:is_suit("Hearts") then
                        heart_amount = heart_amount + 1
                    elseif context.scoring_hand[i]:is_suit("Spades") then
                        spade_amount = spade_amount + 1
                    elseif context.scoring_hand[i]:is_suit("Diamonds") then
                        diamond_amount = diamond_amount + 1
                    elseif context.scoring_hand[i]:is_suit("Clubs") then
                        club_amount = club_amount + 1
                    end
                end
                if king_amount == 5 and (heart_amount == 5 or club_amount == 5 or spade_amount == 5 or diamond_amount == 5 ) then
                     G.E_MANAGER:add_event(Event({
                        trigger = 'after', 
                        delay = 0.4, 
                        func = function()
                            local chosen_joker = pseudorandom_element(HORROR.XENO_JOKERS, pseudoseed('choice'))
                            local card = create_card("Joker", G.jokers, nil, nil, nil, nil, nil, 'j_'.. chosen_joker )       
                            card:add_to_deck()
                            G.jokers:emplace(card)
                            card:juice_up(0.3, 0.5) 
                        return true
                    end
                }))
                end
                end
             end
        end
    end
}