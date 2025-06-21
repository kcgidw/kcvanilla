local function kcv_composition_calc_effect(card, extramult, extrachips)
    if not G.jokers then
        -- viewing card outside a run
        return {
            chips = 0,
            mult = 0
        }
    end
    local my_pos = nil
    local cards_to_left = 0
    local cards_to_right = 0
    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then
            my_pos = i
        elseif my_pos == nil then
            cards_to_left = cards_to_left + 1
        else
            cards_to_right = cards_to_right + 1
        end
    end
    local chips = cards_to_right * extrachips
    local mult = cards_to_left * extramult
    if my_pos == nil then
        chips = 0
        mult = 0
    end
    return {
        chips = chips,
        mult = mult
    }
end

SMODS.Joker {
    key = "composition",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('composition')
    },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = {
            mult = 4,
            chips = 20
        }
    },
    loc_vars = function(self, info_queue, card)
        local effect = kcv_composition_calc_effect(card, card.ability.extra.mult, card.ability.extra.chips)
        return {
            vars = {card.ability.extra.mult, card.ability.extra.chips, effect.mult, effect.chips}
        }
    end,
    
    calculate = function(self, card, context)
        if context.joker_main then
            local target_card = context.blueprint_card or card
            local effect = kcv_composition_calc_effect(target_card, card.ability.extra.mult, card.ability.extra.chips)
        
            local mult_message = nil
            if effect.mult > 0 then
                mult_message = {
                    mult_mod = effect.mult,
                    message = localize {
                        type = 'variable',
                        key = 'a_mult',
                        vars = {effect.mult}
                    },
                    colour = G.C.MULT
                }
            end
            
            if effect.chips > 0 then
                return {
                    chip_mod = effect.chips,
                    message = localize {
                        type = 'variable',
                        key = 'a_chips',
                        vars = {effect.chips}
                    },
                    colour = G.C.CHIPS,
                    extra = mult_message
                }
            else
                return mult_message
            end
        end
    end
}
