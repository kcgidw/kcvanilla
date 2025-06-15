return {
    descriptions = {
        Joker = {
            j_kcvanilla_5day = {
                name = "Five-Day Forecast",
                text = {"If played hand contains a {C:attention}Straight{},",
                        "increase played cards' ranks by {C:attention}1{}",
                        "{C:inactive}(Excludes {C:attention}Aces{C:inactive})"}
            },
            j_kcvanilla_chan = {
                name = "Joker-chan",
                text = {"At end of round, gains {C:mult}+#1#{} Mult", "for each {C:blue}Common{} Joker",
                        "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult){}"}
            },
            j_kcvanilla_collapse = {
                name = "Cosmic Collapse",
                text = {'At end of round, held {C:planet}Planet{}', 'cards each have {C:green}#1# in 2{} chance',
                        'to transform into a {C:spectral}Black Hole{}'}
            },
            j_kcvanilla_composition = {
                name = "Composition",
                text = {"{C:mult}+#1#{} Mult for each Joker to the left,",
                        "{C:chips}+#2#{} Chips for each Joker to the right",
                        "{C:inactive}(Currently {C:mult}+#3#{C:inactive} Mult and {C:chips}+#4#{C:inactive} Chips){}"}
            },
            j_kcvanilla_energy = {
                name = "Joker Energy",
                text = {'Played {C:attention}Wild{} cards give one', 'of the following when scored:',
                        '{C:mult}+#1#{} Mult, {C:chips}+#2#{} Chips, {X:mult,C:white} X#3# {} Mult, {C:money}$#4#{}'}
            },
            j_kcvanilla_fortunecookie = {
                name = "Fortune Cookie",
                text = {"{C:chips}+#1#{} Chips,", "{C:chips}-#2#{} Chips when", "{C:tarot}Tarot{} card is used"}
            },
            j_kcvanilla_guard = {
                name = "Royal Guard",
                text = {"After {C:attention}#2#{} {C:attention}Kings{} or {C:attention}Queens{}",
                        "score, sell this to make a", "random Joker {C:dark_edition}Negative{}",
                        "{C:inactive}(Progress: #1#/#2#){}"}
            },
            j_kcvanilla_handy = {
                name = "Handy Joker",
                text = {'If first discard of round', 'is a single enhanced card,',
                        'gain {X:mult,C:white} X1 {} Mult, resets when', 'Boss Blind is defeated',
                        '{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)'}
            },
            j_kcvanilla_irish = {
                name = "Luck of the Irish",
                text = {"{C:attention}Lucky{} {C:clubs}Clubs{} are {C:green}#1#X{} more", "likely to succeed"}
            },
            j_kcvanilla_powergrid = {
                name = "Power Grid",
                text = {'Scored {C:attention}Mult{} cards give {X:mult,C:white} X#1# {} Mult',
                        'for each {C:attention}Mult{} card scored this round',
                        "{C:inactive}(Next: {X:mult,C:white} X#2# {C:inactive} Mult)"}
            },
            j_kcvanilla_redenvelope = {
                name = "Red Envelope",
                text = {'When Boss Blind is defeated,', 'earn {C:money}$8{} for each {C:blue}Common{} Joker',
                        '{C:inactive}(Currently {C:money}$#1#{C:inactive})'}
            },
            j_kcvanilla_robo = {
                name = "Jimbot",
                text = {"Gains the {C:chips}Chip{} value of the first",
                        "scored card ranked {C:attention}2-10{} each round",
                        "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"}
            },
            j_kcvanilla_squid = {
                name = "Squid",
                text = {"{C:attention}+#1#{} hand size on final", "2 hands of round", "{C:inactive}(#2#)"}
            },
            j_kcvanilla_swiss = {
                name = "Swiss Joker",
                text = {'{C:mult}+#1#{} Mult for each', 'card that did not score', 'in the previous hand',
                        '{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)'}
            },
            j_kcvanilla_tenpin = {
                name = "Ten-Pin",
                text = {'If played hand contains a scoring {C:attention}10{},',
                        '{X:mult,C:white} X2 {} Mult for next 2 hands', '{C:inactive}(#1#){}'}
            },
            j_kcvanilla_rakugo = {
                name = "Rakugo",
                text = {'If played hand contains a {C:attention}Straight{},',
                        'retrigger each played {C:attention}4 5 6 7{} or {C:attention}8{}'}
            },
            j_kcvanilla_rats = {
                name = "Rats!",
                text = {'?'}
            }
        }
    },
    misc = {
        dictionary = {
            kcv_active = "Active",
            kcv_inactive = "Inactive"
        },
        v_dictionary = {
            kcv_active_for_X_more_hands = "Active for #1# more hand(s)"
        }
    }
}

