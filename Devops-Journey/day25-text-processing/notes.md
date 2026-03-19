Day 25 — Text Processing Practice

### Overview
In this session we practiced real-world text processing using:
	•	grep → search text
	•	awk → filter and extract data
	•	sed → modify text

These tools are used in DevOps for log analysis and troubleshooting.

⸻

### Example Log File (server.log)

- INFO User login success
- ERROR Failed password for user root
- WARNING Disk usage 90%
- INFO File uploaded
- ERROR Connection timeout
- INFO Backup completed
- WARNING Memory usage high
- ERROR Failed password for admin

⸻

grep — Searching Logs

#### grep “ERROR” server.log
→ shows all ERROR lines

#### grep -i “error” server.log
→ case insensitive search

#### grep -c “ERROR” server.log
→ count number of ERROR logs

grep “INFO” server.log
grep “WARNING” server.log

⸻

### awk — Filtering & Extracting Data

#### awk ‘/ERROR/ {print $0}’ server.log
→ prints full ERROR lines

#### awk ‘/Failed/ {print $6}’ server.log
→ extracts usernames

## Output:
- root
- admin

#### awk ‘{print $1}’ server.log
- → prints log levels

#### awk ‘/INFO/ {print NR,$0}’ server.log
- → shows line numbers

⸻

### sed — Modifying Text

#### sed ‘s/ERROR/ALERT/g’ server.log
- → replaces ERROR with ALERT

#### sed ‘s/WARNING/NOTICE/g’ server.log
- → replaces WARNING with NOTICE

⸻

### ombining Commands (Pipelines)

#### grep “Failed” server.log | awk ‘{print $6}’
- → extract usernames

#### tail -f server.log | grep “ERROR”
- → real-time monitoring

⸻

### Key Concepts

- $0 → full line
- $1 $2 $3 → columns
- NR → line number
- /pattern/ → search pattern
- | → pipe (combine commands)

⸻

### Summary
- grep → find data
- awk → extract data
- sed → modify data
