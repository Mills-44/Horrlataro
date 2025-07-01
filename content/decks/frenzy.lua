-- LOAD ATLAS FOR DECKS
SMODS.Atlas {
    key  = 'frenzy_deck',
    path = 'frenzy_deck.png',
    px   = 71, 
    py   = 95, 
}

SMODS.Back {
    key = 'frenzy_deck',
    atlas = 'frenzy_deck',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        voucher = 'v_horror_puzzle_box',
    },
    apply = function(self)
        G.E_MANAGER:add_event(Event({
          func = function()
            local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_horror_pinwie', nil)
            card:add_to_deck()
            G.jokers:emplace(card)
            return true
          end
        }))
    end
}