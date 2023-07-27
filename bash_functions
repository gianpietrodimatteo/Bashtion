#!/bin/bash

# functions - summary of custom user functions
# usage: functions
functions() {
  grep -B 1 usage < "$HOME"/.bash_functions
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
