#!/bin/bash

i=1

while [ $i -le 2 ]
do
  echo "Enter your name:"
  read name
  echo "Hello $name"
  ((i++))
done
