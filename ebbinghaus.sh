#!/bin/bash
# 第一个记忆周期是5分钟，第二个记忆周期是30分钟，第三个记忆周期是12小时。
# 第四个记忆周期是1天，第五个记忆周期是2天，第六个记忆周期是4天，第七个记忆周期是7天，第八个记忆周期是15天
# echo "1 review 05 min later:"`date +%Y%m%d`
# echo "2 review 30 min later:"`date +%Y%m%d`
# echo "3 review 12 h   later:"`date +%Y%m%d`
echo "TODO:"
echo "3 review 12 hours later @"`date +%Y%m%d`" ⇒ "
echo "4 review  1 days  later @"`date -d "1 days "  "+%Y%m%d"`" ⇒ "
echo "5 review  2 days  later @"`date -d "2 days "  "+%Y%m%d"`" ⇒ "
echo "6 review  4 days  later @"`date -d "4 days "  "+%Y%m%d"`" ⇒ "
echo "7 review  7 days  later @"`date -d "7 days "  "+%Y%m%d"`" ⇒ "
echo "8 review 15 days  later @"`date -d "15 days "  "+%Y%m%d"`" ⇒ "
