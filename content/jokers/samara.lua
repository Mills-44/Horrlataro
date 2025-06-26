-- LOAD ATLAS/SOUNDS FOR JOKER
SMODS.Atlas {
    key  = 'samara',
    path = 'samara.png',
    px   = 71, 
    py   = 95, 
}

SMODS.Sound {
    key  = 'ring', 
    path = 'ring.ogg', 
    volume = 1.0, 
    pitch = 1.0 
}


SMODS.Joker {
    key = 'samara',
    atlas = 'samara',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            checker = 7,
            ring_activate = 7,
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
            key = 'seven_days',
            vars = {
              card.ability.extra.checker
            }
        }
        return {
            vars = {
                (G.GAME.probabilities.normal or 1),
                card.ability.extra.ring_activate,
            }
        }  
    end,
    calculate = function(self, card, context)
        if context.before then
            for i, v in ipairs(context.full_hand) do
                if v:get_id() == 2 or 
                   v:get_id() == 3 or 
                   v:get_id() == 4 or
                   v:get_id() == 5 or
                   v:get_id() == 6 or
                   v:get_id() == 8 or
                   v:get_id() == 9 or
                   v:get_id() == 10 or
                   v:get_id() == 11 or
                   v:get_id() == 12 or
                   v:get_id() == 13 or
                   v:get_id() == 14 then 
                    return false                   
                   else
                card.ability.extra.checker = card.ability.extra.checker - 1
                return true
            end
        end
        if card.ability.extra.checker == 0 then
            card.ability.extra.checker = 7
            G.E_MANAGER:add_event(Event({
                    trigger = 'after', 
                    delay = 0.15,
                    func = function()
                        local newcard1 SMODS.add_card {
                        set = 'Playing Card',              
                        }
                        local newcard2 SMODS.add_card {
                        set = 'Playing Card',              
                        }
                        local newcard3 SMODS.add_card {
                        set = 'Playing Card',              
                        }
                        local newcard4 SMODS.add_card {
                        set = 'Playing Card',              
                        }
                        local newcard5 SMODS.add_card {
                        set = 'Playing Card',              
                        }
                        local newcard6 SMODS.add_card {
                        set = 'Playing Card',              
                        }
                        local newcard7 SMODS.add_card {
                        set = 'Playing Card',              
                        }
                        local chosen_enhancement = pseudorandom_element(HORROR.BASE_ENHANCEMENT, pseudoseed('choice'))
                        local edition = pseudorandom_element(HORROR.BASE_EDITIONS, pseudoseed('christy_joker'))
                        local chosen_seal = pseudorandom_element(HORROR.BASE_SEALS, pseudoseed('choice'))
                        
                        newcard1:set_ability("m_" .. chosen_enhancement)
                        newcard1:set_edition("e_" .. edition, nil, true)
                        newcard1:set_seal(chosen_seal, nil, true)
                        
                        newcard2:set_ability("m_" .. chosen_enhancement)
                        newcard2:set_edition("e_" .. edition, nil, true)
                        newcard2:set_seal(chosen_seal, nil, true)
                        
                        newcard3:set_ability("m_" .. chosen_enhancement)
                        newcard3:set_edition("e_" .. edition, nil, true)
                        newcard3:set_seal(chosen_seal, nil, true)

                        newcard4:set_ability("m_" .. chosen_enhancement)
                        newcard4:set_edition("e_" .. edition, nil, true)
                        newcard4:set_seal(chosen_seal, nil, true)

                        newcard5:set_ability("m_" .. chosen_enhancement)
                        newcard5:set_edition("e_" .. edition, nil, true)
                        newcard5:set_seal(chosen_seal, nil, true)

                        newcard6:set_ability("m_" .. chosen_enhancement)
                        newcard6:set_edition("e_" .. edition, nil, true)
                        newcard6:set_seal(chosen_seal, nil, true)

                        newcard7:set_ability("m_" .. chosen_enhancement)
                        newcard7:set_edition("e_" .. edition, nil, true)
                        newcard7:set_seal(chosen_seal, nil, true)
                    return true
                end
                }))
        end
    end
        if context.individual and context.cardarea == G.play then
            local seven = context.other_card
            if seven:get_id() == 7 then
                if (pseudorandom('horror_samara') < G.GAME.probabilities.normal / card.ability.extra.ring_activate ) then
                    if SMODS.has_enhancement(seven, nil) then
                        local chosen_enhancement = pseudorandom_element(HORROR.BASE_ENHANCEMENT, pseudoseed('choice'))
                        seven:set_ability("m_" .. chosen_enhancement)
                    elseif seven.edition == nil then 
                        local edition = pseudorandom_element(HORROR.BASE_EDITIONS, pseudoseed('christy_joker'))
                        seven:set_edition("e_" .. edition, nil, true)
                    else
                        local chosen_seal = pseudorandom_element(HORROR.BASE_SEALS, pseudoseed('choice'))
                        seven:set_seal(chosen_seal, nil, true)
                    end
                    G.E_MANAGER:add_event(Event({
                    trigger = 'after', 
                    delay = 0.15,
                    func = function()
                        play_sound('timpani')
                        seven:juice_up(0.3, 0.3)
                        return true
                    end
                }))
                end
            end
        end
    end
}