-- LOAD ATLAS/SOUNDS FOR JOKER
SMODS.Atlas {
    key  = 'pop_quiz',
    path = 'pop_quiz.png',
    px   = 71, 
    py   = 95, 
  }
  SMODS.Atlas {
    key  = 'question_mark',
    path = 'question_mark.png',
    px   = 71, 
    py   = 95, 
  }
  
SMODS.Consumable {
    key = 'pop_quiz',
    atlas = 'pop_quiz',
    set = "Task",
    pos = {
        x = 0,
        y = 0
    },
    config = {
        max_highlighted = 1,
    },
    pools = {
        Task = true 
    },
    loc_vars = function(self, info_queue, card)
       return { 
        vars = { 
            self.config.max_highlighted,
        } }  
    end,
    use = function(self, card, area, copier)                                                                                
        for _, v in ipairs(G.hand.highlighted) do
            HORROR.set_manifest(v, "question")   
            G.E_MANAGER:add_event(Event({
                trigger = 'after', 
                delay = 0.4, 
                func = function()
                    v:juice_up(.3,.5)
                return true
                end
            }))
        end
    end
}
