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
    loc_txt = {
        name = "Power Grid",
        text = {'Scoring {C:attention}Mult{} cards gives {X:mult,C:white} X#1# {} Mult',
                'for each {C:attention}Mult{} card scored this round',
                "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"}
    },
    loc_vars = function(self, info_queue, card)
        local xmult = 1.2 + ((G.GAME.current_round.kcv_mults_scored or 0) * 0.2)
        return {
            vars = {card.ability.extra, xmult}
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local other = context.other_card
            if other.ability.name == 'Mult' and not other.debuff then
                local xmult = 1.2 + ((G.GAME.current_round.kcv_mults_scored or 0) * 0.2)
                return {
                    x_mult = xmult,
                    card = context.blueprint_card or card
                }
            end
        end
    end
}
