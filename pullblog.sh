#!/usr/bin/env bash
# pre-treatment platform
if [  -n "$(uname -a | grep -i ubuntu)" ]; then
    echo pull blog by ubuntu
    # :
elif [  -n "$(uname -a | grep -i centos)" ]; then
    echo push blog by centos
    # :
elif [  -n "$(uname -a | grep -i darwin)" ]; then
    echo push blog by mac
    # :
elif [  -n "$(uname -a | grep -i android)" ]; then
    echo push blog by android
    export dbg=$HOME/blog
else
    echo Unknown system, check $0 shell
fi

cd $dbg
git pull
