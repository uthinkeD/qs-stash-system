local ESX = exports["es_extended"]:getSharedObject()
local PlayerData = {}

RegisterNetEvent('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob', function(job)
    if PlayerData then
        PlayerData.job = job
    end
end)

local ox_target = exports.ox_target

if Config.Debug then
    print("[DEBUG] Creating target zones...") 
    print(json.encode(Config.Stashes))
    print(json.encode(Config.JobStashes))
end

for _, stash in pairs(Config.Stashes or {}) do
    if Config.Debug then
        print("[DEBUG] Creating Stash: " .. stash.stashId)
    end
    ox_target:addBoxZone({
        coords = stash.coords,
        size = vec3(1, 1, 1),
        rotation = 0,
        debug = Config.Debug,
        options = {
            {
                label = stash.label or "Stash",
                icon = "fas fa-box",
                onSelect = function()
                    TriggerServerEvent("uthink_nojob:openStash", stash)
                end
            }
        }
    })
end

for _, stash in pairs(Config.JobStashes or {}) do
    if Config.Debug then
        print("[DEBUG] Creating job stash: " .. stash.stashId)
    end
    ox_target:addBoxZone({
        coords = stash.coords,
        size = vec3(1, 1, 1),
        rotation = 0,
        debug = Config.Debug,
        options = {
            {
                label = stash.label or "Job Stash",
                icon = "fas fa-box",
                canInteract = function()
                    if not stash.job then return true end
                    if PlayerData.job and PlayerData.job.name == stash.job then
                        local playerGrade = tonumber(PlayerData.job.grade) or 0
                        local stashGrade = tonumber(stash.grade) or 0
                        return playerGrade >= stashGrade
                    end
                    return false
                end,
                onSelect = function()
                    TriggerServerEvent("uthink_job:openStash", stash)
                end
            }
        }
    })
end


RegisterNetEvent("uthink_nojob:openInventory", function(stashId)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", stashId)
end)

RegisterNetEvent("uthink_job:openInventory", function(stashId)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", stashId)
end)
