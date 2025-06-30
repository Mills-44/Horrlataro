-- LOAD ATLAS/SOUNDS FOR JOKER
SMODS.Atlas {
    key  = 'mikey',
    path = 'mikey.png',
    px   = 71, 
    py   = 95, 
  }

SMODS.Sound {
    key  = 'mikey', 
    path = 'mikey.ogg', 
    volume = 1.0, 
    pitch = 1.0 
}

SMODS.Joker {
    key = 'mikey',
    atlas = 'mikey',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            mike_times = 0
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
            key = 'halloween',
            vars = {
            }
        }
        return {
            vars = {
            }
        }  
    end,
    calculate = function(self, card, context)
        if context.discard and context.other_card:get_id() == 10 then
            G.GAME.blind.chips = G.GAME.blind.chips * 0.9
			G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
			G.HUD_blind:recalculate()
            card.ability.extra.mike_times = card.ability.extra.mike_times + 1
            if card.ability.extra.mike_times == 5 then 
                card.ability.extra.mike_times = 0
                play_sound('horror_mikey')
                G.E_MANAGER:add_event(Event({
                    trigger = 'after', 
                    delay = 0.4, 
                    func = function()
                    local card = create_card('Task', G.consumeables, nil, nil, nil, nil, 'c_horror_halloween_night')       
                    card:add_to_deck()
                    G.consumeables:emplace(card)
                    card:juice_up(0.3, 0.5) 
        return true
    end
    }))
            end
        end
    end
}

