--- STEAMODDED HEADER
--- MOD_NAME: KCVanilla
--- MOD_ID: KCVanilla
--- MOD_DESCRIPTION: KCVanilla
--- MOD_AUTHOR: [krackocloud]
--- LOADER_VERSION_GEQ: 1.0.0
SMODS.Atlas {
    key = 'kcvanillajokeratlas',
    path = "jokeratlas.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = "fortunecookie",
    name = "Fortune Cookie",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = 0
    },
    rarity = 1,
    cost = 3,
    unlocked = true,
    discovered = true,
    eternal_compat = false,
    perishable_compat = true,
    config = {
        extra = {
            chips = 150,
            chip_mod = 50
        }
    },
    loc_txt = {
        name = "Fortune Cookie",
        text = {"+#1# Chips,", "-#2# Chips when Tarot card is used"}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.chips, card.ability.extra.chip_mod}
        }
    end,
    calculate = function(card, context)
        if context.using_consumeable and (context.consumeable.ability.set == "Tarot") and not context.blueprint then
            new_chip_val = self.ability.extra.chips - self.ability.extra.chip_mod
            if (new_chip_val > 0) then
                self.ability.extra.chips = new_chip_val
                return {
                    message = localize {
                        type = 'variable',
                        key = 'a_chips_minus',
                        vars = {self.ability.extra.chip_mod}
                    },
                    colour = G.C.CHIPS
                }
            else
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        self.T.r = -0.2
                        self:juice_up(0.3, 0.4)
                        self.states.drag.is = true
                        self.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.3,
                            blockable = false,
                            func = function()
                                G.jokers:remove_card(self)
                                self:remove()
                                self = nil
                                return true;
                            end
                        }))
                        return true
                    end
                }))
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.RED
                }
            end
        end
    end
}
