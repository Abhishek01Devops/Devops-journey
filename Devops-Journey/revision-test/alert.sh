#!/bin/bash

USAGE=$(df -h / | awk 'NR==2 {print $5}')

echo "Disk usage: $USAGE"

if [ "$USAGE" = "100%" ]
then
  echo "Disk full!"
else
  echo "Disk OK"
fi
