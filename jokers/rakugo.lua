SMODS.Joker {
    key = "rakugo",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('rakugo')
    },
    rarity = 2,
    cost = 7,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = {
            count = 1,
            other_x_mult = 1.5
        }
    },
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    calculate = function(self, card, context)
        if context.other_joker then
            local this_idx = 0
            local other_idx = 0
            if this_idx < other_idx then

            end
        end
    end
}
