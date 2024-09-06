local function kcv_get_suit_prefix(card)
    local suit_prefix = string.sub(card.base.suit, 1, 1)
    return suit_prefix
end

local function kcv_get_rank_suffix(id)
    if id < 10 then
        return tostring(id)
    elseif id == 10 then
        return 'T'
    elseif id == 11 then
        return 'J'
    elseif id == 12 then
        return 'Q'
    elseif id == 13 then
        return 'K'
    else
        return 'A'
    end
end

local function kcv_get_rank_up_pcard(card)
    local suit_prefix = kcv_get_suit_prefix(card)
    local rank_suffix = kcv_get_rank_suffix(math.min(card.base.id + 1, 14))
    return G.P_CARDS[suit_prefix .. '_' .. rank_suffix]
end

local function kcv_rank_up_discreetly(card)
    local newcard = kcv_get_rank_up_pcard(card)
    card.kcv_ignore_debuff_check = true
    card.kcv_ranked_up_discreetly = true
    card.kcv_display_id = card.kcv_display_id and card.kcv_display_id or card.base.id
    card:set_base(newcard)
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
                    local percent = 1.15 - (i_2 - 0.999) / (#G.hand.cards - 0.998) * 0.3
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
                    local percent = 0.85 + (i_3 - 0.999) / (#G.hand.cards - 0.998) * 0.3
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            if not other_c_3.kcv_ranked_up_discreetly then
                                -- was complete, but another 5-day joker is targeting this card
                                return true
                            end
                            -- kcv_log(other_c_3.base.id .. ' - ' .. other_c_3.kcv_display_id)
                            other_c_3.kcv_display_id = other_c_3.kcv_display_id + 1
                            local suit_prefix = kcv_get_suit_prefix(other_c_3)
                            local rank_suffix = kcv_get_rank_suffix(other_c_3.kcv_display_id)
                            local newcard = G.P_CARDS[suit_prefix .. '_' .. rank_suffix]
                            -- set_base again to update sprites that were postponed by kcv_ranked_up_discreetly
                            other_c_3:set_sprites(nil, newcard)
                            play_sound('tarot2', percent, 0.6)
                            other_c_3:flip()
                            if other_c_3.kcv_display_id >= other_c_3.base.id then
                                -- cleanup
                                other_c_3.kcv_ranked_up_discreetly = nil
                                other_c_3.kcv_ignore_debuff_check = nil
                                other_c_3.kcv_display_id = nil
                            end
                            return true
                        end
                    }))
                    delay(0.15)
                end
            end
        end
    end
}
