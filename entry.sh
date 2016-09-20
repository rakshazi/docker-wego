#!/bin/sh
if [[ -z $LOCATION ]]; then
    echo "You need to set your location (city or lat/long). Add the option '-e LOCATION=[New York]' to your docker run command"
    exit;
fi
if [[ -z $DAYS ]]; then
    DAYS=3;
fi
if [[ -z $UNITS ]]; then
    UNITS="metric";
fi
if [[ -z $FRONTEND ]]; then
    FRONTEND="ascii-art-table" #can be 'emoji' or 'json'
fi
if [[ -z $API_KEY ]];  then
    echo "An API_KEY  is required, go to https://github.com/schachmat/wego#setup to choose backend service and get key. Then add the option '-e BACKEND=[forecast.io or worldweatheronline.com] -e API_KEY=[API KEY]' to your docker run command"
    exit;
fi

BACKEND_CODE="forecast-api-key"
if [[ $BACKEND != "forecast.io" ]]; then
    BACKEND_CODE="wwo-api-key"
fi

CONFIG="location=$LOCATION\ndays=$DAYS\nunits=$UNITS\nfrontend=$FRONTEND\nbackend=$BACKEND\n$BACKEND_CODE=$API_KEY"
echo -e $CONFIG >> /root/.wegorc

wego $*
