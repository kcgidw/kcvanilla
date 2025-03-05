SMODS.Joker {
    key = "powergrid",
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
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
        local xmult = 1 + card.ability.extra + ((G.GAME.current_round.kcv_mults_scored or 0) * card.ability.extra)
        return {
            vars = {card.ability.extra, xmult}
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local other = context.other_card
            if SMODS.has_enhancement(other, 'm_mult') and not other.debuff then
                local xmult = 1 + ((G.GAME.current_round.kcv_mults_scored or 0) * card.ability.extra)
                return {
                    x_mult = xmult,
                    card = context.blueprint_card or card
                }
            end
        end
    end
}
