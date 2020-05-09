#!/bin/bash
today="on:"`date +%Y%m%d`
# echo $today
reviewfile=`grep -l $today  $dbg/*`
# echo $reviewfile
vim $reviewfile
