SMODS.Joker {
    key = "collapse",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('collapse')
    },
    rarity = 3,
    cost = 7,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        numerator = 1,
        denominator = 2
    },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.numerator,
            card.ability.denominator, 'cosmiccollapse')
        info_queue[#info_queue + 1] = G.P_CENTERS.c_black_hole
        return {
            vars = {numerator, denominator}
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and not context.repetition and not context.individual then
            local success_planets = {}
            for i, consumable in ipairs(G.consumeables.cards) do
                if consumable.ability.set == 'Planet' and not consumable.kcv_collapse then
                    local success = SMODS.pseudorandom_probability(consumable, 'cosmiccollapse', card.ability.numerator,
                        card.ability.denominator, 'cosmiccollapse')
                    if success then
                        table.insert(success_planets, consumable)
                        -- ensure dupe jokers don't try to collapse the same card
                        consumable.kcv_collapse = true
                    end
                end
            end

            if #success_planets > 0 then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {
                    message = "Collapse!",
                    card = context.blueprint_card or card
                });
            end

            for i, planet in ipairs(success_planets) do
                -- Balatro vanilla doesn't do this on set_ability, only on card removal
                -- Doesn't matter in Vanilla, but it does here
                for k, v in pairs(G.P_CENTERS) do
                    if v.name == planet.ability.name then
                        G.GAME.used_jokers[k] = nil
                    end
                end

                -- need this because vanilla doesn't accomodate for transforming planets
                planet.config.card = {}
                G.E_MANAGER:add_event(Event({
                    func = function()
                        if planet.kcv_collapse == true then -- may have been collapsed by other joker
                            planet.kcv_collapse = nil
                            play_sound('tarot2', 1.1, 0.6)
                            planet:set_ability(G.P_CENTERS.c_black_hole)
                            planet:juice_up(1, 0.5)
                        end
                        return true
                    end
                }))
                delay(0.4)
            end
        end
    end
}
