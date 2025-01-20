SMODS.Joker {
    key = "redenvelope",
    name = "Red Envelope",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('redenvelope')
    },
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    config = {},
    loc_txt = {
        name = "Red Envelope",
        text = {'When Boss Blind is defeated,', 'earn {C:money}$8{} for each {C:blue}Common{} Joker',
                '{C:inactive}(Currently {C:money}$#1#{C:inactive})'}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {8 * kcv_common_joker_count()}
        }
    end,
    calc_dollar_bonus = function(self, card)
        if G.GAME.blind.boss then
            return 8 * kcv_common_joker_count()
        end
    end
}
