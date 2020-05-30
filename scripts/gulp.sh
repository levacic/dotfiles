# Gulp Bash auto-completion.
if command -v gulp > /dev/null 2>&1; then
    if [[ "$BASH_VERSION" ]]; then
        eval "$(command gulp --completion=bash)"
    elif [[ "$ZSH_VERSION" ]]; then
        eval "$(command gulp --completion=zsh)"
    fi
fi

# Run locally-installed gulp if available, otherwise try the globally installed
# version.
gulp() {
    if [[ -e "./node_modules/.bin/gulp" ]]; then
        ./node_modules/.bin/gulp "$@"
    else
        command gulp "$@"
    fi
}
