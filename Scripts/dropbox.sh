#!/bin/bash


text=$(dropbox-cli status)


if [[ $text == *"Up to date"* ]]; then
    echo " "
elif [[ $text == *"Uploading"* ]]; then
    echo " "
elif [[ $text == *"Downloading"* ]]; then
    echo " "
elif [[ $text == *"Syncing"* ]]; then
    echo " "
else 
    echo " "
fi

