local function kcv_composition_calc_effect(card)
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
    blueprint_compat = true,
    config = {
        extra = {
            chips = 0,
            mult = 0
        }
    },
    loc_txt = {
        name = "Composition",
        text = {"{C:mult}+4{} Mult for each Joker to the left,", "{C:chips}+30{} Chips for each Joker to the right",
                "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult and {C:chips}+#2#{C:inactive} Chips){}"}
    },
    loc_vars = function(self, info_queue, card)
        local effect = kcv_composition_calc_effect(card)
        return {
            vars = {effect.mult, effect.chips}
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local target_card = context.blueprint_card or card
            local effect = kcv_composition_calc_effect(target_card)

            if effect.chips == 0 and effect.mult == 0 then
                return
            end

            -- nested chip_mod result to be extracted and evaluated separately from mult_mod
            local kcv_composition_chips_effect = {
                chip_mod = effect.chips,
                message = localize {
                    type = 'variable',
                    key = 'a_chips',
                    vars = {effect.chips}
                }
            }

            return {
                kcv_composition_chips_effect = kcv_composition_chips_effect,
                mult_mod = effect.mult,
                message = localize {
                    type = 'variable',
                    key = 'a_mult',
                    vars = {effect.mult}
                }
            }

            -- Below works, but cannot hook into the "percent" sfx modifier
            -- SMODS.eval_this(target_card, {
            --     message = localize {
            --         type = 'variable',
            --         key = 'a_chips',
            --         vars = {effect.chips}
            --     },
            --     chip_mod = effect.chips,
            --     colour = G.C.CHIPS
            -- })
            -- SMODS.eval_this(target_card, {
            --     message = localize {
            --         type = 'variable',
            --         key = 'a_mult',
            --         vars = {effect.mult}
            --     },
            --     mult_mod = effect.mult,
            --     colour = G.C.MULT
            -- })
        end
    end
}
