return {
    descriptions = {
        Back={},
        Blind={},
        Edition={},
        Enhanced={},
        Joker={
             j_horror_am = {
                name = "AM",
                text = {
                    "After selecting a {C:attention}Blind{}",
                    "apply an eternal sticker to a random",
                    "{C:attention}Joker{}, {C:mult}+#1#{} Mult for each",
                    "{C:attention}Joker{} with eternal",
                    "Currently: {C:mult}+#2#{} Mult"
                }
            },
            j_horror_art = {
                name = "Art",
                text = {
                    "Score over 30% of required {C:attention}Blind",
                    "Creates a random spectral card"
                }
            },
            j_horror_christie = {
                name = "Christie",
                text = {
                    "{C:mult}+#1#{} Mult for each consecutive hand",
                    "discarding {C:hearts}Hearts{} cards resets it",
                    "Currently: {C:mult}+#2#{} Mult"
                }
            },
            j_horror_fred = {
                name = "Fred",
                text = {
                    "{C:attention}+#1#{} Booster slot",
                     "{C:attention}-#2#{} card slot"
                }
            },
           j_horror_ghosty = {
                name = "Ghosty",
                text = {
                    "This {C:attention}Joker{} gains {C:chips}+5{} Chips",
                    "When played hand contains a {C:attention}Pair{}",
                    "{C:inactive}Currently: {C:chips}+#1#{} Chips"
                }
            },
            j_horror_inky = {
                name = "Inky",
                text = {
                    "Scored 5's of spades each give +15 mult"
                }
            },
             j_horror_jawetto = {
                name = "Jawetto",
                text = {
                    "Sell this {C:attention}Joker{} to instantly defeat {C:attention}Blind{}",
                    "{C:green}#1# in #2#{} chance of recreating itself ",
                    "{C:inactive}(Odds increase each sell)"
                }
            },
            j_horror_jay_bird = {
                name = "Jay Bird",
                text = {
                    "This {C:attention}Joker{} gives {C:mult}+#1#{} Mult",
                    "for scored hands containing a {C:attention}10 and 3{}",
                    "or {C:chips}+#2#{} Chips for scored {C:attention}6's"
                }
            },
            j_horror_jigsaw = {
                name = "Jigsaw",
                text = {
                    "This {C:attention}Joker{} gains {X:mult,C:white}X.06{} Mult",
                    "for scored {C:attention}6's{}",
                    "{C:green}1 in #2#{} to lose half of money",
                    "Currently: {X:mult,C:white}X#1#{} Mult"
                }
            },
            j_horror_mikey = {
                name = "Mikey",
                text = {
                    "When a {C:attention}Blind{} is skipped",
                    "doubles current your{C:gold}money{}",
                    "but{C:green}#1# in #2#{} chance to destroy",
                    "a random {C:attention}Joker{}"
                }
            },
            j_horror_penny = {
                name = "Penny",
                text = {
                    "Retrigger any scored {C:hearts}Hearts{}",
                    "cards for an additional",
                    "{C:attention}#1#{} times"
                }
            },
            j_horror_quiet = {
                name = "Quiet",
                text = {
                    "{X:mult,C:white}-X#1#{} Mult for each scored",
                    "card in played hands",
                    "Currently: {X:mult,C:white}X#2#{} Mult",
                    "{C:inactive}(Resets each scored hand)"
                }
            },
            j_horror_xeno = {
                name = "Xeno",
                text = {
                    "When {C:attention}J's{} or {C:attention}Q's{} are scored",
                    "they turn into {C:attention}K's{} "
                }
            },
        },
        Other={
            horror_question_manifest = {
                name = "Question Mark",
                text = {
                    "Gain Mult equal ",
                    "to the number of",
                    "times of poker hand",
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
                    "Beat {C:attention}#1# Blinds",
                    "with one scoring hand",
                    "{C:attention}+1 Joker{} slot"
                }
            },
            chest = {
                name = "Chest Popper",
                text = {
                    "Play a {C:attention}Flush Five{}",
                    "Creates either {C:attention}Baron or DNA Joker"
                }
            },
            auto = {
                name = "Auto Vengence",
                text = {
                    "Reach {C:mult}+#1#{} Mult and",
                    "Turn a random {C:attention}Joker{}",
                    "{C:dark_edition}Negative{} if possible"
                }
            },
            boat = {
                name = "Bigger Boat",
                text = {
                    "Reach {C:green}1 in #1#{}",
                    "{C:chips}+5{} hand size"
                }
            }
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