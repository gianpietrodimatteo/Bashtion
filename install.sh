#!/bin/bash

# Bashtion installation script

install() {
  # Create symlinks
  ln -sv "$(pwd)/bashrc" ~/.bashrc
  ln -sv "$(pwd)/inputrc" ~/.inputrc
  ln -sv "$(pwd)/bash_aliases" ~/.bash_aliases
  ln -sv "$(pwd)/bash_functions" ~/.bash_functions
  ln -sv "$(pwd)/bash_completion" ~/.bash_completion
  ln -sv "$(pwd)/bin/conf" ~/bin

  # Source file
  . ~/.bashrc
}

clean() {
  # Remove bash folder
  rm -rf ~/.bash
  # Remove current configurations
  rm -f ~/.bash* ~/.inputrc ~/bin/conf
  # Create directory
  mkdir -vp ~/.bash
}

prompt() {
  read -p "This will delete the .bash filder, all your ~/.bash* files and your ~/.inputrc. Proceed? [y]" -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]] 
  then
    clean
    install
    echo "Set up DOWNLOADS WORKSPACE NOTESPATH AND EDITOR variables on ~/.bash/secret.sh"
    exit 1
  else
    echo "Aborted by user."
  fi
}

prompt
