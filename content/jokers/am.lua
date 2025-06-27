-- LOAD ATLAS/SOUNDS FOR JOKER
SMODS.Atlas {
    key  = 'am',
    path = 'am.png',
    px   = 71, 
    py   = 95, 
  }

SMODS.Joker {
    key = 'am',
    atlas = 'am',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            mult = 5,
            mult_gain = 0
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
            key = 'scream',
            vars = {
                
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
        if context.setting_blind then
        local target = G.jokers.cards[#G.jokers.cards]
        if target ~= card and not (target.ability.eternal or 
        target.ability.perishable) and target.config.center.eternal_compat then    
            target:set_eternal(true)
            card:juice_up()
            card.ability.extra.mult_gain = card.ability.extra.mult + card.ability.extra.mult_gain
        else 
            G.E_MANAGER:add_event(Event({
                trigger = 'after', 
                delay = 0.4, 
                func = function()
                    local tarot = pseudorandom_element(HORROR.TAROT, pseudoseed('choice'))
                    local card = create_card("Tarot", G.consumeables, nil, nil, nil, nil, 'c_'.. tarot)       
                    card:add_to_deck()
                    G.consumeables:emplace(card)
                    card:juice_up(0.3, 0.5) 
                    return true
                end
                }))
        end
    end
        if context.joker_main then
            for k, v in ipairs(G.jokers.cards) do
                if v.ability.eternal then
                    return {
                        mult = card.ability.extra.mult_gain
                    }
                end
            end
        end
    end
}

