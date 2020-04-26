if [[ -e "${HOME}/bin/terraform" ]]; then
    complete -o nospace -C "${HOME}/bin/terraform" terraform
fi
