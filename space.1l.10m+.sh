#!/usr/bin/env bash



echo "🗄: $(df -h | grep p6 | awk '{print $5}')"
echo "---"



echo "Used: $(df -h | grep p6 | awk '{print $3}')"
echo "Free: $(df -h | grep p6 | awk '{print $4}')"



