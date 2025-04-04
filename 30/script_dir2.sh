#!/bin/bash

DIR1="/opt/131224-wdm/rechyn/dir_1/"
DIR2="/opt/131224-wdm/rechyn/dir_2/"

for FILE in "$DIR1"/*; do
	FILENAME=$(basename "$FILE")

	if [[ "$FILENAME" =~ ^[0-9]+$ ]]; then
		if ((FILENAME % 2 ==0 )); then
    			mv "$FILE" "$DIR2" 
		fi
  	fi
done
