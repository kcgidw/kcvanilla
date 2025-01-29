SMODS.Joker {
    key = "energy",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('energy')
    },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    enhancement_gate = 'm_wild',
    config = {
        kcv = {
            chips = 100,
            mult = 10,
            Xmult = 2,
            money = 5
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
        return {
            vars = {card.ability.kcv.mult, card.ability.kcv.chips, card.ability.kcv.Xmult, card.ability.kcv.money}
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local other = context.other_card
            if other.ability.name == 'Wild Card' and not other.debuff then
                local roll = pseudorandom_element({'amult', 'chips', 'xmult', 'money'})
                if roll == 'amult' then
                    return {
                        mult = card.ability.kcv.mult,
                        card = card
                    }
                elseif roll == 'chips' then
                    return {
                        chips = card.ability.kcv.chips,
                        card = card
                    }
                elseif roll == 'xmult' then
                    return {
                        x_mult = card.ability.kcv.Xmult,
                        card = card
                    }
                elseif roll == 'money' then
                    return {
                        dollars = card.ability.kcv.money,
                        card = card
                    }
                end
            end
        end
    end
}
