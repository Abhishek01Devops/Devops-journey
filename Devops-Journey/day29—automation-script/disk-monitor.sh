#!/bin/bash

while true
do
  usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

  echo "Disk usage: $usage%"

  if [ $usage -gt 50 ]
  then
    echo "WARNING: Disk usage high"
  else
    echo "Disk usage normal"
  fi

  echo "-----------------------"
  sleep 5
done
