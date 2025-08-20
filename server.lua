-- Handle player kills
RegisterServerEvent('100k_or_die_killfeed:playerKilled')
AddEventHandler('100k_or_die_killfeed:playerKilled', function(victimId)
    local killerId = source
    local killerName = GetPlayerName(killerId) or 'Unknown'
    local victimName = GetPlayerName(victimId) or 'Unknown'

    -- Broadcast killfeed to all players
    TriggerClientEvent('100k_or_die_killfeed:showKillfeed', -1, killerName, victimName)
end)

-- Test killfeed command
RegisterCommand('testkillfeed', function(source)
    local killerName = GetPlayerName(source) or 'TestKiller'
    local victimName = 'TestVictim'
    TriggerClientEvent('100k_or_die_killfeed:showKillfeed', -1, killerName, victimName)
    TriggerClientEvent('chat:addMessage', source, {
        color = {0, 255, 0},
        multiline = true,
        args = {'100k or Die', 'Test killfeed triggered!'}
    })
end, false)
