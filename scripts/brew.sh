# Set up Homebrew environment configuration and paths.
export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"

# Homebrew suggest also configuring `PATH`, `MANPATH`, and `INFOPATH`, but it
# makes more sense to handle those in this project's `basepath.sh`, where all
# the path configurations are centralized.
