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
    -- enhancement_gate = 'm_lucky',
    config = {},
    loc_txt = {
        name = "Luck of the Irish",
        text = { "{C:attention}Lucky{} {C:clubs}Clubs{} are {X:green,C:white} 4X {} more", "likely to successfully trigger" }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {}
        }
    end,
    calculate = function(self, card, context)
    end
}

if SMODS.Mods['JokerDisplay'] and _G['JokerDisplay'] then
    local jd_def = JokerDisplay.Definitions
    jd_def["j_kcva_irish"] = {
        text = {
            { text = "Lucky ", colour = G.C.IMPORTANT }, -- No localization for "Lucky"
            { text = localize("Clubs", "suits_plural").." ", colour = G.C.SUITS.Clubs },
            {
                border_nodes = {
                    { text = "4X" }
                },
                border_colour = G.C.CHANCE
            }
        }
    }
end
