#!/bin/bash
netstat -nap | grep 106.14.166.241
if [ $? -eq 1 ]; then
	echo "starting ssh CfNg"
    nohup ssh -CfNg -R 5122:localhost:22  root@aliyun &
else
	echo "ssh CfNG is already started"
fi
