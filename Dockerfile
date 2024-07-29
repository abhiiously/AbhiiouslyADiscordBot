# Use an official Node.js runtime as a parent image
FROM node:18

# Install git
RUN apt-get update && apt-get install -y git

# Set the working directory in the container
WORKDIR /app

# Clone the repository
RUN git clone https://github.com/abhiiously/AbhiiouslyADiscordBot.git .

# Install any needed packages specified in package.json
RUN npm install

# Run the bot when the container launches
CMD ["node", "./bot.js"]