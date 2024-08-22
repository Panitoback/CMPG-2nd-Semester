import discord
from discord.ext import commands
from dotenv import load_dotenv
import os

load_dotenv()
TOKEN = os.getenv("TOKEN")
GUILD =os.getenv("GUILD")  # Convert GUILD to integer
CHANNEL_NAME = 'general'  # Cambia al nombre de tu canal

intents = discord.Intents.all()
intents.messages = True
intents.members = True

bot = commands.Bot(command_prefix='!', intents=intents)

members_str = ""
members_list = []

@bot.command()
async def info(ctx):
    await ctx.send('¡Developed by Esteban!')

@bot.event
async def on_message(message):
    if message.author == bot.user:
        return
    
    if 'hola' in message.content.lower():
        await message.channel.send(f'¡Hello {message.author.name}!')
        
    await bot.process_commands(message)

@bot.event 
async def on_ready():
    global members_str, members_list
    guild = bot.guilds[0]  # Because we are only connected to one Guild, we can get the first guild in the "guilds" list
    channel = discord.utils.get(guild.text_channels, name=CHANNEL_NAME)
    
    members_list = [member.id for member in guild.members]  # Initialize members_list with member IDs
    members_str = "   -   ".join([member.name for member in guild.members])
    
    await channel.send(f"{bot.user} is online on {guild.name}!")
    print(members_list)
    lenght = len(members_list)
    print(f"Number of members: {lenght}")
    await channel.send("Current members are: \n" + members_str)

@bot.event
async def on_member_join(member):
    global members_str, members_list
    guild = member.guild
    channel = discord.utils.get(guild.text_channels, name=CHANNEL_NAME)
    
    if channel is None:
        print(f"Channel '{CHANNEL_NAME}' not found.")
        return
    
    if guild.id == GUILD:
        if member.id not in members_list:
            members_list.append(member.id)
            members_str = "   -   ".join([member.name for member in guild.members])
            
            # Print debug information
            print(f"{member.name} joined the guild.")
            
            if channel:
                await channel.send(f"Welcome {member.name} to the server!")
                await channel.send(f"Updated members list:\n - {members_str}")

@bot.event
async def on_member_remove(member):
    global members_str, members_list
    guild = member.guild
    channel = discord.utils.get(guild.text_channels, name=CHANNEL_NAME)
    
    if channel is None:
        print(f"Channel '{CHANNEL_NAME}' not found.")
        return
    
    if guild.id == GUILD:
        if member.id in members_list:
            members_list.remove(member.id)
            members_str = "   -   ".join([member.name for member in guild.members])
            
            # Print debug information
            print(f"{member.name} left the guild.")
            
            if channel:
                await channel.send(f"{member.name} has left the server.")
                await channel.send(f"Updated members list:\n - {members_str}")

bot.run(TOKEN)



    
'''
@bot.event
async def on_member_join(member):
    with open('members.csv', mode='a', newline='') as file:
        writer = csv.writer(file)
        join_date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        writer.writerow([member.name, join_date])
    print(f'{member.name} has joined the server.')
    
@bot.command()
async def probando(ctx):
    await ctx.send("Comando prueba, miembros: " + members)
    
                
@bot.event
async def on_member_join(member):
    guild = discord.utils.get(bot.guilds, name=GUILD)

    # Send a channel message
    general = discord.utils.get(guild.channels, name="general")
    await general.send(f"Hello {member.name}, welcome to {guild.name}!")

    # Send a DM
    await member.create_dm() # Create the DM room
    await member.dm_channel.send( # Send a DM
        f"Hello {member.name}, welcome to {guild.name}!"
    )
    
    '''
