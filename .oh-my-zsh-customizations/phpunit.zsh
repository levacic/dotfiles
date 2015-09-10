# Run locally-installed PHPUnit if available, otherwise try the globally
# installed version.
phpunit() {
    if [[ -e "./vendor/bin/phpunit" ]]; then
        php ./vendor/bin/phpunit "$@"
    else
        command phpunit "$@"
    fi
}
