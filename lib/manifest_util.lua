---Check For Manifest
---@param str string
---@return boolean
function HORROR.is_manifest(str)
  for _, v in ipairs(HORROR.MANIFESTS) do
    if 'horror_' .. v == str then
      return true
    end
  end
  return false
end

---@param card table
---@return string | nil
---@return table | nil
function HORROR.has_manifest(card)
  for k, v in pairs(card and card.ability or {}) do
    if HORROR.is_manifest(k) then
      return k, v
    end
  end
end

--- @param args { area: table, allow_debuff: boolean?, exclude_highlighted: boolean? }
--- @return integer
function HORROR.manifest_count(args)
  local manifests = 0

  for _, v in ipairs(args.area and args.area.cards or {}) do
    local debuff_check = args.allow_debuff or not v.debuff
    local highlighted_check = not args.exclude_highlighted or not v.highlighted

    if HORROR.has_manifest(v) and debuff_check and highlighted_check then
      manifests = manifests + 1
    end
  end

  return manifests
end

---@param card table
function HORROR.remove_manifest(card)
  for k, _ in pairs(card and card.ability or {}) do
    if HORROR.is_manifest(k) then
      card.ability[k] = nil
    end
  end
end

---@param card table
---@param type Manifest
function HORROR.set_manifest(card, type)
  local key = 'horror_' .. type .. '_manifest'

  if card and HORROR.is_manifest(key) then
    HORROR.remove_manifest(card)
    SMODS.Stickers[key]:apply(card, true)
  end
end

