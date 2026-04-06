#!/bin/bash

USER_NAME=$USER
CURRENT_DIR=$PWD
TODAY=$(date)

echo "==============================" >> run.log
echo "Script executed at: $TODAY" >> run.log
echo "User: $USER_NAME" >> run.log
echo "Directory: $CURRENT_DIR" >> run.log
echo "Disk Usage:" >> run.log
df -h / >> run.log
echo "" >> run.log
