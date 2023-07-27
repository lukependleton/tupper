FROM ubuntu

# Install all the required packages - found here: https://github.com/aseprite/aseprite/blob/main/INSTALL.md#linux-dependencies
RUN apt-get update && apt-get install -y g++ clang libc++-dev libc++abi-dev cmake ninja-build libx11-dev libxcursor-dev libxi-dev libgl1-mesa-dev libfontconfig1-dev

# Create the user to run the container as
# RUN useradd -m bobthebuilder && adduser bobthebuilder sudo
RUN useradd -m bobthebuilder
USER bobthebuilder

# Change the working directory to the mounted aseprite source code
WORKDIR /home/bobthebuilder

# Bring over the build script
COPY build.sh .

# Entrypoint - build aseprite
ENTRYPOINT [ "bash", "build.sh" ]
