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

local kcv_jokerAtlasOrder = {'5day', 'chan', 'swiss', 'collapse', 'energy', 'fortunecookie', 'guard', 'irish',
                             'loosetooth', 'composition', 'powergrid', 'rakugo', 'rats', 'redenvelope', 'robo',
                             'scapegoat', 'handy', 'squid', 'tenpin'}

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

assert(SMODS.load_file('jokers/composition.lua'))()
assert(SMODS.load_file('jokers/fortunecookie.lua'))()
assert(SMODS.load_file('jokers/tenpin.lua'))()
assert(SMODS.load_file('jokers/robo.lua'))()
assert(SMODS.load_file('jokers/squid.lua'))()
assert(SMODS.load_file('jokers/redenvelope.lua'))()
assert(SMODS.load_file('jokers/swiss.lua'))()
assert(SMODS.load_file('jokers/chan.lua'))()
assert(SMODS.load_file('jokers/5day.lua'))()
assert(SMODS.load_file('jokers/handy.lua'))()
assert(SMODS.load_file('jokers/energy.lua'))()
assert(SMODS.load_file('jokers/powergrid.lua'))()
assert(SMODS.load_file('jokers/guard.lua'))()
assert(SMODS.load_file('jokers/collapse.lua'))()
assert(SMODS.load_file('jokers/irish.lua'))()
assert(SMODS.load_file('jokers/rakugo.lua'))()
assert(SMODS.load_file('jokers/rats.lua'))()
assert(SMODS.load_file('jokers/scapegoat.lua'))()
assert(SMODS.load_file('jokers/loosetooth.lua'))()

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
            label = {localize("kcv_discover_all") or "Discover all"},
            button = 'kcv_discover_all'
        }), UIBox_button({
            label = {localize("kcv_undiscover_all") or "Undiscover all"},
            button = 'kcv_undiscover_all'
        })}
    }
end
