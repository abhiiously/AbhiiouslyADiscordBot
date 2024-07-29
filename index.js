// Made by Abhishek Bhatia
// Works on any platform with Node.js installed
// This script creates a basic Discord bot named Abhiiously.io that responds to the command "!hello"

// Import the discord.js module
const { Client, GatewayIntentBits } = require('discord.js');
require('dotenv').config(); // Load environment variables from .env file

// Create a new Discord client
const client = new Client({ intents: [GatewayIntentBits.Guilds, GatewayIntentBits.GuildMessages, GatewayIntentBits.MessageContent] });

// When the client is ready, run this code (only once)
client.once('ready', () => {
    console.log('Abhiiously.io is ready!');
});

// Listen for messages and respond to "!hello"
client.on('messageCreate', message => {
    if (message.content === '!hello') {
        message.channel.send('Hello, World!');
    }
});

// Log in to Discord with your app's token
client.login(process.env.DISCORD_TOKEN);