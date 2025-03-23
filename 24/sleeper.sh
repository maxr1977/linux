#!/bin/bash

for i in {1..10}; do
	echo "$(date +'%H:%M:%S') $(ps -ef | wc -l)"
# sleep 5
done

cat /proc/cpuinfo >> info.txt
grep "NAME=" /etc/os-release | head -1 >> info.txt
grep "NAME=" /etc/os-release | head -n 1 | awk -F'"' '{print $2}' >> info.txt

for j in {50..100}; do
	touch "$j.txt"
done
