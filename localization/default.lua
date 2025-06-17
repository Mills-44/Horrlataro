return {
    descriptions = {
        Back={},
        Blind={},
        Edition={},
        Enhanced={},
        Joker={
           j_horror_ghosty = {
                name = "Ghosty",
                text = {
                    "This {C:attention}Joker{} gains {C:chips}+5{} Chips",
                    "When played hand contains a {C:attention}Pair{}",
                    "{C:inactive}Total Chips: {C:chips}+#1#{}"
                }
            },
            j_horror_jay_bird = {
                name = "Jay Bird",
                text = {
                    "This {C:attention}Joker{} gives {C:mult}+#1#{} Mult",
                    "for a scored {C:attention}10 and 3{} or",
                    "{C:chips}+#2#{} Chips for a scored {C:attention}6's"
                }
            },
            j_horror_jigsaw = {
                name = "Jigsaw",
                text = {
                    "This {C:attention}Joker{} gains {X:mult,C:white}X.06{} Mult",
                    "for scored {C:attention}6's{} and",
                    "{C:green}1 in #2#{} to lose half",
                    "of money",
                    "Total: {X:mult,C:white}X#1#{} Mult"
                }
            },
            j_horror_penny = {
                name = "Penny",
                text = {
                    "Retrigger any {C:hearts}Hearts{}",
                    "card scored an additional",
                    "{C:attention}#1#{} times"
                }
            },
            j_horror_quiet = {
                name = "Quiet",
                text = {
                    "{X:mult,C:white}-X#1#{} Mult for each scored",
                    "card in played hands",
                    "Total: {X:mult,C:white}X#2#{} Mult"
                }
            },
            j_horror_xeno = {
                name = "Xeno",
                text = {
                    "When {C:attention}J's and Q's{} are scored",
                    "they turn into {C:attention}K's{} "
                }
            },

            
            j_horror_mikey = {
                name = "Mikey",
                text = {
                    "When a {C:attention}Blind{} is skipped",
                    "doubles current your{C:gold}money{}",
                    "but{C:green}1 in 5{} chance to destroy",
                    "a random {C:attention}Joker{}"
                }
            },
            j_horror_art = {
                name = "Art",
                text = {
                    "If a {C:attention}Blind{} is defeated",
                    "in {C:attention}1{} Hand create a",
                    "random {C:dark_edition}Spectral{} card"
                }
            },
             j_horror_fred = {
                name = "Fred",
                text = {
                    ""
                }
            },
        },
        Other={
            horror_question_manifest = {
                name = "Question Mark",
                text = {
                    "Scoring hands gain Mult",
                    "equal to the number",
                    " of times of poker hand",
                    "Total {C:mult}+#1#{} Mult",
                }
            },
            pop_quiz = {
                name = "Pop Quiz",
                text = {
                    "Scoring hands gain probability",
                    "equal to the number of times",
                    "of poker hand",
                    "{C:green}#1# in 100{}",
                    "{C:inactive}Triggers end of round"
                }
            },
            game = {
                name = "Let's Play A Game",
                text = {
                    "Sell a total of 25 {C:attention}Jokers{}",
                    "create a random {C:legendary}Legendary Joker",
                    "Jokers Sold: {C:green}#1#/25"
                }
            },
            counselor = {
                name = "Counselor Hunt",
                text = {
                    "Find {C:attention}Lusty Joker{}",
                    "Create a random", 
                    "{C:attention}Crystal Lake Joker{}"
                }
            },
             float = {
                name = "You'll Float Too",
                text = {
                    "Skip a total of 5 {C:attention}Blinds",
                    "Add 2 retriggers to scored {C:hearts}Hearts{}",
                    "Skips left until triggered: {C:attention}#1#{}"
                }
            },
            tiptoe = {
                name = "Tiptoe",
                text = {
                    "Play each rank as a high card",
                    ""
                }
            },
            chest = {
                name = "Chest Popper",
                text = {
                    "Play a {C:attention}Five of a Kind{}",
                    "with {C:attention}K's{} of all the same suit"
                    "Creates either {C:attention}Baron or DNA Joker"
                }
            },
        },
        Planet={},
        Spectral={},
        Stake={},
        Tag={},
        Task = {
            c_horror_pop_quiz = {
                name = "Pop Quiz",
                text = {
                    "Select {C:attention} 1 card",
                    "to give ",
                    "{C:attention}Question Manifest"
                }
            },
        },
        Tarot={},
        Voucher={},
    },
    misc = {
        achievement_descriptions={},
        achievement_names={},
        blind_states={},
        challenge_names={},
        collabs={},
        dictionary={
            horror_manifest = "Manifests"
        },
        high_scores={},
        labels={
            horror_question_manifest = "Manifest",
        },
        poker_hand_descriptions={},
        poker_hands={},
        quips={},
        ranks={},
        suits_plural={},
        suits_singular={},
        tutorial={},
        v_dictionary={},
        v_text={},
    },
}