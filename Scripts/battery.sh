#!/bin/sh


state=$(acpi -a | awk '{print $3}')
percentage=$(acpi -b | awk '{print $4}')
is_full=$(acpi -b | awk '{print $3}')
percentage=${percentage::-2}

if  [[ $1 = "-c" ]]; then
    time=$(acpi -b | awk '{print $5 }')
    printf "$time"

    exit
fi

#check if state is charging, or discharging
if  [[ $state == *"on-line"* ]]; then
    str_state=$""
    if [[ $is_full == *"Full"* ]]; then
        percentage=100
    fi
elif  [[ $state == *"off-line"* ]]; then
    if (($percentage >= 95)); then
        str_state=$""
        percentage=100
    elif (($percentage >= 80 && $percentage <=94)); then
        str_state=$""
    elif (($percentage >= 60 && $percentage <=79)); then
        str_state=$""
    elif (($percentage >= 35 && $percentage <=59)); then
        str_state=$""
    elif (($percentage >= 15 && $percentage <=34)); then
        str_state=$""
    elif (( $percentage <=14)); then
        str_state=$""
    else
        str_state=$"ERROR1"
fi
else
    str_state=$"ERROR2"
fi

echo "$str_state $percentage%"