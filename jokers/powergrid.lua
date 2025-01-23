SMODS.Joker {
    key = "powergrid",
    name = "Power Grid",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('powergrid')
    },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    enhancement_gate = 'm_mult',
    config = {
        extra = 0.2
    },
    loc_txt = {set = 'Joker', key = 'j_kcvanilla_powergrid'},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
        local xmult = 1 + card.ability.extra + ((G.GAME.current_round.kcv_mults_scored or 0) * card.ability.extra)
        return {
            vars = {card.ability.extra, xmult}
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            G.GAME.current_round.kcv_mults_scored = 0
        end
        if context.individual and context.cardarea == G.play then
            local other = context.other_card
            local other_enhancements = SMODS.get_enhancements(other)
            if other_enhancements and other_enhancements.m_mult and not other.debuff then
                local xmult = 1 + ((G.GAME.current_round.kcv_mults_scored or 0) * card.ability.extra)
                return {
                    x_mult = xmult,
                    card = context.blueprint_card or card
                }
            end
        end
        if context.end_of_round then
            G.GAME.current_round.kcv_mults_scored = 0
        end
    end
}
