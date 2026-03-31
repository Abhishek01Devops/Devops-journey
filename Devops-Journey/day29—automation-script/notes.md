# Day 29 — Automation Script

## Goal
Create a real DevOps automation script that:
- monitors disk usage
- runs continuously
- shows warning if usage high
- writes output to log file
- adds timestamp

--------------------------------------------------

# Hour 1 — Basic Automation Loop

Script:
#!/bin/bash

while true
do
  df -h /
  sleep 5
done

What It Does:
- runs forever
- prints disk usage
- waits 5 seconds
- repeats

--------------------------------------------------

# Hour 2 — Add Condition (Alert System)

Script:
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

What We Added:
- variable usage
- if condition
- warning message
- cleaner output

--------------------------------------------------

# Hour 3 — Logging + Timestamp (Final Script)

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

--------------------------------------------------

# Commands Used

Make executable:
chmod +x disk-monitor.sh

Run script:
./disk-monitor.sh

Monitor log:
tail -f disk.log

--------------------------------------------------

# Key Concepts Learned
- automation scripting
- infinite loop
- disk monitoring
- if conditions in automation
- variables in scripts
- timestamp logging
- tee command
- real-time monitoring

--------------------------------------------------

# Files Created
- disk-monitor.sh
- disk.log

--------------------------------------------------

# DevOps Use Case
- server monitoring
- disk alerts
- production automation
- health checks

--------------------------------------------------

# Day 29 Completed
You built a real monitoring automation script.
This is production-level beginner DevOps scripting.