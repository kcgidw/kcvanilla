local function get_has_item(list, target)
    for i, item in ipairs(list) do
        if item == target then
            return true
        end
    end
    return false
end

local function get_has_nonscoring_ace(full_hand, scoring_hand)
    for i, card in ipairs(full_hand) do
        if card:get_id() == 14 then
            if card.debuff or not get_has_item(scoring_hand, card) then
                return true
            end
        end
    end
    return false
end

SMODS.Joker {
    key = "loosetooth",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('loosetooth')
    },
    rarity = 1,
    cost = 5,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {}
        }
    end,
    calculate = function(self, card, context)
        if context.after and context.scoring_hand and context.full_hand then
            local has_nonscoring_ace = get_has_nonscoring_ace(context.full_hand, context.scoring_hand)
            local has_room = #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit

            if has_nonscoring_ace and has_room then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                return {
                    extra = {
                        message = localize('k_plus_tarot'),
                        message_card = context.blueprint_card or card,
                        func = function()
                            G.E_MANAGER:add_event(Event({
                                func = (function()
                                    SMODS.add_card {
                                        set = 'Tarot',
                                        key_append = 'kcv_loosetooth'
                                    }
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end)
                            }))
                        end
                    }
                }
            end
        end
    end
}
