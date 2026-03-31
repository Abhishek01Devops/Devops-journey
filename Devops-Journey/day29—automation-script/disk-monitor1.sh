#!/bin/bash

LOGFILE="disk.log"

while true
do
  usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

  echo "$(date) : Disk usage = $usage%" | tee -a $LOGFILE

  if [ $usage -gt 50 ]
  then
    echo "$(date) : WARNING - Disk usage high" | tee -a $LOGFILE
  fi

  echo "---------------------" | tee -a $LOGFILE

  sleep 5
done
