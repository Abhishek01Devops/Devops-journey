#!/bin/bash

while true
do
  echo "------ $(date) ------" >> devops.log
  df -h >> devops.log
  echo "" >> devops.log
  sleep 5
done
