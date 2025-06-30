-- LOAD ATLAS FOR VOUCHERS
SMODS.Atlas {
    key  = 'decipher',
    path = 'decipher.png',
    px   = 71, 
    py   = 95, 
}

SMODS.Voucher {
    object_type = "Voucher",
    key = 'decipher',
    atlas = 'decipher',
    pos = {
        x = 0,
        y = 0
    },
    config = {
    },
    unlocked = true,
    discovered = false,
    requires = { 
        "v_horror_puzzle_box" 
    },
    loc_vars = function(self, info_queue, card)
		return { 
            vars = { 
            } 
        }
	end,
    redeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.consumeables.config.card_limit = G.consumeables.config.card_limit + 1
                G.jokers.config.card_limit = G.jokers.config.card_limit + 1
				return true
			end,
		}))
	end,
}