#!/bin/bash
while(true)
do
	temp=`df / | awk '{print $5}' | tail -1 | sed 's/[%]//g'`
	if [ $temp -gt 80 ]; then 
		echo "Warning ! Space utilization exceeding 80%" | mailx root
	fi
	sleep 20
done

