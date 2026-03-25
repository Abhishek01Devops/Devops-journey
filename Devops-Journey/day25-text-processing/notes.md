Day 25 — Text Processing Practice

### Overview
In this session we practiced real-world text processing using:
	•	grep → search text
	•	awk → filter and extract data
	•	sed → modify text

These tools are used in DevOps for log analysis and troubleshooting.

---

### Example Log File (server.log)

- INFO User login success
- ERROR Failed password for user root
- WARNING Disk usage 90%
- INFO File uploaded
- ERROR Connection timeout
- INFO Backup completed
- WARNING Memory usage high
- ERROR Failed password for admin

---

# grep — Search Text

- grep ERROR server.log :- Find ERROR lines

- grep -i error server.log :- Case insensitive search

- grep -n ERROR server.log :- show line number

- grep -v ERROR server.log :- Invert match (exclude ERROR)

- grep -c ERROR server.log :- Count matches

---

# awk — Column Processing

- awk '{print $1}' server.log :- Print first column

- awk '{print $1, $2}' server.log :- Print first and second column

- awk '$1=="ERROR"' server.log :- Filter ERROR using awk

- awk '{$1=""; print}' server.log :- Remove first column

- awk '{print $1}' server.log | sort :- Sort log levels

- sort -r server.log :- Reverse sort

- awk '{print $1}' server.log | sort | uniq :- Unique log levels

- awk '{print $1}' server.log | sort | uniq -c :- Count duplicates

---

# sed — Modify Text

- sed 's/WARNING/ALERT/g' server.log :- Replace WARNING with ALERT

- sed 's/ERROR/CRITICAL/g' server.log :- Replace ERROR with CRITICAL

- sed '/INFO/d' server.log :- Delete INFO lines

---

# Combined Commands 

- grep ERROR server.log | wc -l :- Count ERROR logs

- awk '{print $1}' server.log | sort | uniq -c :- Count each log level

- awk '{print $1}' server.log | sort | uniq -c | sort -nr :- Sort by highest count

- grep ERROR server.log | tail :- Find last errors

---

## Key Concepts Learned

- grep → search text
- awk → column processing
- sed → modify text
- sort → sorting
- uniq → remove duplicates
- pipe (|) → combine commands
- log analysis for DevOps

---