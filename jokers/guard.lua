local function kcv_tally_kq()
    if not G.playing_cards then
        return 8
    end

    local count = 0
    for k, card in pairs(G.playing_cards) do
        if card:get_id() == 12 or card:get_id() == 13 then
            count = count + 1
        end
    end
    return count
end

local function get_has_kq(full_hand)
    for i, card in ipairs(full_hand) do
        if card:get_id() == 12 or card:get_id() == 13 then
            return true
        end
    end
    return false
end

SMODS.Joker {
    key = "guard",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('guard')
    },
    rarity = 1,
    cost = 5,
    unlocked = true,
    discovered = true,
    eternal_compat = false,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        increment = 10
    },
    loc_vars = function(self, info_queue, card)
        local kq_tally = kcv_tally_kq()
        local chips = kq_tally * card.ability.increment
        return {
            vars = {card.ability.increment, chips}
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.full_hand then
            if get_has_kq(context.full_hand) then
                return
            end

            local kq_tally = kcv_tally_kq()
            local chips = kq_tally * card.ability.increment
            return {
                message = localize {
                    type = 'variable',
                    key = 'a_chips',
                    vars = {chips}
                },
                chip_mod = chips,
                colour = G.C.CHIPS
            }
        end
    end
}
