#!/usr/bin/env bash
# pre-treatment platform
if [  -n "$(uname -a | grep -i ubuntu)" ]; then
    echo ubuntu
elif [  -n "$(uname -a | grep -i centos)" ]; then
    echo centos
elif [  -n "$(uname -a | grep -i darwin)" ]; then
    echo mac
elif [  -n "$(uname -a | grep -i android)" ]; then
    echo android
    export dbg=$HOME/blog
else
    echo Unknown system
fi

cd $dbg
git add .
git commit -m "blog"
git push
