Orion = {}
Orion.Config = {}

Orion.Config.Debug = false

Orion.Config.Discord = {
    enabled = true,
    guildId = 'YOUR_DISCORD_GUILD_ID',
    botToken = 'YOUR_DISCORD_BOT_TOKEN',
    required = true
}

Orion.Config.Logging = {
    enabled = true,
    logToFile = true,
    logToConsole = true,
    logFile = 'orion_bansync.log',
    logLevel = 'info'
}

Orion.Config.Advanced = {
    checkForUpdates = true,
    updateCheckInterval = 24
}

return Orion.Config