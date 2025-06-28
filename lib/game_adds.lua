HORROR.config = SMODS.current_mod.config

HORROR.JOKERS = {
-- ||     COMPLETE      ||
"am",
"art",
"christy",
"ghosty",
"jigsaw",
"jay_bird",
"jawetto",
"mikey",
"penny",
"quiet",
"samara",
"xeno",

-- ||     WIP      ||
}

-- Manifests Class Creation 
HORROR.Manifest = SMODS.Sticker:extend{
    prefix_config = { key = true },
    should_apply = false,
    config = {},
    rate = 0,
    sets = {
      Default = true
    },
    draw = function(self, card)
      local x_offset = (card.T.w / 71) * -4 * card.T.scale
      G.shared_stickers[self.key].role.draw_major = card
      G.shared_stickers[self.key]:draw_shader('dissolve', nil, nil, nil, card.children.center, nil, nil, x_offset)
    end,
    apply = function(self, card, val)
      card.ability[self.key] = val and copy_table(self.config) or nil
    end
}

HORROR.TASKS = {
"pop_quiz",
"halloween_night",
}
--- @alias Manifest "question" | "jack_o_lantern"
HORROR.MANIFESTS = {
"question_manifest",
"jack_o_lantern_manifest"
}
