# * Pull from node image
FROM node

# * Build arg for 
ARG GITHUB_TOKEN

# * Set starting working directory
WORKDIR /home/showdownServer

# * Clone showdown server repo
RUN git clone https://${GITHUB_TOKEN}@github.com/smogon/pokemon-showdown

# * Change to new dir
WORKDIR /home/showdownServer/pokemon-showdown

# * Set up default server config (copy local file)
COPY config.js config/

# * Install node dependencies
RUN npm install

# * Run server on startup
CMD node pokemon-showdown