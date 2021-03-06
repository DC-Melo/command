#!/usr/bin/env bash
if [ ! -n "$1" ] ;then
    today=`date +%Y%m%d`
else
    today=$1
fi

if [  -n "$(uname -a | grep -i ubuntu)" ]; then
    begin_second=`date --date="19851018" +%s`
    now_second=`date -d "$today" +%s`
    WeekDay=`date -d $today +%V%a%y`
    DateDay=`date -d $today +%Y%m%d`
elif [  -n "$(uname -a | grep -i andorid)" ]; then
    begin_second=`date --date="19851018" +%s`
    now_second=`date -d "$today" +%s`
    WeekDay=`date -d $today +%V%a%y`
    DateDay=`date -d $today +%Y%m%d`
    $dcm="$HOME/command"
    $dbg="$HOME/blog"
elif [  -n "$(uname -a | grep -i centos)" ]; then
    echo centos system, check shell
elif [  -n "$(uname -a | grep -i darwin)" ]; then
    begin_second=`date -jf %Y%m%d 19851018 +%s`
    now_second=`date -j -f "%Y%m%d" $today "+%s"`
    WeekDay=`date -j -f "%Y%m%d" $today +%V%a%y`
    DateDay=`date  -j -f "%Y%m%d" $today +%Y%m%d`
else
    echo Unknown system, check shell
fi
LiveDay=$((($now_second - $begin_second)/86400))
RemainingDay=$((12578*2-$LiveDay))

echo Today is: $today $WeekDay, Live days: $LiveDay days,Remaining Days: $RemainingDay days
echo $RemainingDay-$WeekDay-$DateDay
export blogname=$RemainingDay-$WeekDay-$DateDay

$dcm/ebbinghaus.sh $today > $blogname

