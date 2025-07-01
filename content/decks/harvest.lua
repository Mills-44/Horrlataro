-- LOAD ATLAS FOR DECKS
SMODS.Atlas {
    key  = 'harvest_deck',
    path = 'harvest_deck.png',
    px   = 71, 
    py   = 95, 
}

SMODS.Back {
    key = 'harvest_deck',
    atlas = 'harvest_deck',
    pos = {
        x = 0,
        y = 0
    },
    config = {},
    apply = function(self)
        G.E_MANAGER:add_event(Event({
          func = function()
            for _, card in ipairs(G.playing_cards) do
                if HORROR.random_chance(.25) then
                    local seal = pseudorandom_element(HORROR.BASE_SEALS, pseudoseed('harvest_seal'))
                    card:set_seal(seal, true)
                elseif HORROR.random_chance(.5) then
                    local edition = pseudorandom_element(HORROR.BASE_EDITIONS, pseudoseed('harvest_edition'))
                    card:set_edition("e_" .. edition, nil, true)
                elseif HORROR.random_chance(.75) then
                    if HORROR.random_chance(.5) then 
                        HORROR.set_manifest(card, "question")   
                    else 
                        HORROR.set_manifest(card, "jack_o_lantern") 
                    end
                else
                    local enhancement = pseudorandom_element(HORROR.BASE_ENHANCEMENT, pseudoseed('harvest_enhance'))
                    card:set_ability("m_" .. enhancement, nil, true)
                end  
            end
            return true
          end
        }))
    end
}