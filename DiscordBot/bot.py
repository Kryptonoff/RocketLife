import discord
from discord.ext import commands
from config import DISCORD_TOKEN

intents = discord.Intents.all()
bot = commands.Bot(command_prefix="!", intents=intents)
bot_instance = bot  # ← ДЛЯ ДОСТУПА ИЗ web.py
guild_cache = {}

@bot.event
async def on_ready():
    print(f"[READY] Logged in as {bot.user}")
    for guild in bot.guilds:
        guild_cache[guild.id] = guild
    print("[INFO] Guild cache loaded")

def get_guilds_and_channels():
    result = {}
    for guild in bot.guilds:
        channels = []
        for ch in guild.channels:
            if isinstance(ch, (discord.TextChannel, discord.Thread)):
                perms = ch.permissions_for(guild.me)
                if perms.send_messages:
                    channels.append({
                        "id": ch.id,
                        "name": f"{ch.name} ({ch.__class__.__name__})"
                    })
        result[guild.id] = {"name": guild.name, "channels": channels}
    return result

async def send_embed_message(channel_id, title, description, color):
    try:
        channel = bot.get_channel(int(channel_id))
        if not channel:
            channel = await bot.fetch_channel(int(channel_id))

        if not isinstance(channel, (discord.TextChannel, discord.Thread)):
            print(f"[ERROR] Invalid channel type: {type(channel)}")
            return False

        perms = channel.permissions_for(channel.guild.me)
        if not perms.send_messages:
            print(f"[ERROR] No send permission in channel {channel.name}")
            return False

        embed = discord.Embed(
            title=title or "Без заголовка",
            description=description or "Без описания",
            color=int(color.lstrip("#"), 16)
        )
        await channel.send(embed=embed)
        print(f"[SUCCESS] Sent to {channel.name}")
        return True
    except Exception as e:
        print(f"[EXCEPTION] {e}")
        return False

def run_bot():
    bot.run(DISCORD_TOKEN)
