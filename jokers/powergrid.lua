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
                'for every {C:attention}Mult{} card scored this round',
                "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult"}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra, card.ability.cur_xmult}
        }
    end,
    calculate = function(self, card, context)

        if context.individual and context.cardarea == G.play then
            kcv_log(1)
            local other = context.other_card
            kcv_log(other.ability.name)
            if other.ability.name == 'Mult' then
                card.ability.cur_xmult = card.ability.cur_xmult + card.ability.extra
                return {
                    x_mult = card.ability.cur_xmult,
                    card = other
                }
            end
        end
        if context.after then
            card.ability.cur_xmult = 1
        end
    end
}
