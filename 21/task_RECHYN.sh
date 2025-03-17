#!/bin/bash

for i in {1..10}
do
touch "/opt/131224-wdm/rechyn/${i}_$(date +"%d.%m.%y")"
done
