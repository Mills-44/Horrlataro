 SMODS.current_mod.custom_collection_tabs = function()
    return {
      UIBox_button({
        button = 'your_collection_horror_manifests',
        id = 'your_collection_horror_manifests',
        label = { localize('horror_manifest') },
        minw = 5,
        minh = 1
      })
    }
end

local function manifest_UI()
    local manifests = {}

    for k, v in pairs(SMODS.Stickers) do
      if HORROR.is_manifest(k) then
        manifests[k] = v
      end
    end

    return SMODS.card_collection_UIBox(manifests, { 4, 4 }, {
      snap_back = true,
      hide_single_page = true,
      collapse_single_page = true,
      center = 'c_base',
      h_mod = 1.18,
      back_func = 'your_collection_other_gameobjects',
      modify_card = function(card, center)
        card.ignore_pinned = true
        center:apply(card, true)
      end,
    })
  end

   G.FUNCS.your_collection_horror_manifests = function()
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu {
      definition = manifest_UI()
    }
  end

  local function seperate_manifests(func)
    local removed = {}
    for k, v in pairs(SMODS.Stickers) do
      if HORROR.is_manifest(k) then
        removed[k] = v
        SMODS.Stickers[k] = nil
      end
    end

    local ret = func()

    for k, v in pairs(removed) do
      SMODS.Stickers[k] = v
    end

    return ret
  end

   local stickers_ui_ref = create_UIBox_your_collection_stickers
  create_UIBox_your_collection_stickers = function()
    return seperate_manifests(stickers_ui_ref)
  end

  local other_objects_ref = create_UIBox_Other_GameObjects
  create_UIBox_Other_GameObjects = function()
    return seperate_manifests(other_objects_ref)
  end
