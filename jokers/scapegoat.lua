function kcv_get_cards_except(cards, card)
    local res = {}
    for k, v in ipairs(cards) do
        if v ~= card then
            table.insert(res, v)
        end
    end
    return res
end

SMODS.Joker {
    key = "scapegoat",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('scapegoat')
    },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    config = {},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {}
        }
    end,
    calculate = function(self, card, context)
        if context.first_hand_drawn then
            local eval = function()
                return G.GAME.current_round.discards_used == 0 and not G.RESET_JIGGLES
            end
            juice_card_until(card, eval, true)
        end
        if context.discard and not context.blueprint then
            if G.GAME.current_round.discards_used <= 0 and #context.full_hand == 1 and not context.other_card.debuff then
                local chip_val = context.other_card:get_chip_bonus()
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up()
                        return true
                    end
                }))

                local hand_except_discarded = kcv_get_cards_except(G.hand.cards, context.other_card)

                if #hand_except_discarded > 0 then
                    local held_card = pseudorandom_element(hand_except_discarded, pseudoseed('kcv_scapegoat'))
                    if held_card and held_card.debuff then
                        return {
                            message = localize('k_debuffed'),
                            colour = G.C.RED,
                            remove = true,
                            card = held_card
                        }
                    elseif held_card then
                        held_card.ability.perma_bonus = held_card.ability.perma_bonus + chip_val
                        return {
                            message = localize('k_upgrade_ex'),
                            colour = G.C.CHIPS,
                            remove = true,
                            card = held_card
                        }
                    end
                end
            end
        end
    end
}
