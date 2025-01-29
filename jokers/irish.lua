function kcv_get_irish_normal(card)
    local x = G.GAME.probabilities.normal
    if G.jokers and card and card:is_suit("Clubs") then
        for i, joker in ipairs(G.jokers.cards) do
            if joker.ability.name == 'Luck of the Irish' and not joker.debuff then
                x = x * 4
            end
        end
    end
    return x
end

SMODS.Joker {
    key = "irish",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('irish')
    },
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    -- enhancement_gate = 'm_lucky',
    config = {},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
        return {
            vars = {}
        }
    end,
    calculate = function(self, card, context)
    end
}
