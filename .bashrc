# Configure dotfiles path.
export DOTFILES="${HOME}/dotfiles"

# Build up our Bash configuration from individual modules
for f in ~/.bash-customizations/*; do source "${f}"; done
