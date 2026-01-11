local function kcv_count_unique_gaps(cards)
    local ranks_in_hand = {}
    for _, card in ipairs(cards) do
        local id = card:get_id()
        ranks_in_hand[id] = true
    end
    local count = 0
    for n = 3, 13 do
        if ranks_in_hand[n - 1] and ranks_in_hand[n + 1] and not ranks_in_hand[n] then
            count = count + 1
        end
    end
    -- A 2 3
    if ranks_in_hand[14] and ranks_in_hand[3] and not ranks_in_hand[2] then
        count = count + 1
    end
    return count
end

SMODS.Joker {
    key = "swiss",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('swiss')
    },
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.scoring_hand then
            local count = kcv_count_unique_gaps(context.scoring_hand)
            if count > 0 then
                return {
                    xmult = (count * card.ability.extra.xmult) + 1
                }
            end
        end
    end
}
