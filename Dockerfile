# Use the official Node.js image.
# https://hub.docker.com/_/node
FROM node:18

# Create and change to the app directory.
WORKDIR /config

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
# Copying this separately prevents re-running npm install on every code change.
COPY package*.json ./

# Install production dependencies.
RUN npm install

# Copy local code to the container image.
COPY . .

# Set the configuration directory as an environment variable
ENV CONFIG_DIR=/config

# Create a symlink from the working directory to the /config directory
RUN ln -s /usr/src/app $CONFIG_DIR

# Run the web service on container startup.
CMD [ "node", "index.js" ]
