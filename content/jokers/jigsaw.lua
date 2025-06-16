-- LOAD ATLAS/SOUNDS FOR JOKER
SMODS.Atlas {
    key  = 'jigsaw',
    path = 'jigsaw.png',
    px   = 71, 
    py   = 95, 
  }

  SMODS.Sound {
    key  = 'jigsaw_laugh', 
    path = 'jigsaw_laugh.ogg', 
    volume = 1.0, 
    pitch = 1.0 
}

SMODS.Joker {
    key = 'jigsaw',
    atlas = 'jigsaw',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            xmult = 1,
            tracker = 0
        },
        odds = 6,
    },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = false, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {
            set = 'Other',
            key = 'game',
            vars = {
              card.ability.extra.tracker
            }
        }
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.odds
            }
        }  
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local xmult_bonus = 0
                if context.other_card:get_id() == 6 then
                    xmult_bonus = xmult_bonus + .06 
                    if (pseudorandom('horror_jigsaw') < 1 / 6 ) then
                        ease_dollars(-(math.max(0,math.min((G.GAME.dollars * .5)))))
                        play_sound('horror_jigsaw_laugh')
                end
                return {
                message = "+X.06!",
                colours = G.C.MULT
                }
            end
            card.ability.extra.xmult = card.ability.extra.xmult +  xmult_bonus
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
        if context.selling_card and context.cardarea == G.jokers then
            card.ability.extra.tracker =  card.ability.extra.tracker + 1
            if card.ability.extra.tracker == 25 then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        local chosen_joker = pseudorandom_element(HORROR.LEGENDARY_JOKERS_POOL, pseudoseed('choice'))
                        local game = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_'.. chosen_joker)
                        game:add_to_deck()
                        G.jokers:emplace(game)
                        card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
                 card.ability.extra.tracker = 0
            end
        end
    end
}