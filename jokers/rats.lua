SMODS.Joker {
    key = "rats",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('rats')
    },
    rarity = 2,
    cost = 7,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = {}
    },
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    calculate = function(self, card, context)
    end
}
