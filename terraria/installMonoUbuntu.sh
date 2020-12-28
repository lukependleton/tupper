#!/bin/sh

# * Install mono on ubuntu according to: https://linuxize.com/post/how-to-install-mono-on-ubuntu-20-04/
# The offical resource for installing as well...
#   for ubuntu:         https://www.mono-project.com/download/stable/#download-lin-ubuntu
#   and for raspbian:   https://www.mono-project.com/download/stable/#download-lin-raspbian


# Install dependencies to add a repo over https for some extra security
sudo apt update
sudo apt install -y dirmngr gnupg apt-transport-https ca-certificates software-properties-common
# Uninstalled software-properties-common on raspberrypi to undo

# Import the repo's GPG key
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

# Add the Mono repository to your system sources' list:
sudo apt-add-repository 'deb https://download.mono-project.com/repo/ubuntu stable-focal main'

# Install Mono:
sudo apt install -y mono-complete 

# Optional verify that is has been installed with:
# mono --version

