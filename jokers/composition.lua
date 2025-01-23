local function kcv_composition_calc_effect(card, extramult, extrachips)
    if not G.jokers then
        -- viewing card outside a run
        return {
            chips = 0,
            mult = 0
        }
    end
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
    local chips = cards_to_right * extrachips
    local mult = cards_to_left * extramult
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
    blueprint_compat = true,
    config = {
        extra = {
            mult = 4,
            chips = 25
        }
    },
    loc_txt = {
        name = "Composition",
        text = {"{C:mult}+#1#{} Mult for each Joker to the left,", "{C:chips}+#2#{} Chips for each Joker to the right",
                "{C:inactive}(Currently {C:mult}+#3#{C:inactive} Mult and {C:chips}+#4#{C:inactive} Chips){}"}
    },
    loc_vars = function(self, info_queue, card)
        local effect = kcv_composition_calc_effect(card, card.ability.extra.mult, card.ability.extra.chips)
        return {
            vars = {card.ability.extra.mult, card.ability.extra.chips, effect.mult, effect.chips}
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local target_card = context.blueprint_card or card
            local effect = kcv_composition_calc_effect(target_card, card.ability.extra.mult, card.ability.extra.chips)

            if effect.chips == 0 and effect.mult == 0 then
                return
            end

            return {
                chip_mod = effect.chips,
                message = localize {
                    type = 'variable',
                    key = 'a_chips',
                    vars = {effect.chips}
                },
                colour = G.C.CHIPS,
                extra = {
                    mult_mod = effect.mult,
                    message = localize {
                        type = 'variable',
                        key = 'a_mult',
                        vars = {effect.mult}
                    },
                    colour = G.C.MULT
                }
            }
        end
    end
}

if SMODS.Mods['JokerDisplay'] and _G['JokerDisplay'] then
    local jd_def = JokerDisplay.Definitions
    jd_def["j_kcva_composition"] = {
        text = {
            { text = "+", colour = G.C.MULT },
            { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult", colour = G.C.MULT },
            { text = "+", colour = G.C.CHIPS },
            { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult", colour = G.C.CHIPS }
        },
        calc_function = function(card)
            local effect = kcv_composition_calc_effect(card, card.ability.extra.mult, card.ability.extra.chips)
            card.joker_display_values.mult = effect.mult
            card.joker_display_values.chips = effect.chips
        end
    }
end
