#!/bin/bash
if [ -e "$1" ];then
    echo $1 exist
    filePath="$(readlink -f $1)"
    fileName="$(basename -- $1)"
    filePathLn="$HOME/2P/006-write/root$filePath"
    fileFolder="$(dirname $filePath)"
    fileFolderLn="$HOME/2P/006-write/root$fileFolder"
    if [ ! -d "$fileFolderLn" ]; then
        mkdir -p $fileFolderLn
    else
        echo folder $fileFolder exist
    fi

    if [ -e "$filePathLn" ];then
        echo $filePathLn exist,do not need to backup
    elif [ -d "$1" ];then
        tar -cvf  $filePathLn.tar $filePath
        echo "tar fille:$filePath -> $filePathLn.tar"
    elif [ -f "$1" ];then
        ln $1 $filePathLn 
        echo "link fille:$filePath -> $filePathLn"
    else
        echo $1 is not a file nor a folder
    fi

    echo $fileName in $fileFolder
    ls -l -i -h $fileFolder |grep $fileName
    echo $fileName in $fileFolderLn
    ls -l -i -h $fileFolderLn |grep $fileName
else
    echo $1 not exist
fi
