#!/bin/bash
today="@"`date +%Y%m%d`
# echo $today
reviewfile=`grep -l $today  $dbg/*`
# echo $reviewfile
vim $reviewfile
