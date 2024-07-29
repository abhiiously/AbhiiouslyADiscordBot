# Use an official Node.js runtime as a parent image
FROM node:18

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json (if available)
COPY package.json /app
COPY package-lock.json /app

# Install Node.js dependencies defined in package.json
RUN npm install

# Copy the rest of your bot's source code into the container
COPY . .

# The container starts with the Node.js application
# Optional: Set default command, for example, to start your Node.js application
CMD ["node", "index.js"]