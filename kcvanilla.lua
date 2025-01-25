KCVanilla = SMODS.current_mod

-- Using this to reset Power Grid, in the scenario Power Grid was destroyed mid-round
function KCVanilla.reset_game_globals(run_start)
    if run_start then
        -- Globals for a whole run (like Fortune Teller)
    else
        -- Globals for a single blind (like Idol)
        G.GAME.current_round.kcv_mults_scored = 0  -- Power Grid
    end
end

SMODS.Atlas {
    key = 'kcvanillajokeratlas',
    path = "jokeratlas.png",
    px = 71,
    py = 95
}

function kcv_log(str)
    sendInfoMessage(str, "KCVanilla")
end

local kcv_jokerAtlasOrder = {'5day', 'chan', 'swiss', 'collapse', 'energy', 'fortunecookie', 'guard', 'irish',
                             'composition', 'powergrid', 'redenvelope', 'robo', 'handy', 'squid', 'tenpin'}

function kcv_getJokerAtlasIndex(jokerKey)
    for i, v in ipairs(kcv_jokerAtlasOrder) do
        if v == jokerKey then
            return i - 1
        end
    end
    return 0
end

function kcv_common_joker_count()
    if not G.jokers or not G.jokers.cards then
        return 0
    end
    local count = 0
    for i, jok in ipairs(G.jokers.cards) do
        if jok.config.center.rarity == 1 then
            count = count + 1
        end
    end
    return count
end

NFS.load(SMODS.current_mod.path .. 'jokers/composition.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/fortunecookie.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/tenpin.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/robo.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/squid.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/redenvelope.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/swiss.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/chan.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/5day.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/handy.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/energy.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/powergrid.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/guard.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/collapse.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/irish.lua')()

function G.FUNCS.unlock_kcvanilla_jokers()
    for _, key in ipairs(kcv_jokerAtlasOrder) do
        discover_card(G.P_CENTERS["j_kcvanilla_" .. key])
    end
end

SMODS.current_mod.config_tab = function()
    return {
        n = G.UIT.ROOT,
        config = { align = "cm", minh = G.ROOM.T.h * 0.25, padding = 0.2, r = 0.1, colour = G.C.GREY },
        nodes = {
            UIBox_button({
                label = { "Discover KCVanilla Cards" },
                -- w = 4.5,
                button = 'unlock_kcvanilla_jokers',
            }),
            {
                n = G.UIT.R,
                config = { align = "cm", minh = 0.05 },
                nodes = {
                    { n = G.UIT.T, config = { text = "This cannot be undone", scale = 0.3, colour = G.C.UI.TEXT_LIGHT } }
                }
            }
        }
    }
end
