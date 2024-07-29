# Use the official Node.js image
FROM node:18

# Set the working directory
WORKDIR /config

# Install git
RUN apt-get update && apt-get install -y git

# Copy the initialization script
COPY init-and-run.sh /init-and-run.sh

# Make the script executable
RUN chmod +x /init-and-run.sh

# Set the command to run the initialization script
CMD ["/init-and-run.sh"]