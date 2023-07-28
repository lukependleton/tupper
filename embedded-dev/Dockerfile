FROM dev-environment-base

# Install rust - rust already installed in the base dev container

# Install cargo-binutils
RUN rustup component add llvm-tools-preview
RUN cargo install --locked cargo-binutils --vers 0.3.3
# ? Should I run verify commands that don't add anything to the container but should fail the build if they don't work?

# Install cargo embed - instructions: https://docs.rust-embedded.org/discovery/microbit/03-setup/index.html#cargo-embed
USER root
RUN apt-get install -y pkg-config libusb-1.0-0-dev libftdi1-dev libudev-dev libssl-dev
USER lu
# Possibly needed to configure the default toolchain during the build specifically
RUN rustup default stable
RUN cargo install --locked cargo-embed --vers 0.18.0

# Install helpful suplemental tools for embdedded things - gdb for remote debugging and minicom for remote communication
USER root
RUN apt-get update && apt-get install -y gdb-multiarch minicom
USER lu

# * This rest of this section might be moved to the microbit-specific dockerfile

# # Configure udev rules for accessing usb devices without root
COPY ./99-microbit.rules /etc/udev/rules.d/
USER root
# ? Maybe also: apt-get install udev usbutils - for udevadm and lsusb respectively
RUN apt-get install -y udev usbutils
# # ? Might need to reload udev things after?
# TODO: check to see if this needs to be run
# RUN udevadm control --reload-rules
USER lu

# ? Microbit v2 specifically - should this be here?
RUN rustup target add thumbv7em-none-eabihf

# * When running...
# Mount the embedded rust repo

# minicom
# docker minicom port/serial/usb setup
