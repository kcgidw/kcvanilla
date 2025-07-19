local function kcv_rank_up_discreetly(card)
    card.kcv_ranked_up_discreetly = true

    local old_rank = SMODS.Ranks[card.base.value]
    local new_rank = old_rank.next[1]
    card.kcv_display_rank = card.kcv_display_rank and card.kcv_display_rank or old_rank

    SMODS.change_base(card, card.base.suit, new_rank) -- Should respect "kcv_ranked_up_discreetly" as it uses card:set_base

    -- played_this_ante is set to true when played, but change_base re-evaluates debuff status,
    -- causing The Pillar to immediately debuff this on rank-up. So we reset played_this_ante and re-evaluate debuff status one last time
    card.ability.played_this_ante = nil
    G.GAME.blind:debuff_card(card)
end

SMODS.Joker {
    key = "5day",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('5day')
    },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {}
        }
    end,
    calculate = function(self, card, context)
        -- kcv_forecast_event needs an indivudal event because ranking up has weird timing
        if context.kcv_forecast_event and context.scoring_hand then
            if next(context.poker_hands["Straight"]) then
                for i, other_c in ipairs(context.scoring_hand) do
                    if other_c:get_id() ~= 14 then
                        kcv_rank_up_discreetly(other_c)
                    end
                end
            end
        end
        if context.before and context.scoring_hand then
            if next(context.poker_hands["Straight"]) then
                local targets = {}
                for i, other_c in ipairs(context.scoring_hand) do
                    if other_c.kcv_ranked_up_discreetly then
                        table.insert(targets, other_c)
                    end
                end

                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {
                    message = localize('k_active_ex'),
                    colour = G.C.FILTER,
                    card = context.blueprint_card or card
                });

                for i_2, other_c_2 in ipairs(targets) do
                    local percent = 1.15 - (i_2 - 0.999) / (#context.scoring_hand - 0.998) * 0.3
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            if not other_c_2.kcv_ranked_up_discreetly then
                                -- was complete, but another 5-day joker is targeting this card
                                return true
                            end
                            play_sound('card1', percent)
                            other_c_2:flip()
                            return true
                        end
                    }))
                    delay(0.15)
                end
                delay(0.3)
                for i_3, other_c_3 in ipairs(targets) do
                    local percent = 0.85 + (i_3 - 0.999) / (#context.scoring_hand - 0.998) * 0.3
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            if not other_c_3.kcv_ranked_up_discreetly then
                                -- was complete, but another 5-day joker is targeting this card
                                return true
                            end
                            other_c_3.kcv_display_rank = SMODS.Ranks[other_c_3.kcv_display_rank.next[1]]

                            -- Copying method SMODs uses
                            local card_suit = SMODS.Suits[other_c_3.base.suit].card_key
                            local card_rank = other_c_3.kcv_display_rank.card_key
                            local newcard = G.P_CARDS[('%s_%s'):format(card_suit, card_rank)]

                            -- set_base again to update sprites that were postponed by kcv_ranked_up_discreetly
                            other_c_3:set_sprites(nil, newcard)
                            play_sound('tarot2', percent, 0.6)
                            other_c_3:flip()
                            if other_c_3.kcv_display_rank.card_key == SMODS.Ranks[other_c_3.base.value].card_key then
                                -- cleanup
                                other_c_3.kcv_ranked_up_discreetly = nil
                                other_c_3.kcv_display_rank = nil
                            end
                            return true
                        end
                    }))
                    delay(0.15)
                end
                delay(0.5)
            end
        end
    end
}
