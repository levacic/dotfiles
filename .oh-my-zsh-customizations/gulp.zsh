if type "gulp" > /dev/null 2>&1; then
    # Gulp ZSH auto-completion
    eval "$(gulp --completion=zsh)"
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
