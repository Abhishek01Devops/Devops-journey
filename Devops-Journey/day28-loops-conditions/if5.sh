#!/bin/bash

usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ $usage -gt 50 ]
then
  echo "Warning: Disk usage high"
else
  echo "Disk usage normal"
fi
