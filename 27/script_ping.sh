#!/bin/bash

read -p "Enter the address to ping: " address
max_ping_ms=100
max_failures=3
failures=0

while true; do
	ping_output=$(ping -c 1 "$address")
	exit_code=$?

	if [ "$exit_code" -eq 0 ]; then
		ping_time=$(echo "$ping_output" | grep "time=" | awk -F 'time=' '{print $2}' | awk '{print $1}')
		if [[ -n "$ping_time" ]] && [[ $(echo "$ping_time > $max_ping_ms" | bc -l) -eq 1 ]]; then
			echo "Ping $address exceeds $max_ping_ms ms: $ping_time ms."
		else
			echo "Ping $address successful: $ping_time ms."
		fi
		failures=0
	else
		echo "Ping $address failed."
		((failures++))
	fi

	if [ "$failures" -ge "$max_failures" ]; then
		echo "The maximum number of failed attempts has been exceeded ($max_failures)."
		failures=0
	fi

	sleep 1
done
