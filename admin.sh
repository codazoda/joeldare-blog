#!/bin/bash

COLS=$(tput cols)

clear

echo $COLS wide

echo ---[ Blog Admin ]---
echo
echo [S] Start Server
echo [B] Open Browser
echo [G] Generate Site
echo [Q] Quit
echo [P] Pull on Server
echo
printf "> "

read -n 1 CHAR # Read a single character and be silent

echo
echo

case $CHAR in
  s)
    hugo serve &
    ;;
  b)
    ;;
  g)
    hugo
    ;;
  p)
    echo Connecting to joeldare.com.
    ssh root@joeldare.com "cd /var/www/joeldare-blog;git pull"
    ;;
  q)
    echo Then why even start?
    echo
    ;;
esac

# hugo serve
# open http://localhost:1313/blog/
