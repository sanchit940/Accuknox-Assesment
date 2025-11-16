#!/bin/bash

URL="https://buildwithsanchit.me/"

status_code=$(curl -o /dev/null -s -w "%{http_code}" "$URL")

if [ "$status_code" -eq 200 ]; then
    echo "Application is UP (HTTP 200)"
else
    echo "Application is DOWN (HTTP $status_code)"
fi
