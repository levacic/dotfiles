# Configure dotfiles path.
export DOTFILES="${HOME}/dotfiles"

# Import base path configuration before anything else.
if [[ -e "${DOTFILES}/basepath.sh" ]]; then
    source "${DOTFILES}/basepath.sh"
fi

# Build up our Bash configuration from individual modules.
for f in "${DOTFILES}/scripts/"*.{sh,bash}; do
    source "${f}"
done
