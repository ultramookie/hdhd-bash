#!/bin/bash

HDHRIP=<IP Address of your HD Homerun>
HDHRPORT=5004
CHANNEL=9.1
FILENAME="output"
TIMEOUTSECS=4200
DATE=`date +%Y%m%d-%H%M%S`

# Channel
if [ "$1" ]
    then
        CHANNEL="$1"
fi

# Output Filename
if [ "$2" ]
    then
        FILENAME="$2"
fi

# How Long To Record
if [ "$3" ]
    then
        TIMEOUTSECS="$3"
fi

# GO!
cd /recordings
curl http://$HDHRIP:$HDHRPORT/auto/v$CHANNEL -m $TIMEOUTSECS>> "v$CHANNEL"
mv "v$CHANNEL" "$FILENAME-$DATE".mpg
