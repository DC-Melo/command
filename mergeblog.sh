#!/usr/bin/env bash
# pre-treatment platform
if [  -n "$(uname -a | grep -i ubuntu)" ]; then
    echo merge blog by ubuntu
elif [  -n "$(uname -a | grep -i centos)" ]; then
    echo merge blog by centos
elif [  -n "$(uname -a | grep -i darwin)" ]; then
    echo merge blog by mac
elif [  -n "$(uname -a | grep -i android)" ]; then
    echo merge blog by android
    export dbg=$HOME/blog
else
    echo Unknown system,check $0 shell
fi

cd $dbg
git add .
git commit -m "blog"
git fetch origin
git merge origin/master

