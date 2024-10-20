SMODS.Joker {
    key = "redenvelope",
    name = "Red Envelope",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('redenvelope')
    },
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    config = {},
    loc_txt = {
        name = "Red Envelope",
        text = {'When Boss Blind is defeated,', 'earn {C:money}$8{} for each {C:blue}Common{} Joker',
                '{C:inactive}(Currently {C:money}$#1#{C:inactive})'}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {8 * kcv_common_joker_count()}
        }
    end,
    calc_dollar_bonus = function(self, card)
        if G.GAME.blind.boss then
            return 8 * kcv_common_joker_count()
        end
    end
}

if SMODS.Mods['JokerDisplay'] and _G['JokerDisplay'] then
    local jd_def = JokerDisplay.Definitions
    jd_def["j_kcva_redenvelope"] = {
        text = {
            { text = "+$", colour = G.C.MONEY },
            { ref_table = "card.joker_display_values", ref_value = "bonus", retrigger_type = "mult", colour = G.C.MONEY }
        },
        reminder_text = {
            { text = "(", scale = 0.2 },
            { text = localize("k_common"), colour = G.C.BLUE, scale = 0.2 },
            { text = " ", scale = 0.2 },
            { text = localize("b_jokers"), colour = G.C.JOKER_GREY, scale = 0.2 },
            { text = ")", scale = 0.2 }
        },
        calc_function = function(card)
            card.joker_display_values.bonus = 8 * kcv_common_joker_count()
        end
    }
end
