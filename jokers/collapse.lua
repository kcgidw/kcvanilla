SMODS.Joker {
    key = "collapse",
    name = "Cosmic Collapse",
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
    config = {},
    loc_txt = {
        name = "Cosmic Collapse",
        text = {'At end of round, held {C:planet}Planet{}', 'cards each have {C:green}#1# in 2{} chance',
                'to transform into a {C:spectral}Black Hole{}'}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {'' .. (G.GAME and G.GAME.probabilities.normal or 1)}
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and not context.repetition and not context.individual then
            local success_planets = {}
            for i, consumable in ipairs(G.consumeables.cards) do
                if consumable.ability.set == 'Planet' and not consumable.kcv_collapse then
                    local success = pseudorandom('cosmiccollapse') < G.GAME.probabilities.normal / 2
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
                -- need this bc OG doesn't accomodate for transforming planets
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
