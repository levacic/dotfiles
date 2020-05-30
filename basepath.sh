# This is a default path configuration which should be loaded before all the
# other scripts, to make sure they have access to everything they might need.
PATH=""

# Default path configuration - system programs should always be first for
# security purposes. This could all be a one-liner, in fact the whole file
# could, but it's more readable and maintainable this way.
PATH="${PATH}:/usr/local/sbin"
PATH="${PATH}:/usr/local/bin"
PATH="${PATH}:/usr/sbin"
PATH="${PATH}:/usr/bin"
PATH="${PATH}:/sbin"
PATH="${PATH}:/bin"
PATH="${PATH}:/usr/local/games"
PATH="${PATH}:/usr/games"

# Dotfiles-bundled programs.
PATH="${PATH}:${DOTFILES}/bin"

# User-installed programs.
PATH="${PATH}:${HOME}/bin"
PATH="${PATH}:${HOME}/.local/bin"

# Composer-installed programs.
PATH="${PATH}:${HOME}/.composer/vendor/bin"

# Yarn-installed programs.
PATH="${PATH}:${HOME}/.yarn/bin"

# npm-installed programs.
PATH="${PATH}:${HOME}/.npm/bin"

# Heroku Toolbelt programs.
PATH="${PATH}:/usr/local/heroku/bin"

# Cabal-installed programs.
PATH="${PATH}:${HOME}/.cabal/bin"

# Go path configuration and programs.
GOPATH="${HOME}/.go"
PATH="${PATH}:${GOPATH}/bin"

export GOPATH
export PATH
