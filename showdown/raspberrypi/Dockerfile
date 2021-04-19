# A docker image to build a container that runs the pokemon showdown server on the raspberry pi

# For now, we will use ubuntu as that's convenient - might look for smaller distros if size becomes an issue
# This needs to be arm 32-bit compatible image as that is what the pi runs
FROM arm32v7/ubuntu:latest
# Maybe get docker container with node instead

# Run in the terrariaServerFolder - look for best practice location to run in later
WORKDIR /home/showdownServer

# * Install nodejs v12.x or later - won't be needed if we use a node container
# Add NodeSource repo
RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -

# Install with apt
RUN sudo apt install -y nodejs

# * Clone showdown server repo

# Change to new dir
WORKDIR /home/showdownServer/pokemon-showdown

# * Set up default server config (copy local file)

# * Run server on startup
CMD node pokemon-showdown
