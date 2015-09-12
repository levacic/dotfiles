# Run locally-installed bower if available, otherwise try the globally installed
# version.
bower() {
    if [[ -e "./node_modules/.bin/bower" ]]; then
        ./node_modules/.bin/bower "$@"
    else
        command bower "$@"
    fi
}
