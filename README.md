# Dotfiles

## Installation

To install, clone this repo to `~/dotfiles`, with the `--recurse-submodules` option. This path is now hardcoded because why not.

Remove (or backup manually if needed) any default login scripts, especially `~/.profile` if it exists - we **do not want** this, as it gets executed for both Bash and Zsh login shells, whereas we want to isolate these to initialize differently.

After that, make the following symlinks for the base shell configuration:

```sh
ln -s "${HOME}/dotfiles/.bash_logout"
ln -s "${HOME}/dotfiles/.bash_profile"
ln -s "${HOME}/dotfiles/.bashrc"
ln -s "${HOME}/dotfiles/.zshrc"
```

For other configuration, make the following symlinks as well:

```sh
ln -s "${HOME}/dotfiles/.gitconfig"
ln -s "${HOME}/dotfiles/.hgrc"
ln -s "${HOME}/dotfiles/.toprc"
ln -s "${HOME}/dotfiles/.vimrc"
```


## Organization

All of the initialization scripts are located in the `shell` folder in the root of this repo, with the following naming conventions:

- `*.sh` files get sourced in both Bash and Zsh
- `*.bash` files get sourced only in Bash
- `*.zsh` files get sourced only in Zsh

The convention is arbitrary, and only somewhat aligned with existing file naming conventions - but it works well for this particular setup.

In general, scripts compatible with both Bash and Zsh are preferred for easier maintenance.
