# Orion BanSync

A lightweight FiveM script that synchronizes Discord server bans with your FiveM server, preventing banned Discord users from joining your game server.

## ✨ Features

- **Discord Ban Sync** - Automatically blocks players banned from your Discord server
- **Lightweight** - No database required, uses Discord's API directly
- **Easy Configuration** - Simple setup with `Orion.Config` structure
- **Detailed Logging** - Console and file logging for monitoring and debugging
- **Optional Discord Requirement** - Choose whether Discord is required to join your server

## 📋 Requirements

- [FiveM](https://fivem.net/) server
- A Discord bot with the `BAN_MEMBERS` permission
- Basic understanding of FiveM server management

## 🚀 Installation

1. Download the latest release
2. Place the `orion-bansync` folder in your `resources` directory
3. Add `ensure orion-bansync` to your server.cfg
4. Configure the script by editing `config.lua`
5. Restart your server

## ⚙️ Configuration

Edit `config.lua` to set up the script:

```lua
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
```

## 🔧 Setting Up Discord Bot

1. Create a new bot in the [Discord Developer Portal](https://discord.com/developers/applications)
2. Add the bot to your server with the following permissions:
   - `View Channels`
   - `Ban Members` (to check bans)
3. Copy the bot token and your server ID to the config file

## 🛠️ Features in Detail

- **Automatic Ban Check**: Checks if a player is banned from your Discord server when they try to join
- **Flexible Configuration**: Choose whether Discord is required or optional
- **Detailed Logging**: Tracks all ban checks and errors
- **Lightweight**: No database required, minimal server impact

## 📜 Permissions

The bot needs the following permissions in your Discord server:
- `View Channels`
- `Ban Members`

## 🤝 Support

For support, please open an issue on the GitHub repository.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
