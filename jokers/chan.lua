SMODS.Joker {
    key = "chan",
    name = "Joker-chan",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('chan')
    },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = false,
    blueprint_compat = true,
    config = {
        mult = 0,
        extra = 2
    },
    loc_txt = {
        name = "Joker-chan",
        text = {"At end of round, gains {C:mult}+#1#{} Mult", "for each {C:blue}Common{} Joker",
                "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult){}"}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra, card.ability.mult}
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and not context.repetition and not context.individual and not context.blueprint then
            local upgrade_amt = kcv_common_joker_count() * 2
            if upgrade_amt > 0 then
                card.ability.mult = card.ability.mult + upgrade_amt
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = localize {
                        type = 'variable',
                        key = 'a_mult',
                        vars = {upgrade_amt}
                    },
                    colour = G.C.RED,
                    card = card
                })
            end
        end
        if context.joker_main then
            if card.ability.mult > 0 then
                return {
                    message = localize {
                        type = 'variable',
                        key = 'a_mult',
                        vars = {card.ability.mult}
                    },
                    mult_mod = card.ability.mult
                }
            end
        end
    end
}

if SMODS.Mods['JokerDisplay'] and _G['JokerDisplay'] then
    local jd_def = JokerDisplay.Definitions
    jd_def["j_kcva_chan"] = {
        text = {
            { text = "+", colour = G.C.MULT },
            { ref_table = "card.ability", ref_value = "mult", retrigger_type = "mult", colour = G.C.MULT }
        }
    }
end
