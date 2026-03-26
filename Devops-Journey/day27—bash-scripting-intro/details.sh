#!/bin/bash

echo "Enter username:"
read user

if [ "$user" = "root" ]
then
  echo "You are admin"
else
  echo "Normal user"
fi
