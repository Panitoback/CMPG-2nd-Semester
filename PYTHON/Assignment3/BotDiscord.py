import discord
from discord.ext import commands
from dotenv import load_dotenv
import os
import csv
from datetime import datetime

load_dotenv()
TOKEN = os.getenv("TOKEN") # Get token from .ENV file
GUILD = int(os.getenv("GUILD"))  # Convert GUILD to integer
CHANNEL_NAME = 'general'  # Change to your channel name
CSV_FILE = 'members_log.csv'  # Path to your CSV file

intents = discord.Intents.all()
intents.messages = True
intents.members = True

bot = commands.Bot(command_prefix='!', intents=intents)

# Creating global variables
members_str = ""
members_list = []

def initialize_csv():
    # Check if the CSV file exists, if not, create it and write the header
    if not os.path.isfile(CSV_FILE):
        with open(CSV_FILE, mode='w', newline='') as file:
            writer = csv.writer(file)
            writer.writerow(['Timestamp', 'Event', 'MemberID', 'MemberName'])

def log_event(event, member):
    # Append the datetime, event, member id and member name to the CSV file
    with open(CSV_FILE, mode='a', newline='') as file:
        writer = csv.writer(file)
        writer.writerow([datetime.now(), event, member.id, member.name])

@bot.command()
async def info(ctx):
    await ctx.send('¡Developed by Esteban!')

@bot.event
async def on_message(message):
    if message.author == bot.user:
        return
    
    if 'hello' in message.content.lower():
        await message.channel.send(f'¡Hello {message.author.name}!')
        
    await bot.process_commands(message)

@bot.event 
async def on_ready():
    global members_str, members_list
    guild = bot.guilds[0]  # Because we are only connected to one Guild, we can get the first guild in the "guilds" list
    channel = discord.utils.get(guild.text_channels, name=CHANNEL_NAME) # We get the channel from/to where bot will gather and send information
    
    members_list = [member.id for member in guild.members]  # Initialize members_list with member IDs
    members_str = "   -   ".join([member.name for member in guild.members]) # Compresed list to create a list of strings with member names
    
    await channel.send(f"{bot.user} is online on {guild.name}!") #For debugging purposes but basically it is sending the message directly to the discord channel
    print(members_list)
    lenght = len(members_list)
    print(f"Number of members: {lenght}")
    print(datetime.now())
    await channel.send("Current members are: \n" + members_str)

@bot.event
async def on_member_join(member):
    global members_str, members_list
    guild = member.guild
    channel = discord.utils.get(guild.text_channels, name=CHANNEL_NAME)
    
    if channel is None:
        print(f"Channel '{CHANNEL_NAME}' not found.") #For debugging
        return
    
    if guild.id == GUILD: 
        
        if member.id not in members_list:
            members_list.append(member.id)
            members_str = "   -   ".join([member.name for member in guild.members])
            
            # Print debug information
            print(f"{member.name} joined the guild.")
            
            log_event('JOIN', member)  # Log join event
            
            if channel:
                await channel.send(f"Welcome {member.name} to the server!") #Updating in live time in our channel
                await channel.send(f"Updated members list:\n - {members_str}")

@bot.event
async def on_member_remove(member):
    global members_str, members_list
    guild = member.guild
    channel = discord.utils.get(guild.text_channels, name=CHANNEL_NAME)
    
    if channel is None:
        print(f"Channel '{CHANNEL_NAME}' not found.") #For debuggin purposes
        return
    
    if guild.id == GUILD:  #We compare the current guild.id of the member with our GUILD token
        if member.id in members_list:
            members_list.remove(member.id)
            members_str = "   -   ".join([member.name for member in guild.members])
            
            # Print debug information
            print(f"{member.name} left the guild.")
            
            log_event('LEAVE', member)  # Log leave event
            
            if channel:
                await channel.send(f"{member.name} has left the server.") #Updating in live time in our channel
                await channel.send(f"Updated members list:\n - {members_str}")

initialize_csv()  # Ensure the CSV file is initialized
bot.run(TOKEN)
