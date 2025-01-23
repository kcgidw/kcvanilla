SMODS.Joker {
    key = "handy",
    name = "Handy Joker",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('handy')
    },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        x_mult = 1
    },
    loc_txt = {
        name = "Handy Joker",
        text = {'If first discard of round', 'is a single enhanced card,',
                'gain {X:mult,C:white} X1 {} Mult, resets when', 'Boss Blind is defeated',
                '{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)'}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.x_mult}
        }
    end,
    calculate = function(self, card, context)
        if context.first_hand_drawn and not context.blueprint then
            local eval = function()
                return G.GAME.current_round.discards_used == 0 and not G.RESET_JIGGLES
            end
            juice_card_until(card, eval, true)
        end
        if context.discard and context.full_hand and not context.blueprint then
            if #context.full_hand == 1 and context.other_card.config.center ~= G.P_CENTERS.c_base then
                card.ability.x_mult = card.ability.x_mult + 1
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = localize {
                        type = 'variable',
                        key = 'a_xmult',
                        vars = {card.ability.x_mult}
                    },
                    colour = G.C.RED,
                    card = card
                })
            end
        end
        if context.end_of_round and G.GAME.blind.boss and not context.blueprint and card.ability.x_mult ~= 1 then
            card.ability.x_mult = 1
            card_eval_status_text(card, 'extra', nil, nil, nil, {
                message = localize('k_reset')
            });
        end
    end
}

if SMODS.Mods['JokerDisplay'] and _G['JokerDisplay'] then
    local jd_def = JokerDisplay.Definitions
    jd_def["j_kcva_handy"] = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability", ref_value = "x_mult", retrigger_type = "exp" }
                }
            }
        }
    }
end
