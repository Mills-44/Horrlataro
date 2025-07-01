-- LOAD ATLAS FOR VOUCHERS
SMODS.Atlas {
    key  = 'puzzle_box',
    path = 'puzzle_box.png',
    px   = 71, 
    py   = 95, 
}

SMODS.Voucher {
    object_type = "Voucher",
    key = 'puzzle_box',
    atlas = 'puzzle_box',
    pos = {
        x = 0,
        y = 0
    },
    config = {
    },
    unlocked = true,
    discovered = false,
    loc_vars = function(self, info_queue, card)
		return { 
            vars = { 
            } 
        }
	end,
    redeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.jokers.config.card_limit = G.jokers.config.card_limit + 1
				return true
			end,
		}))
	end,
}