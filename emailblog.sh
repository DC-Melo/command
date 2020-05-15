#!/usr/bin/env bash
# pre-treatment platform
if [  -n "$(uname -a | grep -i ubuntu)" ]; then
    echo send yestorday blog by ubuntu
elif [  -n "$(uname -a | grep -i centos)" ]; then
    echo send yestorday blog by centos
elif [  -n "$(uname -a | grep -i darwin)" ]; then
    echo send yestorday blog by mac
elif [  -n "$(uname -a | grep -i android)" ]; then
    echo send yestorday blog by android
    export dbg=$HOME/blog
else
    echo Unknown system,check $0 send yestorday blog shell
fi
if [ ! -n "$1" ] ;then
    today=`date --date="1 days ago" +%Y%m%d`
else
    today=$1
fi

if [  -n "$(uname -a | grep -i -E 'ubuntu|android')" ]; then
    begin_second=`date --date="19851018" +%s`
    now_second=`date -d "$today" +%s`
    WeekDay=`date -d $today +%V%a%y`
    DateDay=`date -d $today +%Y%m%d`
elif [  -n "$(uname -a | grep -i centos)" ]; then
    echo centos
elif [  -n "$(uname -a | grep -i darwin)" ]; then
    begin_second=`date -jf %Y%m%d 19851018 +%s`
    now_second=`date -j -f "%Y%m%d" $today "+%s"`
    WeekDay=`date -j -f "%Y%m%d" $today +%V%a%y`
    DateDay=`date  -j -f "%Y%m%d" $today +%Y%m%d`
else
    echo Unknown system
fi
LiveDay=$((($now_second - $begin_second)/86400))
RemainingDay=$((12578*2-$LiveDay))

# echo Today is: $today $WeekDay, Live days: $LiveDay days,Remaining Days: $RemainingDay days
yesterday_blog="$RemainingDay-$WeekDay-$DateDay"
blog_file="$dbg/$yesterday_blog"
echo $blog_file
mutt -s $yesterday_blog melo.dachor@gmail.com < $blog_file 
