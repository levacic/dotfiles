# Configure dotfiles path.
if [[ ! -v DOTFILES ]]; then
    export DOTFILES="${HOME}/dotfiles"
fi

# Import base path configuration before anything else.
if [[ -e "${DOTFILES}/basepath.sh" ]]; then
    source "${DOTFILES}/basepath.sh"
fi
