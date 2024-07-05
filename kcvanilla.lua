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

kcv_jokerAtlasOrder = {'5day', 'chan', 'swiss', 'collapse', 'energy', 'fortunecookie', 'guard', 'irish', 'composition',
                       'powergrid', 'redenvelope', 'robo', 'handy', 'squid'}

function kcv_getJokerAtlasIndex(jokerKey)
    for i, v in ipairs(kcv_jokerAtlasOrder) do
        if v == jokerKey then
            return i - 1
        end
    end
    return 0
end

function kcv_dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            s = s .. '[' .. k .. '] = ' .. kcv_dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

-- function kcv_plus_chips(amt, card)
--     if (amt == 0) then
--         return
--     end
--     hand_chips = mod_chips(hand_chips + amt)
--     update_hand_text({
--         delay = 0
--     }, {
--         chips = hand_chips
--     })
--     card_eval_status_text(card, 'chips', nil, nil, nil, {
--         message = localize {
--             type = 'variable',
--             key = 'a_chips',
--             vars = {amt}
--         },
--         colour = G.C.CHIPS
--     });
-- end

-- function kcv_plus_mult(amt, card)
--     if (amt == 0) then
--         return
--     end
--     mult = mod_mult(mult + amt)
--     update_hand_text({
--         delay = 0
--     }, {
--         mult = mult
--     })
--     card_eval_status_text(card, 'mult', nil, nil, nil, {
--         message = localize {
--             type = 'variable',
--             key = 'a_mult',
--             vars = {amt}
--         },
--         colour = G.C.MULT
--     });
-- end

function kcv_composition_calc_effect(card)
    local my_pos = nil
    local cards_to_left = 0
    local cards_to_right = 0
    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then
            my_pos = i
        elseif my_pos == nil then
            cards_to_left = cards_to_left + 1
        else
            cards_to_right = cards_to_right + 1
        end
    end
    local chips = cards_to_right * 30
    local mult = cards_to_left * 4
    if my_pos == nil then
        chips = 0
        mult = 0
    end
    return {
        chips = chips,
        mult = mult
    }
end

SMODS.Joker {
    key = "composition",
    name = "Composition",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('composition')
    },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {
        extra = {
            chips = 0,
            mult = 0
        }
    },
    loc_txt = {
        name = "Composition",
        text = {"+4 Mult for each Joker to the left,", "+30 Chips for each Joker to the right",
                "(Currently +#1# Mult and +#2# Chips)"}
    },
    loc_vars = function(self, info_queue, card)
        local effect = kcv_composition_calc_effect(card)
        return {
            vars = {effect.mult, effect.chips}
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local effect = kcv_composition_calc_effect(card)
            aChips(effect.chips, card)
            aMult(effect.mult, card)
        end
    end
}

SMODS.Joker {
    key = "fortunecookie",
    name = "Fortune Cookie",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('fortunecookie')
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
    calculate = function(self, card, context)
        if context.using_consumeable and (context.consumeable.ability.set == "Tarot") and not context.blueprint then
            local new_chip_val = card.ability.extra.chips - card.ability.extra.chip_mod
            if (new_chip_val > 0) then
                card.ability.extra.chips = new_chip_val
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = localize {
                        type = 'variable',
                        key = 'a_chips_minus',
                        vars = {card.ability.extra.chip_mod}
                    },
                    colour = G.C.CHIPS
                });
            else
                play_sound('tarot1')
                card.T.r = -0.2
                card:juice_up(0.3, 0.4)
                card.states.drag.is = true
                card.children.center.pinch.x = true
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.3,
                    blockable = false,
                    func = function()
                        G.jokers:remove_card(card)
                        card:remove()
                        card = nil
                        return true;
                    end
                }))
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.FILTER
                }
            end
        end
        if context.joker_main then
            aChips(card.ability.extra.chips, card)
        end
    end
}

SMODS.Joker {
    key = "swiss",
    name = "Swiss Joker",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('swiss')
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
        return {
            vars = {card.ability.mult}
        }
    end,
    calculate = function(self, card, context)
        if context.after then
            card.ability.mult = 5 * (#context.full_hand - #context.scoring_hand)
            card_eval_status_text(card, 'extra', nil, nil, nil, {
                message = localize {
                    type = 'variable',
                    key = 'a_mult',
                    vars = {card.ability.mult}
                },
                colour = G.C.MULT
            });
        end
        if context.joker_main then
            aMult(card.ability.mult, card)
        end
    end
}

SMODS.Joker {
    key = "robo",
    name = "Robo-Joker",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('robo')
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
        return {
            var = {}
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card.ability.name == 'Steel Card' then
            return {
                x_mult = 1.5,
                colour = G.C.RED,
                card = card
            }
        end
    end
}

SMODS.Joker {
    key = "squid",
    name = "Squid",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('squid')
    },
    rarity = 2,
    cost = 4,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {
        h_size = 0,
        h_mod = 5
    },
    loc_txt = {
        name = "Squid",
        text = {"+#1# hand size on", "final 2 hands of round", "#2#"}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.h_mod, card.ability.h_size > 0 and "(Active)" or "(Inactive)"}
        }
    end,
    calculate = function(self, card, context)
        -- if context.end_of_round and card.ability.h_size > 0 then
        --     card.ability.h_size = 0
        --     G.hand:change_size(-card.ability.h_mod)
        --     card_eval_status_text(card, 'extra', nil, nil, nil, {
        --         message = localize {
        --             type = 'variable',
        --             key = 'a_handsize_minus',
        --             vars = {card.ability.h_mod}
        --         },
        --         colour = G.C.FILTER
        --     });
        if context.after and G.GAME.current_round.hands_left <= 2 then
            if card.ability.h_size == 0 then
                card.ability.h_size = card.ability.h_mod
                G.hand:change_size(card.ability.h_size)
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = localize {
                        type = 'variable',
                        key = 'a_handsize',
                        vars = {card.ability.h_mod}
                    },
                    colour = G.C.FILTER
                });
            end
        end
        if context.end_of_round and card.ability.h_size > 0 then
            card.ability.h_size = 0
            G.hand:change_size(-card.ability.h_mod)
            card_eval_status_text(card, 'extra', nil, nil, nil, {
                message = localize {
                    type = 'variable',
                    key = 'a_handsize_minus',
                    vars = {card.ability.h_mod}
                },
                colour = G.C.FILTER
            });
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if G.GAME.current_round.hands_left <= 2 then
            card.ability.h_size = 5
        end
    end
}

SMODS.Joker {
    key = "guard",
    name = "Royal Guard",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('guard')
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
        return {
            var = {}
        }
    end,
    calculate = function(self, card, context)
    end
}

SMODS.Joker {
    key = "redenvelope",
    name = "Red Envelope",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('redenvelope')
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
        return {
            var = {}
        }
    end,
    calculate = function(self, card, context)
    end
}

SMODS.Joker {
    key = "chan",
    name = "Joker-chan",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('chan')
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
        return {
            var = {}
        }
    end,
    calculate = function(self, card, context)
    end
}

SMODS.Joker {
    key = "handy",
    name = "Handy Joker",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('handy')
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
        return {
            var = {}
        }
    end,
    calculate = function(self, card, context)
    end
}

SMODS.Joker {
    key = "collapse",
    name = "Cosmic Collapse",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('collapse')
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
        return {
            var = {}
        }
    end,
    calculate = function(self, card, context)
    end
}

SMODS.Joker {
    key = "5day",
    name = "Five-Day Forecast",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('5day')
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
        return {
            var = {}
        }
    end,
    calculate = function(self, card, context)
    end
}

SMODS.Joker {
    key = "powergrid",
    name = "Power Grid",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('powergrid')
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
        return {
            var = {}
        }
    end,
    calculate = function(self, card, context)
    end
}

SMODS.Joker {
    key = "irish",
    name = "Luck of the Irish",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('irish')
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
        return {
            var = {}
        }
    end,
    calculate = function(self, card, context)
    end
}

SMODS.Joker {
    key = "energy",
    name = "Joker Energy",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('energy')
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
        return {
            var = {}
        }
    end,
    calculate = function(self, card, context)
    end
}
