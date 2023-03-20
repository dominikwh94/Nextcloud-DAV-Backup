#!/bin/bash

currentTime=$(date +'%Y%m%d_%H%M%S')

targetDirectory="/tmp/dav" # Change to your path

ncUsername=""
ncPasswd="" # Use App-Password for security reasons
ncCalendar=""

davUrl="https://NEXTCLOUD-ADDRESS/remote.php/dav/calendars/$ncUsername/$ncCalendar/?export" # Edit NEXTCLOUD-ADDRESS to your address
outputFile="$targetDirectory/$currentTime-calendar-$ncCalendar.ics"

wget \
    --output-document="$outputFile" \
    --auth-no-challenge \
    --http-user="$ncUsername" \
    --http-password="$ncPasswd" \
    $davUrl