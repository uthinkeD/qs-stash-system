local ESX = nil

local ESX = exports["es_extended"]:getSharedObject()

CreateThread(function()
    for _, stash in pairs(Config.Stashes or {}) do
        exports['qs-inventory']:RegisterStash(stash.stashId, stash.slots or 50, stash.weight or 100000)
    end
end)

CreateThread(function()
    for _, stash in pairs(Config.JobStashes or {}) do
        exports['qs-inventory']:RegisterStash(stash.stashId, stash.slots or 50, stash.weight or 100000)
    end
end)

RegisterNetEvent("uthink_nojob:openStash", function(stash)
    local src = source
    TriggerClientEvent("uthink_nojob:openInventory", src, stash.stashId)
end)

RegisterNetEvent("uthink_job:openStash", function(stash)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if stash.job then
        if not xPlayer or xPlayer.job.name ~= stash.job then
            return
        end

        local playerGrade = tonumber(xPlayer.job.grade) or 0
        local stashGrade = tonumber(stash.grade) or 0

        if playerGrade < stashGrade then
            return
        end
    end

    TriggerClientEvent("uthink_job:openInventory", src, stash.stashId)
end)
