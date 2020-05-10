#!/bin/bash
if [ ! -n "$1" ] ;then                    
    # echo "no argument!"
    today=`date +%Y%m%d`
else
    # echo "your argument is $1"
    today=$1
fi
# 第一个记忆周期是5分钟，第二个记忆周期是30分钟，第三个记忆周期是12小时。
# 第四个记忆周期是1天，第五个记忆周期是2天，第六个记忆周期是4天，第七个记忆周期是7天，第八个记忆周期是15天
echo -e -n "TARGET:"
echo -e "DAWN → SUNRISE → MORNING → NOON → AFTERNOON → SUNSET → EVENING → NIGHT"
echo -e "●: ⇒ "
echo -e "●: ⇒ "
echo -e "●: ⇒ "
echo -e ""
                                          
echo -e -n "TODO:"                              
echo -e -n "@"`date -d $today +%Y%m%d`" → ? → "
echo -e -n "@"`date -d $today +%Y%m%d`" → ? → "
echo -e -n "@"`date -d $today +%Y%m%d`" → ? → "
echo -e "@"`date -d "$today 1 days" "+%Y%m%d"`" → ? → "
echo -e -n "    :"
echo -e -n "@"`date -d "$today 2 days" "+%Y%m%d"`" → ? → "
echo -e -n "@"`date -d "$today 4 days" "+%Y%m%d"`" → ? → "
echo -e -n "@"`date -d "$today 7 days" "+%Y%m%d"`" → ? → "
echo -e -n "@"`date -d "$today 15 days" "+%Y%m%d"`" → ? ⇒ "
echo ""
blogname=$((12578*2-$((($(date --date=$today +%s)-$(date --date="19851018" +%s) )/86400))))-`date --date=$today +%V%a%y`-`date --date=$today +%Y%m%d`
echo "mutt -s $blogname melo.dachor@gmail.com < $dbg/$blogname"
echo ""
    





