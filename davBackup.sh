#!/bin/bash

currentTime=$(date +'%Y%m%d_%H%M%S')

targetDirectory="/tmp/dav" # Change to your path

ncUsername=""
ncPassword="" # Use App-Password for security reasons

ncCalendars=( \
    "personal" \
    "geburtstage" \
    )


for i in "${ncCalendars[@]}"
do
    davUrl="https://NEXTCLOUD-ADDRESS/remote.php/dav/calendars/$ncUsername/$i/?export" # Edit NEXTCLOUD-ADDRESS to your address
    outputFile="$targetDirectory/$currentTime-calendar-$i.ics"
    echo $davUrl
    echo $outputFile
    wget \
        --output-document="$outputFile" \
        --auth-no-challenge \
        --http-user="$ncUsername" \
        --http-password="$ncPassword" \
        $davUrl
done