---Registers a list of items in a custom order
---@param items table
---@param path string
function HORROR.file_loader(items, path)
  for i = 1, #items do
    SMODS.load_file(path .. "/" .. items[i] .. ".lua")()
  end
end

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