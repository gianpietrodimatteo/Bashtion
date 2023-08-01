#!/bin/bash

# Bashtion installation script

install() {
  # Create directories
  mkdir -vp ~/bin

  # Create symlinks
  ln -sv "$(pwd)/bashrc" ~/.bashrc
  ln -sv "$(pwd)/inputrc" ~/.inputrc
  ln -sv "$(pwd)/bash_aliases" ~/.bash_aliases
  ln -sv "$(pwd)/bash_functions" ~/.bash_functions
  ln -sv "$(pwd)/bash_completion" ~/.bash_completion
  ln -sv "$(pwd)/bash_profile" ~/.bash_profile
  ln -sv "$(pwd)/bin/conf" ~/bin

  # Source files
  . ~/.bashrc ~/.bash_profile
}

clean() {
  # Remove current configurations
  rm -vf ~/.bashrc ~/.bash_aliases ~/.bash_functions ~/.bash_completion ~/.bash_profile ~/.inputrc ~/bin/conf
}

prompt() {
  read -p "This will delete ~/.bashrc ~/.bash_aliases ~/.bash_functions ~/.bash_completion ~/.bash_profile ~/.inputrc ~/bin/conf. Proceed? [y]" -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]] 
  then
    clean
    install
    echo "Set up variables (such as $EDITOR) on ~/.bash_variables. Make sure to install bash-completion package."
    exit 1
  else
    echo "Aborted by user."
  fi
}

prompt
