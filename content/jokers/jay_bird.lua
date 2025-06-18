-- LOAD ATLAS/SOUNDS FOR JOKER
SMODS.Atlas {
    key  = 'jay_bird',
    path = 'jay_bird.png',
    px   = 71, 
    py   = 95, 
  }

SMODS.Sound {
    key  = 'jason', 
    path = 'jason.ogg', 
    volume = 1.0, 
    pitch = 1.0 
}

SMODS.Joker {
    key = 'jay_bird',
    atlas = 'jay_bird',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            mult = 13,
            chips = 6
        },
    },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = false, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {
            set = 'Other',
            key = 'counselor',
            vars = {}
        }
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.chips,
            }
        }  
    end,
    calculate = function(self, card, context)
        local has_three = 0
        local has_ten = 0
        if context.joker_main then
			for i = 1, #context.full_hand do
				if context.full_hand[i]:get_id() == 3 then
					has_three = has_three + 1
				elseif context.full_hand[i]:get_id() == 10 then
					has_ten = has_ten + 1
				end
			end
			if has_three > 0 and has_ten > 0 then
                play_sound('horror_jason')
				return { 
                    mult = card.ability.extra.mult,
                    card = card
                 }
			end
        end
           if context.individual and context.cardarea == G.play then
                if context.other_card:get_id() == 6 then
                     return {
                        chips = card.ability.extra.chips
                    }
                end
            end
            if context.setting_blind then
                local check = false
                for _, v in ipairs(G.jokers.cards) do
                    if HORROR.lusty_check(v) then
                        check = true
                    end
                end
                if check then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after', 
                        delay = 0.4, 
                        func = function()
                            local chosen_joker = pseudorandom_element(HORROR.JASON_JOKERS, pseudoseed('choice'))
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
}

