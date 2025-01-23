SMODS.Joker {
    key = "robo",
    name = "Jimbot",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('robo')
    },
    rarity = 1,
    cost = 5,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        chips = 0,
        extra = 0
    },
    loc_txt = {
        name = "Jimbot",
        text = {"Gains the {C:chips}Chip{} value of the first", "scored card ranked {C:attention}2-10{} each round",
                "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.chips}
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if card.ability.extra == 0 then
                local id = context.other_card:get_id()
                if not context.other_card.debuff and id >= 2 and id <= 10 then
                    local chip_val = context.other_card:get_chip_bonus()
                    card.ability.extra = chip_val
                    card.ability.chips = card.ability.chips + card.ability.extra
                    return {
                        extra = {
                            message = localize('k_upgrade_ex'),
                            colour = G.C.CHIPS,
                            focus = card
                        },
                        card = card
                    }
                end
            end
        end
        if context.end_of_round and not context.blueprint then
            card.ability.extra = 0
        end
        if context.joker_main then
            return {
                message = localize {
                    type = 'variable',
                    key = 'a_chips',
                    vars = {card.ability.chips}
                },
                chip_mod = card.ability.chips,
                colour = G.C.CHIPS
            }
        end
    end
}

if SMODS.Mods['JokerDisplay'] and _G['JokerDisplay'] then
    local jd_def = JokerDisplay.Definitions
    jd_def["j_kcva_robo"] = {
        text = {
            { text = "+", colour = G.C.CHIPS },
            { ref_table = "card.ability", ref_value = "chips", retrigger_type = "mult", colour = G.C.CHIPS }
        }
    }
end
