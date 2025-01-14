#!/bin/bash

echo "System Uptime Info"

echo "# CPU Usage #"

top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}'


echo "# Total Memory Usage #"

free -m | awk 'NR==2{printf "Used Memory: %sMB (%.2f%%)\nFree Memory: %sMB (%.2f%%)\n", $3, $3*100/($3+$4), $4, $4*100/($3+$4)}'


echo "# Total Disk Usage #"

df -h --total | awk '/total/{printf "Total Disk Usage: %s Used, %s Available, %s Total\n", $3, $4, $2}'


echo "# Top 5 Processes by Memory Usage #"

ps -eo pid,comm,%mem --sort=-%mem | head -n 6


echo "# Top 5 Processes by CPU Usage #"

ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
