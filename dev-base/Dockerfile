# 
FROM ubuntu
ARG USERNAME=lu

# Install some initial packages - curl needed to get the rust install script, build-essential needed for cargo, and git because git
RUN apt-get update && apt-get install -y curl build-essential git

# Add my dev user
RUN useradd -m $USERNAME
RUN usermod -aG sudo $USERNAME
USER $USERNAME
WORKDIR /home/$USERNAME

# Install rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# This allows running cargo in the rest of the 
ENV PATH=/home/$USERNAME/.cargo/bin:${PATH}

# Install cargo binaries with cargo-binstall
RUN cargo install --locked cargo-binstall
RUN cargo binstall --locked -y bat ripgrep rtx-cli starship

# Enable starship - in the future I will import my own better bashrc probably, which would presumably already do this
RUN echo 'eval "$(starship init bash)"' >> .bashrc
# Copy my starship config toml
# TODO: copy it from a repo
COPY ./starship.toml /home/$USERNAME/.config/

# Install common things with rtx

# Install fzf & Configure fzf things: 
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
RUN echo 'export FZF_DEFAULT_OPTS=--border' >> /home/$USERNAME/.bashrc

# Configure git? Can I ssh/gpg pass my keys and stuff to docker container?
# Maybe vscode can do this too? It would be good to get the actual command vscode uses to start the container so I can have a reproducible one outside of it

# Should pass be used?

# Start with bash for now - maybe we can try zsh though...
CMD [ "/bin/bash" ]
