-- LOAD ATLAS/SOUNDS FOR JOKER
SMODS.Atlas {
    key  = 'pinwie',
    path = 'pinwie.png',
    px   = 71, 
    py   = 95, 
  }

SMODS.Joker {
    key = 'pinwie',
    atlas = 'pinwie',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            booster_slots = 1,
            card_slots = 1,
            boosters_bought = 15
        },
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
            key = 'box',
            vars = {
                card.ability.extra.boosters_bought
                }
        }
        return {
            vars = {
                card.ability.extra.booster_slots,
                card.ability.extra.card_slots,
            }
        }  
    end,
    add_to_deck = function(self, card, from_debuff)
       SMODS.change_booster_limit(card.ability.extra.booster_slots)
       change_shop_size(-card.ability.extra.card_slots)
    end,
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_booster_limit(-card.ability.extra.booster_slots)
        change_shop_size(card.ability.extra.card_slots)
    end,
    calculate = function(self, card, context)
        if context.open_booster then
            card.ability.extra.boosters_bought = card.ability.extra.boosters_bought - 1
            if card.ability.extra.boosters_bought == 0 then
                card.ability.extra.boosters_bought = 15
                if HORROR.random_chance(.5) then
                    SMODS.change_booster_limit(card.ability.extra.booster_slots)
                    return {
                        message = "+1 Booster Slot!"
                    }
                else
                    change_shop_size(card.ability.extra.card_slots)
                    return {
                        message = "+1 Shop Slot!"
                    }
                end
            end
        end
    end
}