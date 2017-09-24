# ~/.wdm executed by bash

export EDITOR=vim

source ~/.bash-git-prompt/gitprompt.sh
GIT_PROMPT_ONLY_IN_REPO=1

alias fuck='sudo $(history -p \!\!)'

alias open="xdg-open"

alias password="read -r -s ______a && echo \$______a"
alias crypt="openssl rsautl -encrypt -inkey ~/.ssh/id_rsa | base64"
alias decrypt="base64 -d |  openssl rsautl -decrypt -inkey ~/.ssh/id_rsa"

alias xcp="xclip -i -selection clipboard"

alias academy='export PS1=export PS1="\033[1;34mcmd: \033[0m"'
