# Gulp ZSH auto-completion
eval "$(gulp --completion=zsh)"

# Run locally-installed gulp if available, otherwise try the globally installed
# version.
gulp() {
    if [[ -e "./node_modules/.bin/gulp" ]]; then
        ./node_modules/.bin/gulp "$@"
    else
        command gulp "$@"
    fi
}
