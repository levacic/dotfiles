# Run locally-installed PHPCS if available, otherwise try the globally installed
# version.
phpcs() {
    if [[ -e "./vendor/bin/phpcs" ]]; then
        php ./vendor/bin/phpcs "$@"
    else
        command phpcs "$@"
    fi
}
