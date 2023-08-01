#
# ~/.profile
#

if [ -n "$BASH" ]; then
  [[ -f ~/.bashrc ]] && . ~/.bashrc
  [[ -f ~/.bash_variables ]] && . ~/.bash_variables
fi

[[ -d ~/bin ]] && PATH=$PATH:$HOME/bin

