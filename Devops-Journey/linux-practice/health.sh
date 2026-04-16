#!/bin/bash
echo "------" >> health.log
echo "Time: $(date)" >> health.log
echo "CPU Load: $(uptime)" >> health.log
echo "Disk: $(df -h / | awk 'NR==2 {print $5}')" >> health.log
echo "Memory:" >> health.log
free -h 2>/dev/null >> health.log || vm_stat >> health.log
