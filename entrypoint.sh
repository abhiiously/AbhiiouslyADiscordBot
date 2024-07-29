#!/bin/bash

# Function to update from GitHub
update_from_github() {
    echo "Checking for updates..."
    git fetch
    if [ "$(git rev-parse HEAD)" != "$(git rev-parse @{u})" ]; then
        echo "Updates found. Pulling changes..."
        git pull
        npm install
        echo "Update completed."
    else
        echo "Already up to date."
    fi
}

# Check if the repository exists
if [ ! -d "/app/.git" ]; then
    echo "Cloning repository for the first time..."
    git clone https://github.com/abhiiously/AbhiiouslyADiscordBot.git .
    npm install
else
    echo "Repository already exists. Checking for updates..."
    update_from_github
fi

# Run the bot
node index.js