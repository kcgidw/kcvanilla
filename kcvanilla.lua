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
