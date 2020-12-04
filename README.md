# Dotfiles

## Installation

To install, clone this repo to `~/dotfiles`, with the `--recurse-submodules` option. This path is now hardcoded because why not.

If you really need to use a different path, then instead of symlinking `.profile`, `.bashrc`, and `.zshrc`, manually edit their contents to configure a different `DOTFILES` environment variable (with the value being the path to the cloned repo), and then source `${DOTFILES}/.profile`, `${DOTFILES}/.bashrc`, or `{$DOTFILES}/.zshrc` as necessary.

After that, make the following symlinks for the base shell configuration (if needed, manually back up the original files first):

```sh
ln -s "${HOME}/dotfiles/.bash_logout"
ln -s "${HOME}/dotfiles/.bash_profile"
ln -s "${HOME}/dotfiles/.bashrc"
ln -s "${HOME}/dotfiles/.profile"
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

All of the initialization scripts are located in the `scripts` folder in the root of this repo, with the following naming conventions:

- `*.sh` files get sourced in both Bash and Zsh
- `*.bash` files get sourced only in Bash
- `*.zsh` files get sourced only in Zsh

The convention is arbitrary, and only somewhat aligned with existing file naming conventions - but it works well for this particular setup.

In general, scripts compatible with both Bash and Zsh are preferred for easier maintenance.
