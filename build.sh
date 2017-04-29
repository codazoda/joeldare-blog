#!/bin/bash

echo "Building"

if pgrep -x "hugo" > /dev/null
then
    echo "Hugo is already running."
else
    echo "Hugo starting in the background."
    hugo serve -p 1313 &
fi

open http://localhost:1313/blog/
