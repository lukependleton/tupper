# A base container for a development environment

We want to have some basic common things installed for any development environment that I might have.  Things like terminal set ups, common CLI tools, and other config things.

Then, for specific containerized development environments like say an embedded systems dev environment, we could add custom things on top of it for that specific environment.


### Bash/Zsh History...
I want this to persist its history, so I think we should mount/write to a history file outside (or symlinked to) the container's filesystem.
