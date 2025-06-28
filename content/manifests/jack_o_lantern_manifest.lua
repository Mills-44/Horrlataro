HORROR.Manifest {
    key = 'jack_o_lantern_manifest',
    badge_colour = HEX("123287"),
    atlas = 'jack_o_lantern',
    pos = { x = 0, y = 0 },
    config = { 
        mult = 0
    },
    card_compat = true,
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                card.ability.mult 
            } 
        }
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local deduce = math.random(.85,.95)
            G.GAME.blind.chips = G.GAME.blind.chips * deduce
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
			G.HUD_blind:recalculate()
            return {
                message = "-" .. tostring(100 - (100 * deduce)) .. "%",
                colour = G.C.FILTER
            }
        end
    end
}