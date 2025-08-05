SMODS.Joker {
    key = "rats",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('rats')
    },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    config = {
        can_spawn = true
    },
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    calculate = function(self, card, context)
        if context.first_hand_drawn and not context.blueprint then
            card.ability.can_spawn = false

            if #G.hand.cards > 1 then
                local card_to_destroy = pseudorandom_element(G.hand.cards, pseudoseed('kcv_rats'))
                if card_to_destroy then

                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = localize('kcv_rats_msg'),
                        colour = G.C.FILTER,
                        card = card
                    });

                    SMODS.destroy_cards(card_to_destroy)

                    delay(0.15)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local has_room = #G.jokers.cards < G.jokers.config.card_limit
                            if has_room then
                                play_sound('timpani')
                                local new_rat = copy_card(card, nil, nil, nil, card.edition and card.edition.negative)
                                new_rat:add_to_deck()
                                G.jokers:emplace(new_rat)
                            end
                            return true
                        end
                    }))
                end
            end

            return true
        end

        if context.end_of_round and context.cardarea == G.jokers then
            card.ability.can_spawn = true
        end

    end
}
