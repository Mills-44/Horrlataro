-- Last used Manifest 
local igo = Game.init_game_object
Game.init_game_object = function(self)
  	local ret = igo(self)
  	ret.last_used_gemstone = nil
  	return ret
end

-- Localization colors
local lc = loc_colour
function loc_colour(_c, _default)
	if not G.ARGS.LOC_COLOURS then
		lc()
	end
	
	for k, v in pairs(SMODS.Stickers) do
		local sticker = SMODS.Stickers[k]
		G.ARGS.LOC_COLOURS[string.gsub(sticker.key, "manifest_", "")] = sticker.badge_colour
	end
	return lc(_c, _default)
end

-- Override Stickers to seperate again from Manifests
create_UIBox_your_collection_stickers = function()
	local _pool = {}
	for i, v in pairs(SMODS.Stickers) do
		if not i:find("manifest") then
			_pool[i] = v
		end
	end

    return SMODS.card_collection_UIBox(_pool, {4,4}, {
        snap_back = true,
        hide_single_page = true,
        collapse_single_page = true,
        center = 'c_base',
        h_mod = 1.03,
        back_func = 'your_collection_other_gameobjects',
        modify_card = function(card, center)
            card.ignore_pinned = true
            center:apply(card, true)
        end,
    })
end