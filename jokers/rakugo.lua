SMODS.Joker {
    key = "rakugo",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('rakugo')
    },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {},
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    calculate = function(self, card, context)
        if context.repetition and context.other_card and context.poker_hands then
            if next(context.poker_hands["Straight"]) then
                local rank = context.other_card:get_id()
                if rank == 4 or rank == 5 or rank == 6 or rank == 7 or rank == 8 then
                    return {
                        message = localize('k_again_ex'),
                        repetitions = 1,
                        card = card
                    }
                end
            end
        end
    end
}
