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