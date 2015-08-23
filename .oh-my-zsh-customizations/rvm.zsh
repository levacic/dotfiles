# Load RVM into a shell session *as a function*
if [[ -s "${HOME}/.rvm/scripts/rvm" ]] ; then
    source "${HOME}/.rvm/scripts/rvm"
fi

# Run them Rubies
if [[ -e "${HOME}/.rvm/rubies/ruby-1.9.3-p484" ]]; then
    PATH="${PATH}:${HOME}/.rvm/gems/ruby-1.9.3-p484/bin"
    PATH="${PATH}:${HOME}/.rvm/gems/ruby-1.9.3-p484@global/bin"
    PATH="${PATH}:${HOME}/.rvm/rubies/ruby-1.9.3-p484/bin"
elif [[ -e "${HOME}/.rvm/rubies/ruby-2.2.2" ]]; then
    PATH="${PATH}:${HOME}/.rvm/gems/ruby-2.2.2/bin"
    PATH="${PATH}:${HOME}/.rvm/gems/ruby-2.2.2@global/bin"
    PATH="${PATH}:${HOME}/.rvm/rubies/ruby-2.2.2/bin"
fi

# Add RVM to PATH for scripting
PATH="${PATH}:${HOME}/.rvm/bin"

export PATH
