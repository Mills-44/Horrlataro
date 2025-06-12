---Registers a list of items in a custom order
---@param items table
---@param path string
function HORROR.file_loader(items, path)
  for i = 1, #items do
    SMODS.load_file(path .. "/" .. items[i] .. ".lua")()
  end
end
