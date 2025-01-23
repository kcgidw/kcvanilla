local function kcv_rank_up_discreetly(card)
    -- local newcard = kcv_get_rank_up_pcard(card)
    card.kcv_ignore_debuff_check = true
    card.kcv_ranked_up_discreetly = true
    -- card:set_base(newcard)

    local old_rank = SMODS.Ranks[card.base.value]
    local new_rank = old_rank.next[1]
    card.kcv_display_rank = card.kcv_display_rank and card.kcv_display_rank or old_rank

    SMODS.change_base(card, card.base.suit, new_rank) -- Should respect "kcv_ranked_up_discreetly" as it uses card:set_base
end

SMODS.Joker {
    key = "5day",
    name = "Five-Day Forecast",
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
    loc_txt = {
        name = "Five-Day Forecast",
        text = {"If played hand contains a {C:attention}Straight{},",
                "increase played cards' ranks by {C:attention}1{}",
                "{C:inactive}(Excludes {C:attention}Aces{C:inactive})"}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {}
        }
    end,
    calculate = function(self, card, context)
        -- TODO: How should this behave with Midas?
        -- kcv_forecast_event is like `before` but occurs just prior.
        -- Using `before` directly causes weird *player-perceived* desyncs between kcv_rank_up_discreetly, E_MANAGER events, and other calcs 
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
                            -- kcv_log(other_c_3.base.id .. ' - ' .. other_c_3.kcv_display_rank)
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
                                other_c_3.kcv_ignore_debuff_check = nil
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

if SMODS.Mods['JokerDisplay'] and _G['JokerDisplay'] then
    local jd_def = JokerDisplay.Definitions
    jd_def["j_kcva_5day"] = {
        text = {
            { text = localize("ph_score_cards_played") },
            { text = " +1 ", colour = G.C.IMPORTANT },
            { text = localize("k_rank") }
        },
        extra = {
            {
                { text = "(Excludes ", colour = G.C.JOKER_GREY, scale = 0.2 },
                { text = localize("k_aces"), colour = G.C.IMPORTANT,  scale = 0.2 },
                { text = ")", colour = G.C.JOKER_GREY, scale = 0.2 }
            }
        },
        reminder_text = {
            { text = "(", scale = 0.2 },
            { text = localize("Straight", "poker_hands"), colour = G.C.IMPORTANT, scale = 0.2 },
            { text = ")", scale = 0.2 }
        }
    }
end
