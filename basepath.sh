# The below functions were taken from a Stack Exchange answer, and with
# inspiration from some other sources, adapted to work on arbitrary variables.
#
# @see https://unix.stackexchange.com/a/480523
# @see https://linuxfromscratch.ru/blfs/view/svn/postlfs/profile.html
# @see https://misterpinchy.wordpress.com/2012/10/16/indirect-variable-references-in-bash-and-zsh/

# string +variable.value(str variable)
#
# Print the value of the variable whose name is passed to this function.
# Basically a more portable way of resolving indirect references.
#
# Works in Bash and Zsh.
+variable.value() {
    # Extract the variable from the function argument.
    local variable="${1}"

    # If the variable doesn't exist, just return immediately.
    if [[ ! -v ${variable} ]]; then
        return 0;
    fi

    # Expand the variable based on whether the current shell is Bash or Zsh.
    if [[ "$BASH_VERSION" ]]; then
        echo "${!variable}"
    elif [[ "$ZSH_VERSION" ]]; then
        echo "${(P)pathvariable}"
    fi
}

# void +path.append(str pathvariable, str dirname, ...)
#
# Append each passed existing directory to the current user's $$pathvariable in
# a safe manner silently ignoring:
#
# * Relative directories (*NOT* prefixed by the directory separator).
# * Duplicate directories (already listed in the current ${!pathvariable}).
# * Non-existent directories.
+path.append() {
    # Extract the path variable into which we're injecting the other paths.
    local pathvariable="${1}"

    # If the variable exists in the environment, start building the new value
    # with its current value, otherwise start with an empty string.
    if [[ -v ${pathvariable} ]]; then
        local currentpath="$(+variable.value ${pathvariable})"
    else
        local currentpath=""
    fi;

    # Shift the path variable from the argument list, leaving only the paths
    # which need to be appended.
    shift

    # For each passed dirname:
    local dirname
    for dirname in "${@}"; do
        # Strip the trailing directory separator if any from this dirname,
        # reducing this dirname to the canonical form expected by the
        # test for uniqueness performed below.
        dirname="${dirname%/}"

        # If this dirname is either relative, duplicate, or non-existent, then
        # silently ignore this dirname and continue to the next. Note that the
        # existency test is the least performant test and hence deferred.
        [[ "${dirname:0:1}" == '/' &&
           ":${currentpath}:" != *":${dirname}:"* &&
           -d "${dirname}" ]] || continue

        # Else, this is an existing absolute unique dirname. In this case,
        # append this dirname to the current ${PATH}.
        currentpath="${currentpath}:${dirname}"
    done

    # Strip an erroneously leading delimiter from the final value, if any, a
    # common edge case when the initial value is the empty string, and export
    # the new variable to subprocesses.
    export $pathvariable="${currentpath#:}"
}

# void +path.prepend(str pathvariable, str dirname, ...)
#
# Prepend each passed existing directory to the current user's ${!pathvariable}
# in a safe manner silently ignoring:
#
# * Relative directories (*NOT* prefixed by the directory separator).
# * Duplicate directories (already listed in the current ${!pathvariable}).
# * Non-existent directories.
+path.prepend() {
    # Extract the path variable into which we're injecting the other paths.
    local pathvariable="${1}"

    # If the variable exists in the environment, start building the new value
    # with its current value, otherwise start with an empty string.
    if [[ -v ${pathvariable} ]]; then
        local currentpath="$(+variable.value ${pathvariable})"
    else
        local currentpath=""
    fi;

    # Shift the path variable from the argument list, leaving only the paths
    # which need to be appended.
    shift

    # For each passed dirname:
    local dirname
    for dirname in "${@}"; do
        # Strip the trailing directory separator if any from this dirname,
        # reducing this dirname to the canonical form expected by the
        # test for uniqueness performed below.
        dirname="${dirname%/}"

        # If this dirname is either relative, duplicate, or non-existent, then
        # silently ignore this dirname and continue to the next. Note that the
        # existency test is the least performant test and hence deferred.
        [[ "${dirname:0:1}" == '/' &&
           ":${currentpath}:" != *":${dirname}:"* &&
           -d "${dirname}" ]] || continue

        # Else, this is an existing absolute unique dirname. In this case,
        # append this dirname to the current ${PATH}.
        currentpath="${dirname}:${currentpath}"
    done

    # Strip an erroneously trailing delimiter from the final value, if any, a
    # common edge case when the initial value is the empty string, and export
    # the new variable to subprocesses.
    export $pathvariable="${currentpath%:}"
}

# This is a default path configuration which should be loaded before all the
# other scripts, to make sure they have access to everything they might need.
PATH=""
GOPATH=""

# Default path configuration - system programs should always be first for
# security purposes. This could all be a one-liner, in fact the whole file
# could, but it's more readable and maintainable this way.
+path.append "PATH" "/usr/local/sbin"
+path.append "PATH" "/usr/local/bin"
+path.append "PATH" "/usr/sbin"
+path.append "PATH" "/usr/bin"
+path.append "PATH" "/sbin"
+path.append "PATH" "/bin"
+path.append "PATH" "/usr/local/games"
+path.append "PATH" "/usr/games"

# Dotfiles-bundled programs.
+path.append "PATH" "${DOTFILES}/bin"

# User-installed programs.
+path.append "PATH" "${HOME}/bin"
+path.append "PATH" "${HOME}/.local/bin"

# Composer-installed programs.
+path.append "PATH" "${HOME}/.composer/vendor/bin"

# Yarn-installed programs.
+path.append "PATH" "${HOME}/.yarn/bin"

# npm-installed programs.
+path.append "PATH" "${HOME}/.npm/bin"

# Heroku Toolbelt programs.
+path.append "PATH" "/usr/local/heroku/bin"

# Cabal-installed programs.
+path.append "PATH" "${HOME}/.cabal/bin"

# Go path configuration and programs.
+path.append "GOPATH" "${HOME}/.go"
+path.append "PATH" "${GOPATH}/bin"

export GOPATH
export PATH
