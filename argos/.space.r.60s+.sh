#!/usr/bin/env bash



echo ": $(df -h | grep p6 | awk '{print $5}')  | font=Roboto size=9"
echo "---"


echo "$(date) | font=Roboto size=12"
echo "Used: $(df -h | grep p6 | awk '{print $3}') | font=Roboto size=12"
echo "Free: $(df -h | grep p6 | awk '{print $4}') | font=Roboto size=12"

