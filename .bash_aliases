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
alias claer="clear"

alias academy='export PS1=export PS1="\033[1;34mcmd: \033[0m"'

alias ufficio='xrandr --output eDP1 --off --output DP1 --auto --panning 3840x2160 --fb 3840x2160 --scale 2x2'
alias laptop='xrandr --output DP1 --off --output eDP1 --auto'

alias l='ls -l'
alias ll='ls -las'

PATH=${PATH}:~/bin:~/node/bin:~/php/sapi/cli
