#!/bin/bash

a=`free -m| grep "Mem" | awk '{print $4}'`
b=`uptime | sed -n -e 's/^.*load average:/CPU Load Average:/p'`
echo CPU AND MEMORY RESOURCES --------------------
echo  $b "	" Free RAM: $a MB
echo "     " 
c=`cat /proc/net/dev | tr -s " " | grep "lo" | cut -d : -f 2 | awk '{print $1}'`
d=`cat /proc/net/dev | tr -s " " | grep "lo" | cut -d : -f 2 | awk '{print $9}'`
e=`cat /proc/net/dev | tr -s " " | grep "enp0s3" | cut -d : -f 2 | awk '{print $1}'`
f=`cat /proc/net/dev | tr -s " "| grep "enp0s3" | cut -d : -f 2 | awk '{print $9}'`
echo NETWORK CONNECTIONS -------------------------
echo lo Bytes Received: $c "    " Bytes Transmitted: $d
echo enp0s3 Bytes Received: $e "    " Bytes Transmitted: $f
p=`ping -q -c 1 8.8.8.8` 
if [ $? -eq 0 ]; then
	echo Internet Connectivity: Yes
else 
	echo Internet Connectivity: No
fi
echo "		"
h=`cat /etc/passwd | wc -l`

i=`cat /etc/passwd | who | wc -l`
j=`cat /etc/passwd | cut -d : -f 7 | sort -r | uniq -c | sort -r | tail -1 | sed 's/[0-9]*//g'`
echo Account Information -------------------------
echo Total Users: $h "    " Number Active: $i
echo Most Frequently Used Shell: $j  
