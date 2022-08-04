#!/bin/bash

memory=$(free | grep Mem | cut -f 20 -d ' ')
battery=$(acpi | cut -f 4 -d ' ' | sed 's/%/ /')
temperature=$(sensors | grep temp1: | cut -f 9 -d ' ' | cut -c 2- | sed 's/°C/ /')

while [[ true ]]; do

	if [[ $memory<=100000 ]]; then
		dunstify "Warning!" "High memory usage"
	fi

	if [[ $battery=100 ]]; then
		dunstify "Warning!" "Battery fully charged. Unplug the charger"
		elif [[ $battery<=20 ]]; then
			dunstify "Warning!" "Low battery. Plug the charger"
	fi

	if [[ $temperature>=85 ]]; then
		dunstify "Warning!" "High temperature recorded"
	fi

	sleep 1m
done

