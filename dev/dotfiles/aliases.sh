alias py="python"
alias dc="docker compose"
alias docker-compose="dc"
alias dcu="dc up"
alias dcd="dc down"
alias dcr="dc run --rm --service-ports"
alias dce="dc exec"
alias dcb="dc build"
alias nuke="docker system prune"
# alias sudo="sudo -A"
alias docker-compose="docker compose --compatibility $@"
alias bww="BITWARDENCLI_APPDATA_DIR=$BITWARDENCLI_APPDATA_DIR_WORK /usr/local/bin/bw $@"
alias bwp="BITWARDENCLI_APPDATA_DIR=$BITWARDENCLI_APPDATA_DIR_PERSONAL /usr/local/bin/bw $@"
