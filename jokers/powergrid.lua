SMODS.Joker {
    key = "powergrid",
    name = "Power Grid",
    atlas = 'kcvanillajokeratlas',
    pos = {
        x = 0,
        y = kcv_getJokerAtlasIndex('powergrid')
    },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    -- enhancement_gate = 'm_mult',
    config = {
        extra = 0.2
    },
    loc_txt = {
        name = "Power Grid",
        text = {'Scored {C:attention}Mult{} cards give {X:mult,C:white} X#1# {} Mult',
                'for each {C:attention}Mult{} card scored this round',
                "{C:inactive}(Next: {X:mult,C:white} X#2# {C:inactive} Mult)"}
    },
    loc_vars = function(self, info_queue, card)
        local xmult = 1 + card.ability.extra + ((G.GAME.current_round.kcv_mults_scored or 0) * card.ability.extra)
        return {
            vars = {card.ability.extra, xmult}
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local other = context.other_card
            if other.ability.name == 'Mult' and not other.debuff then
                local xmult = 1 + card.ability.extra +
                                  ((G.GAME.current_round.kcv_mults_scored or 0) * card.ability.extra)
                return {
                    x_mult = xmult,
                    card = context.blueprint_card or card
                }
            end
        end
    end
}

if SMODS.Mods['JokerDisplay'] and _G['JokerDisplay'] then
    local jd_def = JokerDisplay.Definitions
    jd_def["j_kcva_powergrid"] = {
        --[[
            This PR includes tooltips for all Jokers except for Power Grid. I don't understand what that Joker does...

            I assume it should be starting at "x1.0" and gaining "x0.2" for every playing card scored with +Mult, then resetting on round end.
            Testing in game, however, I can't get it to increase (or decrease) from "x1.2"... It even starts the round at "x1.2"!
            And even while claiming "x1.2", it doesn't seem to ever actually apply that "x0.2" mult anywhere. Played hands just skip this Joker.
            I've tried +Mult, xMult, Holographic, Polychrome, Lucky, and Red Seal. Nothing changes. The code looks fine, so I don't understand.

            Testing was done with:
                - Balatro 1.0.1g
                - Lovely 0.5.0-beta7
                - Steammodded 1.0.0-1006a
                - "_RELEASE_MODE = false"

            I wasn't even including JokerDisplay compat in testing, just this mod and the Joker's core functionality.

            *shrugs* I'm leaving it with no display for now. I don't want to add something that I cannot test for.
            I assume just a simple "x_mult" border_node is all that is needed. (Can be copied directly from Handy.)
            Please discuss within this PR (or Discord) and I will update it, or you may merge this and do so yourself.

            ~Toranaado (@TehSeph)
        ]] --
    }
end
