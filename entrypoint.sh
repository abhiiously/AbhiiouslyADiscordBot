#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status.

# Function to update from GitHub
update_from_github() {
    echo "Checking for updates..."
    if [ -d ".git" ]; then
        git fetch && git reset --hard origin/main && git clean -fd
    else
        git clone $GITHUB_REPO_URL .
    fi
    npm install || { echo 'npm install failed'; exit 1; }
    echo "Update completed."
}

# Trap signals for graceful shutdown
trap "echo 'Shutting down...'; exit" SIGINT SIGTERM

# Environment variable for GitHub repo URL
GITHUB_REPO_URL=${GITHUB_REPO_URL:-'https://github.com/abhiiously/AbhiiouslyADiscordBot.git'}

# Always update from GitHub when container starts
update_from_github

# Run the bot
node index.js
