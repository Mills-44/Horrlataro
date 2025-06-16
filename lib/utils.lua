---Registers a list of items in a custom order
---@param items table
---@param path string
function HORROR.file_loader(items, path)
  for i = 1, #items do
    SMODS.load_file(path .. "/" .. items[i] .. ".lua")()
  end
end

---Returns true with probability `chance` (0.0 to 1.0)
---@param chance number
---@return boolean
function HORROR.random_chance(chance)
  return math.random() < chance
end

-- Jay Bird Lusty Checker
function HORROR.have_lusty_joker(card)
  local center = nil
  if type(card) == 'string' then
    center = G.P_CENTERS[card]
  elseif type(card) == 'table' and card.config then
    center = card.config.center or G.P_CENTERS[card.config.center_key]
  end

  return center or false
end

---@param card table | string a center key or a card
---@return boolean
function HORROR.lusty_check(card)
  local center = type(card) == "string"
      and G.P_CENTERS[card]
      or (card.config and card.config.center)

  if not center then
    return false
  end

  return HORROR.lusty_checker[center.key]
end