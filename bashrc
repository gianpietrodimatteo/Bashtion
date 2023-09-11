#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# Commands ignored from the history
HISTIGNORE="pwd:ls:cd:exit:history:clear"

# Append to the history file, don't overwrite it
shopt -s histappend

# History length and file size
HISTSIZE=10000
HISTFILESIZE=20000

# Correct directory name and typos
shopt -s cdspell
shopt -s dirspell direxpand

# Disable XON XOFF (stop ctrl s from freezing terminal)
stty -ixon

# Prompt settings
PS1='\[\e[1;32m\]\u@\h\[\e[m\]:\[\e[1;34m\]\w\[\e[m\] $ '

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# Enable color for ls and grep
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Sources
[ -s ~/.bash_aliases ] && . ~/.bash_aliases
[ -s ~/.bash_functions ] && . ~/.bash_functions
[ -s ~/.bash_variables ] && . ~/.bash_variables

# Set up Node Version Manager (installed from AUR)
source /usr/share/nvm/init-nvm.sh

# Set up Node Version Manager (installed from git)
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
