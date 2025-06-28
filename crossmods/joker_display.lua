local jd_def = JokerDisplay.Definitions

jd_def["j_horror_am"] = {
    text = {
        {
        text = "+"
        },
        {
        ref_table = "card.joker_display_values",
        ref_value = "mult_gain",
        }
    },
    text_config = {
        colour = G.C.MULT,
        scale = .35,
    },
    calc_function = function(card)
        local mult = 0
        for k, v in pairs(G.jokers.cards) do
            if v.ability.eternal then
                mult = mult + 5
            end
        end
        card.joker_display_values.mult_gain = mult
    end
}

jd_def["j_horror_art"] = {
    text = {
        {
            text = "+$"
        },
        {
        ref_table = "card.ability.extra",
        ref_value = "money",
        }
    },
    text_config = {
        colour = G.C.GOLD,
        scale = .35,
    },
    reminder_text = {
        {
            text = "(Skip Booster)"
        }
    },
    reminder_text_config = {
        colour = G.C.UI.TEXT_INACTIVE,
    },
}

jd_def["j_horror_christy"] = {
    text = {
        {
            text = "+"
        },
        {
        ref_table = "card.ability.extra",
        ref_value = "mult_gain",
        }
    },
    text_config = {
        colour = G.C.RED,
        scale = .35,
    },
    reminder_text = {
        {
            text = "(Resets if Hearts Discarded)"
        }
    },
    reminder_text_config = {
        colour = G.C.UI.TEXT_INACTIVE,
    },
}

jd_def["j_horror_ghosty"] = {
    text = {
        {
            text = "+"
        },
        {
        ref_table = "card.ability.extra",
        ref_value = "chips",
        }
    },
    text_config = {
        colour = G.C.CHIPS,
        scale = .35,
    },
    reminder_text = {
        {
            text = "(Pair)"
        }
    },
    reminder_text_config = {
        colour = G.C.UI.TEXT_INACTIVE,
    },
}

jd_def["j_horror_jawetto"] = {
    text = {
        {
            text = "1 in "
        },
        {
        ref_table = "card.ability.extra",
        ref_value = "tracker",
        }
    },
    text_config = {
        colour = G.C.GREEN,
        scale = .35,
    },
}

jd_def["j_horror_jay_bird"] = {
    text = {
        {
            text = "+",
            colour = G.C.CHIPS,
        },
        {
        ref_table = "card.ability.extra",
        ref_value = "chips",
        colour = G.C.CHIPS,
        },
        {
            text = ", ",
        },
        {
            text = "+",
            colour = G.C.MULT,
        },
        {
        ref_table = "card.ability.extra",
        ref_value = "mult",
        colour = G.C.MULT,
        },
    }, 
    reminder_text = {
        {
            text = "(10 & 3) or 6"
        }
    },
    reminder_text_config = {
        colour = G.C.UI.TEXT_INACTIVE,
    },
}

jd_def["j_horror_jigsaw"] = {
    text = {
        { 
            ref_table = "card.joker_display_values", 
            ref_value = "count", 
            retrigger_type = "mult" 
        },
        { 
            text = "x",                              
            scale = 0.35 
        },
        {
            border_nodes = {
                { 
                    text = "X" 
                },
                { 
                    ref_table = "card.ability.extra", 
                    ref_value = "xmult" 
                }
            }
        }
    },
}

jd_def["j_horror_mikey"] = {}

jd_def["j_horror_penny"] = {
    reminder_text = {
        text = {
            {
                text = "Hearts",
                colour = G.C.SUITS.Hearts
            }
        }
    },
}

jd_def["j_horror_quiet"] = {
    text = {
        { 
            ref_table = "card.joker_display_values", 
            ref_value = "count", 
            retrigger_type = "mult" 
        },
        { 
            text = "x",                              
            scale = 0.35 
        },
        {
            border_nodes = {
                { 
                    text = "X" 
                },
                { 
                    ref_table = "card.ability.extra", 
                    ref_value = "xmult" 
                }
            }
        }
    },
}

jd_def["j_horror_samara"] = {
    text = {
        {
            text = "7",
            colour = G.C.FILTER
        }
    },
}

jd_def["j_horror_xeno"] = {
    text = {
        {
            text = "(Q's and K's)",
            colour = G.C.UI.TEXT_INACTIVE
        }
    },
}

jd_def["j_horror_"] = {
    text = {

    },
    reminder_text = {

    },
    reminder_text_config = {

    },
    calc_function = function(card)

    end
}