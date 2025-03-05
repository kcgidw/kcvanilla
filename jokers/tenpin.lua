SMODS.Joker {
    key = "tenpin",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('tenpin')
    },
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        x_mult = 1,
        hands_remaining = 0
    },
    loc_vars = function(self, info_queue, card)
        local remaining_txt
        if card.ability.hands_remaining > 0 then
            remaining_txt = localize {
                type = 'variable',
                key = 'kcv_active_for_X_more_hands',
                vars = {card.ability.hands_remaining}
            }
        else
            remaining_txt = localize('kcv_inactive')
        end
        return {
            vars = {remaining_txt}
        }
    end,
    calculate = function(self, card, context)
        if context.after and context.scoring_hand and not context.blueprint then
            local has_10
            for i, other_card in ipairs(context.scoring_hand) do
                if other_card:get_id() == 10 and not other_card.debuff then
                    has_10 = true
                    break
                end
            end
            if has_10 then
                card.ability.hands_remaining = 2
                card.ability.x_mult = 2
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = localize('k_active_ex')
                });
            else
                card.ability.hands_remaining = card.ability.hands_remaining - 1
                if card.ability.hands_remaining > 0 then
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = card.ability.hands_remaining .. ' remaining'
                    });
                elseif card.ability.x_mult == 2 then
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = localize('k_reset')
                    });
                    G.E_MANAGER:add_event(Event({
                        trigger = 'immediate',
                        func = function()
                            card.ability.x_mult = 1
                            return true
                        end
                    }))
                end
            end
        end
    end
}
