#!/bin/bash

# Function to update from GitHub
update_from_github() {
    echo "Checking for updates..."
    if [ -d ".git" ]; then
        git fetch
        git reset --hard origin/main  # or your default branch name
        git clean -fd
    else
        git clone https://github.com/abhiiously/AbhiiouslyADiscordBot.git .
    fi
    npm install
    echo "Update completed."
}

# Always update from GitHub when container starts
update_from_github

# Run the bot
node index.js