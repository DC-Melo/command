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
# 第一个记忆周期是5分钟，第二个记忆周期是30分钟，第三个记忆周期是12小时。
# 第四个记忆周期是1天，第五个记忆周期是2天，第六个记忆周期是4天，第七个记忆周期是7天，第八个记忆周期是15天
if [ ! -n "$1" ] ;then
    today=`date +%Y%m%d`
else
    today=$1
fi

# if [  -n "$(uname -a | grep -i 'ubuntu|android')" ]; then
if [  -n "$(uname -a | grep -i ubuntu)" ]; then
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
elif [  -n "$(uname -a | grep -i android)" ]; then
    begin_second=`date --date="19851018" +%s`
    now_second=`date -d "$today" +%s`
    WeekDay=`date -d $today +%V%a%y`
    DateDay=`date -d $today +%Y%m%d`
else
    echo Unknown system
fi
LiveDay=$((($now_second - $begin_second)/86400))
RemainingDay=$((12578*2-$LiveDay))

echo -e -n "TARGET:"
echo -e "DAWN → SUNRISE → MORNING → NOON → AFTERNOON → SUNSET → EVENING → NIGHT"
echo -e "●: ⇒ "
echo -e "●: ⇒ "
echo -e "●: ⇒ "
echo -e -n "TODO:"                              
if [  -n "$(uname -a | grep -i -E 'ubuntu|android')" ]; then
    echo -e -n "@"`date -d "$DateDay  0 days" "+%Y%m%d"`" → ??? → "
    echo -e -n "@"`date -d "$DateDay  1 days" "+%Y%m%d"`" → ??? → "
    echo -e -n "@"`date -d "$DateDay  2 days" "+%Y%m%d"`" → ??? → "
    echo -e -n "@"`date -d "$DateDay  4 days" "+%Y%m%d"`" → ??? → "
    echo -e -n "@"`date -d "$DateDay  7 days" "+%Y%m%d"`" → ??? → "
    echo -e -n "@"`date -d "$DateDay 15 days" "+%Y%m%d"`" → ??? ⇒ "
    echo ""
    # blogname=$((12578*2-$((($(date --date=$DateDay +%s)-$(date --date="19851018" +%s) )/86400))))-`date --date=$DateDay +%V%a%y`-`date --date=$DateDay +%Y%m%d`
elif [  -n "$(uname -a | grep -i centos)" ]; then
    echo centos
elif [  -n "$(uname -a | grep -i darwin)" ]; then
    echo -e -n "@"`date -j  -v-0d -f "%Y%m%d" "$DateDay" "+%Y%m%d"`" → ??? → "
    echo -e -n "@"`date -j  -v-1d -f "%Y%m%d" "$DateDay" "+%Y%m%d"`" → ??? → "
    echo -e -n "@"`date -j  -v-2d -f "%Y%m%d" "$DateDay" "+%Y%m%d"`" → ??? → "
    echo -e -n "@"`date -j  -v-4d -f "%Y%m%d" "$DateDay" "+%Y%m%d"`" → ??? → "
    echo -e -n "@"`date -j  -v-7d -f "%Y%m%d" "$DateDay" "+%Y%m%d"`" → ??? → "
    echo -e -n "@"`date -j -v-15d -f "%Y%m%d" "$DateDay" "+%Y%m%d"`" → ??? → "
    echo ""
    # blogname=$((12578*2-$((($(date --date=$today +%s)-$(date --date="19851018" +%s) )/86400))))-`date --date=$today +%V%a%y`-`date --date=$today +%Y%m%d`
else
    echo Unknown system
fi
blogname=$RemainingDay-$WeekDay-$DateDay
echo "mutt -s $blogname melo.dachor@gmail.com < $dbg/$blogname"
echo ""
