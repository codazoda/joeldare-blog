#!/bin/bash

COLS=$(tput cols)

clear

echo $COLS wide

echo ---[ Blog Admin ]---
echo
echo [S] Start Server
echo [B] Open Browser
echo [Q] Quit
echo [U] Upload to Server
echo
printf "> "

read -n 1 CHAR # Read a single character and be silent

echo
echo

case $CHAR in
  s)
    ;;
  b)
    ;;
  q)
    echo Then why even start?
    echo
    ;;
esac

# hugo serve
# open http://localhost:1313/blog/
