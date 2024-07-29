#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status.

# Function to update and check for missing files from GitHub
update_and_check_files() {
    echo "Checking for updates and missing files..."
    # Initialize a temporary git repository if it does not exist
    if [ ! -d ".git" ]; then
        git init
        git remote add origin $GITHUB_REPO_URL
    fi

    # Fetch latest changes from the repository
    git fetch origin main
    git reset --hard origin/main  # Reset to the latest commit on the main branch
    git clean -fd  # Remove any untracked files and directories

    # List of required files
    files=("index.js" "config.json" "package.json")

    # Check each required file and download if missing
    for file in "${files[@]}"; do
        if [ ! -f "$file" ]; then
            echo "$file is missing, downloading..."
            git checkout origin/main -- "$file"
        fi
    done

    # Install or update npm packages
    npm install
    echo "Update and file check completed."
}

# Environment variable for GitHub repo URL
GITHUB_REPO_URL=${GITHUB_REPO_URL:-'https://github.com/abhiiously/AbhiiouslyADiscordBot.git'}

# Always update from GitHub when container starts
update_and_check_files

# Run the bot
node index.js
