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
        extra = 0.2,
        jd_xmult = 1
    },
    loc_txt = {
        name = "Power Grid",
        text = {'Scored {C:attention}Mult{} cards give {X:mult,C:white} X#1# {} Mult',
                'for each {C:attention}Mult{} card scored this round',
                "{C:inactive}(Next: {X:mult,C:white} X#2# {C:inactive} Mult)"}
    },
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

if SMODS.Mods['JokerDisplay'] and _G['JokerDisplay'] then
    local jd_def = JokerDisplay.Definitions
    jd_def["j_kcva_powergrid"] = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability", ref_value = "jd_xmult", retrigger_type = "exp" }
                }
            }
        },
        calc_function = function(card)
            local total = 1
            local mod = 1 + ((G.GAME.current_round.kcv_mults_scored or 0) * card.ability.extra)
            local text, poker_hands, scoring_hand = JokerDisplay.evaluate_hand()
            for _, scoring_card in pairs(scoring_hand) do
                if scoring_card.ability.name == 'Mult' and not scoring_card.debuff then
                    mod = mod + card.ability.extra
                    total = total * mod
                end
            end
            if not next(G.play.cards) then
                card.ability.jd_xmult = total
            end
        end
    }
end
