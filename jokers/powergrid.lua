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
        cur_xmult = 1,
        extra = 0.2
    },
    loc_txt = {
        name = "Power Grid",
        text = {'Scoring {C:attention}Mult{} cards gives {X:mult,C:white} X#1# {} Mult',
                'for each {C:attention}Mult{} card scored this round',
                "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra, (G.GAME.current_round.kcv_powergrid_xmult or 1)}
        }
    end,
    calculate = function(self, card, context)
        if context.start_of_round then
            G.GAME.current_round.kcv_powergrid_xmult = 1
        end

        -- technically this isn't per-score,
        -- two powergrids will compound on each other.
        -- But the code is simpler and the numbers are more fun this way
        if context.individual and context.cardarea == G.play then
            local other = context.other_card
            if other.ability.name == 'Mult' and not other.debuff then
                G.GAME.current_round.kcv_powergrid_xmult = (G.GAME.current_round.kcv_powergrid_xmult or 1) +
                                                               card.ability.extra
                return {
                    x_mult = G.GAME.current_round.kcv_powergrid_xmult,
                    card = context.blueprint_card or card
                }
            end
        end

        if context.end_of_round then
            card.ability.cur_xmult = 1
        end
    end
}
