SMODS.Joker {
    key = "rakugo",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('rakugo')
    },
    rarity = 2,
    cost = 4,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    config = {
        booster_to_duplicate = nil,
        exhausted = false,
        skipping = false
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {localize(card.ability.exhausted and 'kcv_used' or 'kcv_ready')}
        }
    end,
    calculate = function(self, card, context)
        if context.blueprint then
            return
        end

        if context.end_of_round then
            if card.ability.exhausted then
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = localize('k_reset')
                });
            end
            card.ability.exhausted = false
            card.ability.skipping = false
            card.ability.booster_to_duplicate = nil
        end

        if context.open_booster and not card.ability.exhausted and card.ability.booster_to_duplicate == nil and
            context.card.kcv_swipeleft_owning_joker == nil then

            -- if there are multiple of this joker, only one can be active for the current booster
            context.card.kcv_swipeleft_owning_joker = card

            -- tracks if this joker is currently active for the current booster across context events
            card.ability.booster_to_duplicate = context.card
        end

        if context.skipping_booster and not card.ability.exhausted and card.ability.booster_to_duplicate ~= nil then
            card.ability.exhausted = true
            card.ability.skipping = true
            card_eval_status_text(card, 'extra', nil, nil, nil, {
                message = localize('k_again_ex'),
                colour = G.C.FILTER,
                card = card
            });
        end

        if context.ending_booster and card.ability.skipping and card.ability.booster_to_duplicate ~= nil then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local new_booster = copy_card(card.ability.booster_to_duplicate)
                    new_booster.cost = 0
                    card.ability.booster_to_duplicate = nil
                    card.ability.skipping = false

                    -- `booster_obj` is a global.
                    -- The exact timing of when this is set/nullified is important.
                    -- This line being in an event allows the new booster to only open after the previous booster state properly cleans up.
                    booster_obj = new_booster.config.center

                    G.FUNCS.use_card({
                        config = {
                            ref_table = new_booster
                        }
                    })
                    return true
                end
            }))
        end
    end
}

