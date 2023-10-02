#
# ~/.bash_aliases
#

# Basic
alias mkdirp="mkdir -p"

alias ll="ls -l"
alias la="ls -lathr"
alias lc="ls -CF"
alias lr="ls -1lhtrp | grep -v /"
# FInd only dotfiles of current dir
alias lh="ls -d .*"

alias cb="cd -"
alias cu="cd .."

alias cpr="cp -r"

alias rmi="rm -i"
alias rmr="rm -rf"

alias finda="find . -name"
alias findi="find . -iname"
# Find symlinks on current directory. Add -ls to see where they link to
alias findl="find . -maxdepth 1 -type l"

alias hgrep="history | grep"

alias grepr="grep -r"

# TODO Ack

# Git
alias gita="git a"
alias gits="git s"
alias gitcm="git cm"
alias gitEmail="git config user.email $EMAIL"

# Git Workspace
alias ws="~/Workspace/git-workspace.sh"

# Pacman
alias pacs="pacman -Ss"
alias pacy="sudo pacman -Sy"
alias pacu="sudo pacman -Syu"

# Tmux
alias tml="tmux list-sessions"
alias tma="tmux attach-session -t"
alias tm0='tmux attach-session -t $(echo `tmux list-sessions` | cut -d ":" -f 1)'
alias tmns="tmux new -s"

# System
alias e="exit"
alias allow="chmod u+x"
alias alle="chmod +x"
alias allall="chmod a+x"
alias sysver="uname -a; lsb_release -a; hostnamectl;"

# Util
alias curly="curl -sSL"
alias tailf="tail -F"
alias trash='mv -t $HOME/.local/share/Trash/files/'
alias lessh="less -m -N -g -i -J --line-numbers --underline-special"
alias ssh_rsa_email="ssh-keygen -t rsa -b 4096 -C"
alias dates="date +%F-%T"
alias smartree="tree -I 'node_modules|dist'"
alias wclass="xprop | grep WM_CLASS"
alias ga="ffmpeg -r 10 -i"
alias liquidate="date +\"%Y%m%d%H%M%S\""
alias cooldate="date +\"%Y/%m/%d:%H:%M:%S\""
alias namedate="date +\"%Y-%m-%d-%H-%M-%S\""

alias notebook='cd $NOTESPATH && vim -c CtrlP -c "silent ToggleAutosave"'

# Package/Unpackage
alias targz="tar zxvf"
alias tarbz2="tar -xvjf"
alias tarxz="tar -Jxxvf"
alias unrar="unrar x"
alias 7zip="7z e"
alias uniso="7z e"

# Misc
alias rm_empty_lines="sed -r '/^\s*$/d'"
alias moveToImageLibrary="mv *.mp4 *.jpg *.webm *.gif *.png ~/Pictures/Image\ Library/"
alias colortest='for x in {0..8}; do for i in {30..37}; do for a in {40..47}; do echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "; done; echo; done; done; echo ""'

# Docker aliases
# alias dockerl="docker container ls -a"
# alias dockeri="docker image ls -a"
# alias dockerb="docker exec -it $1 bash"
# alias docker0="docker exec -it $(echo `docker container ls -a` | cut -d " " -f 9) bash"


