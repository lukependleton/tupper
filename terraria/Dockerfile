# A docker image to build a container that runs the terraria server on the raspberry pi

# For now, we will use ubuntu as that's convenient - might look for smaller distros if size becomes an issue
# This needs to be arm 32-bit compatible image as that is what the pi runs
FROM arm32v7/ubuntu:latest

# Run in the terrariaServerFolder - look for best practice location to run in later
WORKDIR /home/terrariaServer

# Download terraria
ARG terrariaDownloadLink=https://terraria.org/system/dedicated_servers/archives/000/000/042/original/terraria-server-1412.zip
RUN wget ${terrariaDownloadLink}

# Unzip files
RUN unzip terraria-server*

# Change Workdir to the ./{version}/Linux folder
ARG terrariaVersionFolder=1412
WORKDIR /home/terrariaServer/${terrariaVersionFolder}/Linux

# Install mono for running the server on non x86 platforms (like 32-bit arm)
ADD installMonoUbuntu.sh .
RUN ./installMonoUbuntu.sh

# Todo: Mount world folder - mount vs volume?
# Todo: Copy over server config file

# Run the server using mono
CMD mono --server --gc=sgen -O=all .TerrariaServer.exe
# -config serverconfig.txt
