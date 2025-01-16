SMODS.Joker {
    key = "tenpin",
    name = "Ten-Pin",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('tenpin')
    },
    rarity = 1,
    cost = 6,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        x_mult = 1,
        hands_remaining = 0
    },
    loc_txt = {
        name = "Ten-Pin",
        text = {'If played hand contains a scoring {C:attention}10{},', '{X:mult,C:white} X2 {} Mult for next 2 hands',
                '{C:inactive}#1#{}'}
    },
    loc_vars = function(self, info_queue, card)
        local remaining_txt
        if card.ability.hands_remaining > 1 then
            remaining_txt = '(Active for ' .. card.ability.hands_remaining .. ' more hands)'
        elseif card.ability.hands_remaining == 1 then
            remaining_txt = '(Active for 1 more hand)'
        else
            remaining_txt = '(Inactive)'
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
                    card.ability.x_mult = 1
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = localize('k_reset')
                    });

                end
            end
        end
    end
}

if SMODS.Mods['JokerDisplay'] and _G['JokerDisplay'] then
    local jd_def = JokerDisplay.Definitions
    jd_def["j_kcva_tenpin"] = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability", ref_value = "x_mult", retrigger_type = "exp" }
                }
            }
        },
        extra = {
            {
                { text = "(", scale = 0.2 },
                { ref_table = "card.joker_display_values", ref_value = "remaining", scale = 0.2 }, -- bugfix, see below
                { text = localize("k_hud_hands") .. " " .. localize("b_remaining"), scale = 0.2 },
                { text = ")", scale = 0.2 }
            }
        },
        -- This is required because of a bug in the code above allowing "card.ability.hands_remaining" to go negative
        calc_function = function(card)
            card.joker_display_values.remaining = (card.ability.hands_remaining > 0) and card.ability.hands_remaining or 0
        end
    }
end
