-- LOAD ATLAS/SOUNDS FOR JOKER
SMODS.Atlas {
    key  = 'jawetto',
    path = 'jawetto.png',
    px   = 71, 
    py   = 95, 
}

SMODS.Sound {
    key  = 'jaws', 
    path = 'jaws.ogg', 
    volume = 1.0, 
    pitch = 1.0 
}


SMODS.Joker {
    key = 'jawetto',
    atlas = 'jawetto',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            checker = 5,
            tracker = 1,
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
            key = 'boat',
            vars = {
              card.ability.extra.checker
            }
        }
        return {
            vars = {
                (G.GAME.probabilities.normal or 1),
                card.ability.extra.tracker,
            }
        }  
    end,
    calculate = function(self, card, context)    
    if context.selling_self then
        if (pseudorandom('horror_jawetto') < G.GAME.probabilities.normal / card.ability.extra.tracker ) then
             G.E_MANAGER:add_event(Event({
                trigger = 'after', 
                delay = 0.4, 
                func = function()
                    play_sound('horror_jaws')
                    local newcard = SMODS.add_card {
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_horror_jawetto'
                }
                newcard.ability.extra.tracker = card.ability.extra.tracker + 1
                if newcard.ability.extra.tracker == 5 then
                    newcard.ability.extra.tracker = 1
                    G.hand:change_size(5)
                end
                return true
            end
        }))
        end
        if G.STATE ~= G.STATES.SELECTING_HAND then
            return
        end
        G.GAME.chips = G.GAME.blind.chips
        G.STATE = G.STATES.HAND_PLAYED
        G.STATE_COMPLETE = true
        end_round()
    end
    
end
}