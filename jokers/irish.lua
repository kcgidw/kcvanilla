SMODS.Joker {
    key = "irish",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('irish')
    },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    enhancement_gate = 'm_lucky',
    config = {
        factor = 3
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
        return {
            vars = {card.ability.factor}
        }
    end,
    calculate = function(self, card, context)
        if context.mod_probability and not context.blueprint then
            local lucky_card = context.trigger_obj
            local is_lucky_event = context.identifier == 'lucky_mult' or context.identifier == 'lucky_money'
            if lucky_card and lucky_card.is_suit and lucky_card:is_suit("Clubs") and is_lucky_event then
                return {
                    numerator = context.numerator * card.ability.factor
                }
            end
        end
    end
}
