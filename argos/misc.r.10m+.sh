#!/usr/bin/env bash



echo ""
echo "---"


echo "$(date)"
echo "---"
echo ": $(dropbox-cli status)"
echo "---"
echo "SSD : $(df -h | grep p6 | awk '{print $3}')/$(df -h | grep p6 | awk '{print $2}') [$(df -h | grep p6 | awk '{print $5}')]"
echo "HDD : $(df -h | grep sda3 | awk '{print $3}')/$(df -h | grep sda3 | awk '{print $2}') [$(df -h | grep sda3 | awk '{print $5}')]"
echo "---"
#echo "Cache: $(sudo ls /var/cache/pacman/pkg | wc -l) packages, $(du -sh /var/cache/pacman/pkg | awk '{print $1}')"
