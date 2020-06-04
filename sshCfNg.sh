#!/bin/bash
# sudo crontab -e
# sudo crontab -l
# sudo crontab -r
# sudo service cron restart
# 58 9,11,13,15,17,19,21 * * * /home/dc/4T/command/sshCfNg.sh
netstat -nap | grep 106.14.166.241
if [ $? -eq 1 ]; then
	echo `date`": starting ssh CfNg" >> /var/schedule_task
    ssh -CfNg -R 5122:localhost:22  root@aliyun
else
	echo `date`": ssh CfNG is already started" >> /var/schedule_task
fi


