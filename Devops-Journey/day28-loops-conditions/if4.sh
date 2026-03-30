#!/bin/bash

echo "Enter username:"
read user

if [ "$user" = "root" ]
then
  echo "Admin user"
else
  echo "Normal user"
fi

