SMODS.Joker {
    key = "swiss",
    name = "Swiss Joker",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('swiss')
    },
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        mult = 0,
        extra = 12
    },
    loc_txt = {
        name = "Swiss Joker",
        text = {'{C:mult}+#1#{} Mult for each', 'card played in previous hand', 'that did not score',
                '{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)'}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra, card.ability.mult}
        }
    end,
    calculate = function(self, card, context)
        if context.after and context.scoring_hand and context.full_hand and not context.blueprint then
            local nonscoring_count = 0
            for i, v in ipairs(context.scoring_hand) do
                if v.debuff then
                    nonscoring_count = nonscoring_count + 1
                end
            end
            nonscoring_count = nonscoring_count + (#context.full_hand - #context.scoring_hand)
            card.ability.mult = card.ability.extra * nonscoring_count
            card_eval_status_text(card, 'extra', nil, nil, nil, {
                message = localize {
                    type = 'variable',
                    key = 'a_mult',
                    vars = {card.ability.mult}
                },
                colour = G.C.MULT
            });
        end
        if context.joker_main then
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
}
