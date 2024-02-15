#!/bin/bash

# functions - summary of custom user functions
# usage: functions
functions() {
  grep -B 1 usage < "$HOME"/.bash_functions
}

findo() {
  find . -iname *$1*
}

vimo() {
  vim $(findo $1)
}

# mkcd - makedir and cd in it
# usage: mkcd <dir>
mkcd() {
  mkdir -p "$1" && cd "$1" || return ;
}

# cdl - cd and ls
# usage: cdl <dir>
cdl() {
  cd "$1" && ls -a;
}

# m2t - moves to notes path
# usage: m2t <target>
m2t() {
  mv -v "$1" "$NOTESPATH"
  ls "$NOTESPATH/$1"
}

# killport - kill process using port
# usage: killport <port>
killport() {
  sudo kill -9 "$(sudo fuser -n tcp "$1" 2> /dev/null)";
}

# keycode - view input keycode on the terminal
# usage: keycode
keycode() {
  echo "Ctrl+C on the terminal to stop. Move mouse to display."
  xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
}

# co - shortcuts for your configurations, check completion
# usage: co <configuration>
co() {
  conf "$@"
  source ~/.bashrc
}

# rmLn - remove destination and symlink source to it
# usage: rmLn <source> <destination>
rmLn() {
    rm -f "$2"
    ln -sv "$1" "$2"
}

# rmCp - remove destination and copy source to it
# usage: rmCp <source> <destination>
rmCp() {
    rm -f "$2"
    cp "$1" "$2"
}

# vimd - vim smart drafts
# usage: vimd
vimd() {
    local base_file="draft"
    local counter=0

    if [ -z "$DRAFTSPATH" ]
      then
        DRAFTSPATH="$HOME"
    fi

    cd "$DRAFTSPATH" || exit

    while [[ -e "${base_file}${counter}.txt" ]]; do
        ((counter++))
    done

    local new_file="${base_file}${counter}.txt"
    vim "$new_file" -c 'silent ToggleAutosave'
}

# confirm - add a confirmation to next command
# usage: confirm && <command>
confirm() {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure? [y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY])
            true
            ;;
        *)
            false
            ;;
    esac
}

# cleardrafts - clears all drafts on .vim/drafts
# usage: cleardrafts
cleardrafts() {
    confirm "$@" && rm "$HOME"/.vim/drafts/*
}

