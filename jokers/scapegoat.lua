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
                local held_card = pseudorandom_element(G.hand.cards, pseudoseed('kcv_scapegoat'))
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
}
