-- Last used Manifest 
local igo = Game.init_game_object
Game.init_game_object = function(self)
  	local ret = igo(self)
  	ret.last_used_manifest = nil
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
