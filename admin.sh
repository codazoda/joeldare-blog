#!/bin/bash

COLS=$(tput cols)

clear

echo $COLS wide

echo ---[ Blog Admin ]---
echo
echo [S] Start Local Server
echo [T] Test in Browser
echo [G] Generate Site
echo [P] Pull on Server
echo [Q] Quit
echo [D] Deploy with Add and Commit
echo
printf "> "

read -n 1 CHAR # Read a single character and be silent

echo
echo

case $CHAR in
  s)
    hugo serve &
    ;;
  t)
    open http://localhost:1313/blog/
    ;;
  g)
    hugo
    git status
    ;;
  p)
    echo Connecting to joeldare.com.
    ssh root@joeldare.com "cd /var/www/joeldare-blog;git pull"
    ;;
  d)
    echo Adding, committing, and deploying to joeldare.com.
    hugo
    git add .
    git commit -m 'add/edit a post and regenerate'
    ssh root@joeldare.com "cd /var/www/joeldare-blog;git pull"
    ;;
  q)
    echo Then why even start?
    echo
    ;;
esac
