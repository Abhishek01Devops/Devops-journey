#!/bin/bash

file="devops.log"

if [ -f $file ]
then
  echo "File exists"
else
  echo "File not found"
fi
