SMODS.Joker {
    key = "squid",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('squid')
    },
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    config = {
        h_size = 0,
        h_mod = 5
    },
    loc_vars = function(self, info_queue, card)
        local active_txt = localize(card.ability.h_size > 0 and "kcv_active" or "kcv_inactive")
        return {
            vars = {card.ability.h_mod, active_txt}
        }
    end,
    calculate = function(self, card, context)
        if hand_chips and (context.after or context.setting_blind or context.first_hand_drawn) then
            local winning_hand = G.GAME.chips + math.floor(hand_chips * mult) >= G.GAME.blind.chips
            if not winning_hand and G.GAME.current_round.hands_left <= 2 then
                if card.ability.h_size == 0 then
                    card.ability.h_size = card.ability.h_mod
                    G.hand:change_size(card.ability.h_size)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = localize {
                            type = 'variable',
                            key = 'a_handsize',
                            vars = {card.ability.h_mod}
                        },
                        colour = G.C.FILTER
                    });
                end
            end
        end
        if context.end_of_round and card.ability.h_size > 0 then
            card.ability.h_size = 0
            G.hand:change_size(-card.ability.h_mod)
            card_eval_status_text(card, 'extra', nil, nil, nil, {
                message = localize {
                    type = 'variable',
                    key = 'a_handsize_minus',
                    vars = {card.ability.h_mod}
                },
                colour = G.C.FILTER
            });
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if G.GAME.current_round.hands_left <= 2 then
            card.ability.h_size = 5
        end
    end
}
