-- Create UI for Manifest
function create_UIBox_manifest()
	local _pool = {}
	for i, v in pairs(SMODS.Stickers) do
		if i:find("manifest") then
			_pool[i] = v
		end
	end

	return SMODS.card_collection_UIBox(_pool, { 4, 4 }, {
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

--  Manifest collection 
G.FUNCS.your_collection_manifest = function()
	G.SETTINGS.paused = true
	G.FUNCS.overlay_menu{
	  definition = create_UIBox_manifest(),
	}
end

-- Gem Slots Collection Tab
Horrlataro.custom_collection_tabs = function()
    return {
        UIBox_button({
			button = 'your_collection_manifest', 
			label = {'Manifest'}, 
			minw = 5,
			minh = 1, 
			id = 'your_collection_manifest', 
			focus_args = {snap_to = true}
		})
    }
end
