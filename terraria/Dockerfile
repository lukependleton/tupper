# A docker image to build a container that runs the terraria server

# For now, we will use ubuntu
# This needs to be arm 32-bit compatible image as that is what the pi runs
FROM arm32v7/ubuntu:latest

# Run in the 
WORKDIR /home/terrariaServer

# Download terraria
ARG terrariaDownloadLink=https://terraria.org/system/dedicated_servers/archives/000/000/042/original/terraria-server-1412.zip
RUN wget ${terrariaDownloadLink}

# Unzip files
RUN unzip terraria-server*

# Install mono for running the server on non x86 platformsv (like arm)
ADD installMonoUbuntu.sh .
RUN ./installMonoUbuntu.sh

# Todo: Mount world folder and Copy over server config file

# Run the server using mono
CMD mono --server --gc=sgen -O=all .1402/Linux/TerrariaServer.exe
