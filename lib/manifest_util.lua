-- Checks cards for manifest slot
function Horrlataro.can_manifest(self, card)
  local sticker_info = SMODS.Stickers[self.config.sticker_id]
	if sticker_info.card_compat then
		return (#G.hand.highlighted) == (self.config.max_highlighted or 1) and 
    ((Horrlataro.manifest_open(G.hand.highlighted[1])) ~= nil)
  end
end

-- Add Manifest
function Horrlataro.manifest(self, card, area, copier)
    if self.set == "Manifest" then G.GAME.last_used_manifest = self.key or card.key end
	local sticker_info = SMODS.Stickers[self.config.sticker_id]

    if sticker_info.card_compat then
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.4,
				func = function()
					Horrlataro.add_manifest(highlighted, self.config.sticker_id)
					highlighted:juice_up(0.5, 0.5)
		
					card:juice_up(0.5, 0.5)
					play_sound('gold_seal', 1.2, 0.4)
					return true
				end
			}))
		end
	end
    delay(0.6)
    G.E_MANAGER:add_event(Event({
      trigger = 'after', 
      delay = 0.2, 
      func = function() 
        G.hand:unhighlight_all(); return true end }))
end

-- Apply Manifest
function Horrlataro.add_manifest(card, id)
    local stickers = SMODS.Stickers

    for k, v in pairs(card.ability) do
        if string.find(k, "manifest") then
            stickers[k]:removed(card)
            card.ability[k] = nil
        end
    end
    stickers[id]:added(card)
    card.ability[id] = true
end

-- Check for manifest
function Horrlataro.manifest_open(card)
    if not card then return nil end
    
    for k, v in pairs(card.ability) do
        if string.find(k, "manifest") then
            return k
        end
    end
end

-- ||       UI          ||

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