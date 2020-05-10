#!/bin/sh
echo '
-------------------------------------------------------------------------
| Time	: 2019-06-15
| Author: Melo.DC
| Email	: melo.dachar@gmail.com
| File	: ss2blog.sh
| Param.: screen shot comment
| Exam.	: ss2blog.sh comment
------------------------------------------------------------------------
'
# make path 
if [ ! -d $dpj/006-write/picutre  ];then
    mkdir -p $dpj/006-write/picture
    echo make dir $dpj/006-write/picture
fi

#screen shot and save file 
pngfilename='screenshot-'`date +%Y-%m-%d-%H-%M-%S`.png

if [  -n "$(uname -a | grep -i ubuntu)" ]; then
    # sudo apt-get update && sudo apt-get upgrade
    gnome-screenshot -d 3 -f $dpj/006-write/picutre/$pngfilename
elif [  -n "$(uname -a | grep -i centos)" ]; then
    yum update
elif [  -n "$(uname -a | grep -i darwin)" ]; then
    brew install mutt
else
    echo Unknown system
fi

# echo '<img src="'"$dpj/006-write/picture/$pngfilename"'" alt="'""'" />' >> $blogfile.html
echo '<img src="'"$dpj"'/006-write/picutre/'"$pngfilename"'" alt="'"$1"'" />' >> $blogfile

read -r -p "do you want to edit the picture? [Y/n] " input
case $input in
    [yY][eE][sS]|[yY])
        echo "Yes"
        shutter "$dpj/006-write/picutre/$pngfilename"
        exit 1
        ;;

    [nN][oO]|[nN])
        echo "No"
        exit 1
        ;;

    *)
        echo "other input..."
        ;;
esac


