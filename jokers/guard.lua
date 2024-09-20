SMODS.Joker {
    key = "guard",
    name = "Royal Guard",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('guard')
    },
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = true,
    eternal_compat = false,
    perishable_compat = true,
    blueprint_compat = false,
    config = {
        progress = 0,
        required_progress = 15
    },
    loc_txt = {
        name = "Royal Guard",
        text = {"After {C:attention}#2#{} {C:attention}Kings{} or {C:attention}Queens{}", "score, sell this to make a",
                "random Joker {C:dark_edition}Negative{}", "{C:inactive}(Progress: #1#/#2#){}"}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.progress, card.ability.required_progress}
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint and not context.other_card.debuff then
            local other_id = context.other_card:get_id()
            if other_id == 12 or other_id == 13 then
                if card.ability.progress < card.ability.required_progress then
                    card.ability.progress = card.ability.progress + 1
                    local sell_ready = card.ability.progress >= card.ability.required_progress
                    return {
                        extra = {
                            focus = card,
                            message = sell_ready and localize('k_active_ex') or
                                (card.ability.progress .. "/" .. card.ability.required_progress)
                        },
                        card = card,
                        colour = G.C.FILTER,
                        kcv_juice_card_until = sell_ready
                    }
                end
            end
        end
        if context.selling_self and card.ability.progress >= card.ability.required_progress and not context.blueprint then
            local candidates = {}
            for i, joker in ipairs(G.jokers.cards) do
                if joker ~= card and not joker.edition then
                    table.insert(candidates, joker)
                end
            end
            if #candidates > 0 then
                local target = pseudorandom_element(candidates, pseudoseed('royalguard'))
                target:set_edition({
                    negative = true
                })
            end
        end
    end
}
