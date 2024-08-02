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
        mult = 0
    },
    loc_txt = {
        name = "Swiss Joker",
        text = {'{C:mult}+10{} Mult for each', 'unscored card played', 'in previous hand',
                '{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)'}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.mult}
        }
    end,
    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            card.ability.mult = 10 * (#context.full_hand - #context.scoring_hand)
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
