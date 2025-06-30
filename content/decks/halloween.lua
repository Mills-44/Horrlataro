-- LOAD ATLAS FOR DECKS
SMODS.Atlas {
    key  = 'halloween_deck',
    path = 'halloween_deck.png',
    px   = 71, 
    py   = 95, 
}

SMODS.Back {
    key = 'halloween_deck',
    atlas = 'halloween_deck',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        tens = '10',
        three = '3',
        Aces = 'Ace'
    },
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, card in ipairs(G.playing_cards) do
                    local ranks = HORROR.HALLOWEEN_DECK[math.random(#HORROR.HALLOWEEN_DECK)]
                    assert(SMODS.change_base(card, nil, ranks))
                end
                return true
            end
        }))
    end
}