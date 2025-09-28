
CreateThread(function()
    print('^2[Orion BanSync]^7 Discord ban sync initialized')
    
    if Orion.Config.Debug then
        print('^5[Orion BanSync]^7 Debug mode enabled')
    end
end)

local function GetPlayerDiscordId(source)
    for _, v in pairs(GetPlayerIdentifiers(source)) do
        if string.find(v, 'discord:') then
            return v:gsub('discord:', '')
        end
    end
    return nil
end

local function Log(message, level)
    level = level or 'info'
    local prefix = '^2[Orion BanSync]^7'
    if level == 'error' then
        prefix = '^1[Orion BanSync]^7'
    elseif level == 'warn' then
        prefix = '^3[Orion BanSync]^7'
    elseif level == 'debug' then
        if not Orion.Config.Debug then return end
        prefix = '^5[Orion BanSync]^7'
    end
    
    if Orion.Config.Logging.logToConsole then
        print(prefix .. ' ' .. message)
{{ ... }}
end

AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local src = source
    
    if not Orion.Config.Discord.enabled then return end

    local discordId = GetPlayerDiscordId(src)

    if not discordId and Orion.Config.Discord.required then
        deferrals.done('You must have Discord running and linked to FiveM to join this server.')
        return
    elseif not discordId then
        return
    end
    
    Log('Checking Discord ban status for ' .. name .. ' (Discord ID: ' .. discordId .. ')', 'debug')

    -- Use hardcoded Discord API URL
    local discordApiUrl = 'https://discord.com/api/v10'
    PerformHttpRequest(discordApiUrl .. '/guilds/' .. Orion.Config.Discord.guildId .. '/bans/' .. discordId, 
        function(errorCode, resultData, resultHeaders)
            if errorCode == 200 then
                local banData = json.decode(resultData)
                local reason = banData.reason or 'Banned from Discord'
                Log('Player ' .. name .. ' (Discord ID: ' .. discordId .. ') is banned in Discord. Reason: ' .. reason, 'info')
                deferrals.done('You are banned from this server. Reason: ' .. reason)
            elseif errorCode ~= 404 then
                local errorMsg = 'Error checking Discord ban: ' .. tostring(errorCode)
                Log(errorMsg, 'error')
                if Orion.Config.Discord.required then
                    deferrals.done('An error occurred while checking your ban status. Please try again later.')
                end
            else
                -- 404 - Not banned
                Log('Player ' .. name .. ' (Discord ID: ' .. discordId .. ') is not banned in Discord', 'debug')
            end
        end, 
        'GET', 
        '', 
        {['Content-Type'] = 'application/json', ['Authorization'] = 'Bot ' .. Orion.Config.Discord.botToken}
    )
end)
