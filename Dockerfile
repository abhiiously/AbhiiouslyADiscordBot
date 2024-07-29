# Use an official Node.js runtime as a parent image
FROM node:18

# Set the working directory in the container to /config
WORKDIR /config

# Install git in the container
RUN apt-get update && apt-get install -y git

# Copy the local code to the container's work directory
COPY . /config

# Optional: If you have dependencies listed in a package.json file, install them
RUN npm install

# Copy entrypoint script and give execution rights
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint script to run when the container starts
ENTRYPOINT ["/entrypoint.sh"]

# Optional: Set default command, for example, to start your Node.js application
CMD ["node", "index.js"]
