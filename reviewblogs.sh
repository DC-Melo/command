#!/bin/bash
today="on "`date +%Y%m%d`
reviewfile=`grep -l $today  $dbg/*`
echo $reviewfile
vim $reviewfile
