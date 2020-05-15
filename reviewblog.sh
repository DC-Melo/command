#!/bin/bash
# pre-treatment platform
if [  -n "$(uname -a | grep -i ubuntu)" ]; then
    # echo ubuntu
    :
elif [  -n "$(uname -a | grep -i centos)" ]; then
    # echo centos
    :
elif [  -n "$(uname -a | grep -i darwin)" ]; then
    # echo mac
    :
elif [  -n "$(uname -a | grep -i android)" ]; then
    # echo android
    export dbg=$HOME/blog
else
    echo Unknown system
fi

if [ ! -n "$1" ] ;then
    today="@"`date +%Y%m%d`
else
    today="@$1"
fi
# echo $today
reviewfile=`grep -l $today  $dbg/* |sort -r`
# echo $reviewfile
vim $reviewfile
