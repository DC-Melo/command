#!/bin/bash
# shopt -s globstar  ## Enables recursive glob matching
# for f in **/*$1; do
#     iconv -f gbk -t utf8 -o "${f%$1}".utfi$1 "$f" # && rm "$f"
# done

echo '
-------------------------------------------------------------------------
| Time	: 2020-05-27
| Author: Melo.DC
| Email	: melo.dachar@gmail.com
| File	: change folder from gbk to utf8
| Param.: extend name 
| Exam.	: gbk2utf.sh ".cpp"
------------------------------------------------------------------------
'


if [ ! -n "$1" ] ;then
    echo no extend file name,so change all file
else
    echo extend is $1,just change $1 file
fi

shopt -s globstar  ## Enables recursive glob matching
for f in **/*$1; do
    echo -en `file -i "$f"`
    if file -i $f | grep -iwq "iso-8859"
    then
        iconv -f gbk -t utf8 -o "${f%$1}".new "$f"  && mv "${f%$1}".new "$f" && echo ": CONVERTED TO UTF-8."
    else
        echo ": UTF-8 ALREADY."
    fi
done
echo change finished OK



