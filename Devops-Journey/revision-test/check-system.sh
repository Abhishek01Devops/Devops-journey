#!/bin/bash

USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "Disk usage is $USAGE%"

if [ $USAGE -gt 70 ]
then
  echo "⚠️ Disk almost full"
else
  echo "✅ Disk usage normal"
fi
