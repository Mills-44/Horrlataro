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
        local seven_checker = true
        if context.before then
            for i, v in ipairs(context.scoring_hand) do
                if not card:get_id() == 7 then
                    seven_checker = false
                end
            end
            if seven_checker then 
                card.ability.extra.checker = card.ability.extra.checker - 1
                if card.ability.extra.checker == 0 then
                    card.ability.extra.checker = 7
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            local edition = HORROR.BASE_EDITIONS[math.random(#HORROR.BASE_EDITIONS)]
                            local seal = HORROR.BASE_SEALS[math.random(#HORROR.BASE_SEALS)]
                            local card = SMODS.create_card({
                                set = 'Playing Card',
                                area = G.hand,
                                rank = '7',
                                edition = "e_".. edition,
                                seal = seal, 
                                enhanced_poll = 0.0001
                            })
                            card:set_seal(seal, true)
                            card:add_to_deck()
                            G.hand:emplace(card)
                            card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
                end
            end
        end
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 7 then
                if (pseudorandom('horror_samara') < G.GAME.probabilities.normal / card.ability.extra.ring_activate ) then
                    if HORROR.random_chance(.33) then
                        local seal = pseudorandom_element(HORROR.BASE_SEALS, pseudoseed('samara_seal'))
                        context.other_card:set_seal(seal, true)
                    elseif HORROR.random_chance(.66) then
                        local edition = pseudorandom_element(HORROR.BASE_EDITIONS, pseudoseed('samara_edition'))
                        context.other_card:set_edition("e_" .. edition, nil, true)
                    else
                        local enhancement = pseudorandom_element(HORROR.BASE_ENHANCEMENT, pseudoseed('samara_enhance'))
                        context.other_card:set_edition("m_" .. enhancement, nil, true)
                    end                 
                end
            end
        end
    end
}