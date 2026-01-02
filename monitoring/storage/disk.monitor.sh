#!/bin/bash


if [[ "$EUID" -ne 0 ]]; then 
	echo "Error: You neet root access" 
	exit 1
fi

LOG_FILE=/var/log/disk-monitor-logs.txt

echo "------------------------" >> $LOG_FILE
echo "Report capture - $(date)" >> $LOG_FILE
echo "------------------------" >> $LOG_FILE

DISK_USAGE=$( df -h | awk 'NR==2 {print $5}' | tr -d '%') 

THRESHOLD=80

if [[ $DISK_USAGE -ge $THRESHOLD ]]; then 
	echo "Immediate action required. Consider freeing up space" | tee -a $LOG_FILE
else 
	echo "NO action required" | tee -a $LOG_FILE
fi

