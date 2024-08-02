SMODS.Joker {
    key = "irish",
    name = "Luck of the Irish",
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
    enhacement_gate = 'm_lucky',
    config = {},
    loc_txt = {
        name = "Luck of the Irish",
        text = {"{C:attention}Lucky{} {C:clubs}Clubs{} are {C:green}4X{} more", "likely to succeed"}
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {}
        }
    end,
    calculate = function(self, card, context)
    end
}
