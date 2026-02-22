 ## What is journalctl?
journalctl is a command used to view system logs collected by systemd.

- Logs help administrators:
	•	Troubleshoot problems
	•	Monitor services
	•	Debug failures
	•	Understand system activity
 All system events are stored in a centralized journal.

## Why Logs are Important in DevOps
- In real environments, when something fails:
	•	Websites stop working
	•	Services crash
	•	Servers restart unexpectedly
Logs are the first place engineers check.

## journalctl : 
Shows complete system logs from oldest to newest.

## journalctl -n 10 :
Shows last 10 log entries.

## journalctl -f : 
- ive Log Monitoring (Real-Time)
- Observed new logs appearing instantly.
- This simulates real production monitoring.

## Key Concepts Learned
- Logs help identify system issues
- Real-time monitoring is essential for DevOps engineers
- Linux stores centralized logs using systemd journal
- journalctl is a daily-use debugging tool

## journalctl -u nginx :
- What this means : -
	•	-u → unit (service name)
	•	Shows logs only for nginx service

## journalctl -u nginx -n 20 :
Shows last 20 nginx logs.

## journalctl -u nginx -f :
Live Monitoring for One Service

## journalctl --since today :
Show logs from today.

## journalctl --since "1 hour ago" :
Last 1 hour,Very useful during incidents.

## journalctl -p err : 
Shows only error-level logs.

## sudo nginx -t :
 Test Configuration (Pro Command )
 - output : syntax is ok test is successful

 