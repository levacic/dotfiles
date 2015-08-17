# Load RVM into a shell session *as a function*
if [[ -s "${HOME}/.rvm/scripts/rvm" ]] ; then
    source "${HOME}/.rvm/scripts/rvm"
fi

# Run them Rubies
PATH="${PATH}:${HOME}/.rvm/gems/ruby-1.9.3-p484/bin"
PATH="${PATH}:${HOME}/.rvm/gems/ruby-1.9.3-p484@global/bin"
PATH="${PATH}:${HOME}/.rvm/rubies/ruby-1.9.3-p484/bin"

# Add RVM to PATH for scripting
PATH="${PATH}:${HOME}/.rvm/bin"

export PATH
