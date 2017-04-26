#!/bin/bash
#  y_axis : top  center bottom
#  x_axis : left center right
set -e

alignText_x () {
  case $1 in
  'bottom')
    x="$[$(tput lines)-2]"
    ;;
  'center')
    x="$[$(tput lines)/2]"
    ;;
  *) #  default is top
    x="0"
    ;;
  esac
}
alignText_y () {
  case $2 in
  'right')
    y="$[$(tput cols)-${#1}]"
    ;;
  'center')
    y="$[$(tput cols)/2-${#1}/2]"
    ;;
  *) #  default is left
    y="0"
    ;;
  esac
}
alignText () {
  alignText_x $2
  alignText_y $1 $3

  tput cup $x $y
  echo "$1"
  tput rmcup
}

message=${1:-'DEMO'}
y_axis=${2:-'top'}
x_axis=${3:-'left'}

alignText $message $y_axis $x_axis
