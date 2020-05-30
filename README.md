# Dotfiles

## Installation

To install, clone this repo somewhere like `~/dotfiles`, with the `--recurse-submodules` option. After that, make the following symlinks (back them up by hand first if needed):

```sh
ln -s "${HOME}/dotfiles/.bash-customizations"
ln -s "${HOME}/dotfiles/.oh-my-zsh-customizations"
ln -s "${HOME}/dotfiles/.bash_logout"
ln -s "${HOME}/dotfiles/.bash_profile"
ln -s "${HOME}/dotfiles/.bashrc"
ln -s "${HOME}/dotfiles/.gitconfig"
ln -s "${HOME}/dotfiles/.hgrc"
ln -s "${HOME}/dotfiles/.zshrc"
ln -s "${HOME}/dotfiles/bin/force-google-chrome-dark-mode.sh" "${HOME}/bin/force-google-chrome-dark-mode"
```
