KCVanilla = SMODS.current_mod

-- Using this to reset Power Grid, in the scenario Power Grid was destroyed mid-round
function KCVanilla.reset_game_globals(run_start)
    if run_start then
        -- Globals for a whole run (like Fortune Teller)
    else
        -- Globals for a single blind (like Idol)
        G.GAME.current_round.kcv_mults_scored = 0 -- Power Grid
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

local kcv_jokerAtlasOrder = {'5day', 'chan', 'swiss', 'collapse', 'drummajor', 'energy', 'fortunecookie', 'guard',
                             'irish', 'composition', 'powergrid', 'rakugo', 'rats', 'redenvelope', 'robo', 'handy',
                             'squid', 'tenpin'}

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
-- NFS.load(SMODS.current_mod.path .. 'jokers/drummajor.lua')()
NFS.load(SMODS.current_mod.path .. 'jokers/rakugo.lua')()
-- NFS.load(SMODS.current_mod.path .. 'jokers/rats.lua')()

function G.FUNCS.kcv_discover_all()
    for _, key in ipairs(kcv_jokerAtlasOrder) do
        local card = G.P_CENTERS["j_kcvanilla_" .. key]
        if card then
            discover_card(card)
        end
    end
end

function G.FUNCS.kcv_undiscover_all()
    for _, key in ipairs(kcv_jokerAtlasOrder) do
        local card = G.P_CENTERS["j_kcvanilla_" .. key]
        if card then
            kcv_undiscover(card)
        end
    end
end

function kcv_undiscover(card)
    if G.GAME.seeded or G.GAME.challenge then
        return
    end
    card.discovered = false
    set_discover_tallies()
    G.E_MANAGER:add_event(Event({
        func = (function()
            G:save_progress()
            return true
        end)
    }))
end

SMODS.current_mod.config_tab = function()
    return {
        n = G.UIT.ROOT,
        config = {
            align = "cm",
            minh = G.ROOM.T.h * 0.25,
            padding = 0.2,
            r = 0.1,
            colour = G.C.GREY
        },
        nodes = {UIBox_button({
            label = {"Discover all"},
            button = 'kcv_discover_all'
        }), UIBox_button({
            label = {"Uniscover all"},
            button = 'kcv_undiscover_all'
        })}
    }
end
