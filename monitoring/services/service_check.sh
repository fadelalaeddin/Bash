#!/bin/bash

service=$1 

systemctl $1 status > output.txt

if grep -q "running" output.txt; then 
	echo "$1 service is running" 
else 
        sudo systemctl start $1
	echo "$1 was not running. it has been restarted" 
fi 

sudo rm -f output.txt
