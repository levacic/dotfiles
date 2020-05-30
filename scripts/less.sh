# Default less options.
export LESS="--quit-if-one-screen --RAW-CONTROL-CHARS --no-init"

# Make less more friendly for non-text input files, see lesspipe(1).
if command -v lesspipe > /dev/null 2>&1; then
    eval "$(lesspipe)"
fi
