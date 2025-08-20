-- Show killfeed via NUI
RegisterNetEvent('100k_or_die_killfeed:showKillfeed')
AddEventHandler('100k_or_die_killfeed:showKillfeed', function(killerName, victimName)
    SendNUIMessage({
        type = 'showKillfeed',
        Layout = '[' .. (killerName or 'Unknown') .. '] killed [' .. (victimName or 'Unknown') .. ']'
    })
end)

-- Detect player kills (shooting only)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        local playerPed = PlayerPedId()
        if IsPedDeadOrDying(playerPed, true) then
            local killerId = NetworkGetEntityKillerOfPlayer(playerPed)
            if killerId ~= -1 and killerId ~= playerPed then
                local causeOfDeath = GetPedCauseOfDeath(playerPed)
                -- Check if death was caused by a weapon (shooting)
                if IsWeaponValid(causeOfDeath) then
                    TriggerServerEvent('100k_or_die_killfeed:playerKilled', PlayerId())
                    Citizen.Wait(5000)  -- Prevent spam
                end
            end
        end
    end
end)
