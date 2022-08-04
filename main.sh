#!/bin/bash

memory=$(free | grep Mem | cut -f 20 -d ' ')


while [[ true ]]; do
	if [[ $memory<=100000 ]]; then
	dunstify "Warning!" "High memory usage"
	fi

	sleep 1m
done

