--- STEAMODDED HEADER
--- MOD_NAME: KCVanilla
--- MOD_ID: KCVanilla
--- MOD_DESCRIPTION: KCVanilla
--- MOD_AUTHOR: [krackocloud]
--- LOADER_VERSION_GEQ: 1.0.0
SMODS.Atlas {
    key = 'kcvanillajokeratlas',
    path = "jokeratlas.png",
    px = 71,
    py = 95
}

jokerAtlasOrder = {'5day', 'chan', 'swiss', 'collapse', 'energy', 'fortunecookie', 'guard', 'irish', 'composition',
                   'powergrid', 'redenvelope', 'robo', 'handy', 'squid'}

function getJokerAtlasIndex(jokerKey)
    for i, v in ipairs(jokerAtlasOrder) do
        if v == jokerKey then
            return i - 1
        end
    end
    return 0
end

SMODS.Joker {
    key = "composition",
    name = "Composition",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = getJokerAtlasIndex('composition')
    },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {},
    loc_txt = {
        name = "Composition",
        text = {"+4 Mult for each", "Joker to the left,", "+30 Chips for each", "Joker to the right"}
    },
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    calculate = function(card, context)
    end
}

SMODS.Joker {
    key = "fortunecookie",
    name = "Fortune Cookie",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = getJokerAtlasIndex('fortunecookie')
    },
    rarity = 1,
    cost = 3,
    unlocked = true,
    discovered = true,
    eternal_compat = false,
    perishable_compat = true,
    config = {
        extra = {
            chips = 150,
            chip_mod = 50
        }
    },
    loc_txt = {
        name = "Fortune Cookie",
        text = {"+#1# Chips,", "-#2# Chips when", "Tarot card is used"}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.chips, card.ability.extra.chip_mod}
        }
    end,
    calculate = function(card, context)
        if context.using_consumeable and (context.consumeable.ability.set == "Tarot") and not context.blueprint then
            new_chip_val = self.ability.extra.chips - self.ability.extra.chip_mod
            if (new_chip_val > 0) then
                self.ability.extra.chips = new_chip_val
                return {
                    message = localize {
                        type = 'variable',
                        key = 'a_chips_minus',
                        vars = {self.ability.extra.chip_mod}
                    },
                    colour = G.C.CHIPS
                }
            else
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        self.T.r = -0.2
                        self:juice_up(0.3, 0.4)
                        self.states.drag.is = true
                        self.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.3,
                            blockable = false,
                            func = function()
                                G.jokers:remove_card(self)
                                self:remove()
                                self = nil
                                return true;
                            end
                        }))
                        return true
                    end
                }))
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.RED
                }
            end
        end
    end
}

SMODS.Joker {
    key = "swiss",
    name = "Swiss Joker",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = getJokerAtlasIndex('swiss')
    },
    rarity = 2,
    cost = 4,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {
        mult = 0
    },
    loc_txt = {
        name = "Swiss Joker",
        text = {'+5 Mult for each', 'unscored card played', 'in previous hand', '(Currently +#1# Mult)'}
    },
    loc_vars = function(self, info_queue, card)
        return {card.ability.mult}
    end,
    calculate = function(card, context)
    end
}

SMODS.Joker {
    key = "robo",
    name = "Robo-Joker",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = getJokerAtlasIndex('robo')
    },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {},
    loc_txt = {
        name = "Robo-Joker",
        text = {'Steel cards give', 'X1.5 Mult when scored'}
    },
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    calculate = function(card, context)
    end
}

SMODS.Joker {
    key = "squid",
    name = "Squid",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = getJokerAtlasIndex('squid')
    },
    rarity = 2,
    cost = 4,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {},
    loc_txt = {
        name = "Squid",
        text = {"+5 hand size on", "final 2 hands of round"}
    },
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    calculate = function(card, context)
    end
}

SMODS.Joker {
    key = "guard",
    name = "Royal Guard",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = getJokerAtlasIndex('guard')
    },
    rarity = 2,
    cost = 4,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {},
    loc_txt = {
        name = "Royal Guard",
        text = {'Steel cards give', 'X1.5 Mult when scored'}
    },
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    calculate = function(card, context)
    end
}

SMODS.Joker {
    key = "redenvelope",
    name = "Red Envelope",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = getJokerAtlasIndex('redenvelope')
    },
    rarity = 2,
    cost = 4,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {},
    loc_txt = {
        name = "Red Envelope",
        text = {'At end of round, earn $8', 'if fewer than 2 hands remain'}
    },
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    calculate = function(card, context)
    end
}

SMODS.Joker {
    key = "chan",
    name = "Joker-chan",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = getJokerAtlasIndex('chan')
    },
    rarity = 2,
    cost = 4,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {},
    loc_txt = {
        name = "Joker-chan",
        text = {"Retrigger Common Jokers"}
    },
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    calculate = function(card, context)
    end
}

SMODS.Joker {
    key = "handy",
    name = "Handy Joker",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = getJokerAtlasIndex('handy')
    },
    rarity = 2,
    cost = 4,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {},
    loc_txt = {
        name = "Handy Joker",
        text = {'If first hand of round has exactly 1 card, X3 Mult for rest of round'}
    },
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    calculate = function(card, context)
    end
}

SMODS.Joker {
    key = "collapse",
    name = "Cosmic Collapse",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = getJokerAtlasIndex('collapse')
    },
    rarity = 2,
    cost = 4,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {},
    loc_txt = {
        name = "Cosmic Collapse",
        text = {'At end of round, held Planet cards each have 1 in 3 chance to transform into a Black Hole'}
    },
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    calculate = function(card, context)
    end
}

SMODS.Joker {
    key = "5day",
    name = "Five-Day Forecast",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = getJokerAtlasIndex('5day')
    },
    rarity = 2,
    cost = 4,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {},
    loc_txt = {
        name = "Five-Day Forecast",
        text = {"If played hand contains a Straight, increase played cards' ranks by 1 (ignores Aces)"}
    },
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    calculate = function(card, context)
    end
}

SMODS.Joker {
    key = "powergrid",
    name = "Power Grid",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = getJokerAtlasIndex('powergrid')
    },
    rarity = 3,
    cost = 4,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {},
    loc_txt = {
        name = "Power Grid",
        text = {"Mult and Steel cards count as both"}
    },
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    calculate = function(card, context)
    end
}

SMODS.Joker {
    key = "irish",
    name = "Luck of the Irish",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = getJokerAtlasIndex('irish')
    },
    rarity = 3,
    cost = 4,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {},
    loc_txt = {
        name = "Luck of the Irish",
        text = {"Lucky Clubs are 4X more likely to succeed"}
    },
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    calculate = function(card, context)
    end
}

SMODS.Joker {
    key = "energy",
    name = "Joker Energy",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = getJokerAtlasIndex('energy')
    },
    rarity = 3,
    cost = 4,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {},
    loc_txt = {
        name = "Joker Energy",
        text = {"Gains X0.25 Mult when a", "Wild card scores in a", "5-card poker hand,",
                "resets if hand contains a Flush"}
    },
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    calculate = function(card, context)
    end
}
