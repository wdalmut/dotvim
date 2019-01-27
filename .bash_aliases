# ~/.wdm executed by bash

stty -ixon

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

alias ufficio='xrandr --output eDP-1 --off --output DP-1 --auto --panning 3840x2160 --fb 3840x2160 --scale 2x2'
alias laptop='xrandr --output DP-1 --off --output eDP-1 --auto'

alias l='ls -l'
alias ll='ls -las'

alias mynet='nmtui'

PATH=${PATH}:~/bin:~/node/bin:~/go/bin:~/jdk/bin

source /usr/share/git/completion/git-prompt.sh
source <(kubectl completion bash)

xset -b

