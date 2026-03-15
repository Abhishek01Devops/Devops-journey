### What is awk
`awk` is a **pattern scanning and text processing tool** used to:
- filter data
- extract specific columns
- search patterns
- process structured text files

It is especially useful for **logs, CSV files, and command outputs**.

---


### awk ‘{print $0}’ data.txt :-
Print Entire Line

### awk ‘{print $1}’ file.txt :- 
This prints the **first column** of every line.

---

# Fields in awk
`awk` automatically splits each line into **fields (columns)** using spaces or tabs.

### Example file
Name Age City
Alice 25 London
Bob 30 Paris
Charlie 28 Berlin
David 35 Tokyo

---

### awk ‘{print $1}’ data.txt:- 
* Name
- Alice
- Bob
- Charlie
- David

---

### awk ‘{print $1,$3}’ data.txt:-
Print Multiple Columns

# Output
- Name City
- Alice London
- Bob Paris
- Charlie Berlin
- David Tokyo

--- 

### awk ‘{print NR,$0}’ data.txt :-
Print Line Numbers

# output
- 1 Name Age City
- 2 Alice 25 London
- 3 Bob 30 Paris
- 4 Charlie 28 Berlin
- 5 David 35 Tokyo

---
### awk ‘{print NF}’ data.txt :- 
Count Number of Fields

# Output
- 3
- 3
- 3
- 3
- 3

---

### awk ‘$2==30 {print $0}’ data.txt:-
Filter Exact Value

# Output
Bob 30 Paris

---
### awk ‘$2>28 {print $0}’ data.txt :-
Filter greater than 28

# Output
- Bob 30 Paris
- David 35 Tokyo

---

### awk ‘$2<30 {print $0}’ data.txt :-
Filter less than 30

# output
- Alice 25 London
- Charlie 28 Berlin

---

### awk ‘$2>28 {print $1,$3}’ data.txt :-
 Print Specific Columns After Filtering

# output
- Bob Paris
- David Tokyo

---

### awk ‘NR>1 {print $0}’ data.txt :-
# Skip Header Line
Sometimes the first line is a header. We can skip it.

# output
- Alice 25 London
- Bob 30 Paris
- Charlie 28 Berlin
- David 35 Tokyo

---

### awk ‘$1==“Alice” {print $0}’ data.txt :- 
# Search by Text Column
Find a specific name

---

# Example Log File
Example `app.log`

INFO Server started
ERROR Database connection failed
WARNING Disk usage high
INFO User login
ERROR Timeout occurred
INFO Backup completed

--- 

### awk ‘/ERROR/ {print $0}’ app.log :-
 Search Specific Log Level

# Output :-
ERROR Database connection failed
ERROR Timeout occurred

--- 

### awk ‘/INFO/ {print $0}’ app.log :- 
Filter INFO Logs

# Output :-
- INFO Server started
- INFO User login
- INFO Backup completed

---

### awk ‘/ERROR/ {print $2,$3,$4}’ app.log :-
 Print Only the Message (Skip Log Level)

# output :-
Database connection failed
Timeout occurred

---

### awk ‘/ERROR/ {count++} END {print count}’ app.log :-
Count specific logs

# output :-
2

---

# Important awk Variables

| Variable | Meaning |
|------|------|
| `$1` | first column |
| `$2` | second column |
| `$3` | third column |
| `$0` | entire line |
| `NR` | line number |

---


# Key Commands Practiced

| Command | Purpose |
|------|------|
| awk '{print $0}' file | print entire line |
| awk '{print $1}' file | print first column |
| awk '{print $1,$3}' file | print selected columns |
| awk '{print NR,$0}' file | print line number |
| awk '{print NF}' file | count fields |
| `awk '$2==30 {print $0}' file` | filter exact value |
| `awk '$2>28 {print $0}' file` | filter greater than |
| `awk '$2<30 {print $0}' file` | filter less than |
| `awk '$2>28 {print $1,$3}' file` | print selected columns |
| `awk 'NR>1 {print $0}' file` | skip header |
| `awk '/ERROR/ {print $0}' file` | show error logs |
| `awk '/INFO/ {print $0}' file` | show info logs |
| `awk '/WARNING/ {print $0}' file` | show warning logs |
| `awk '/ERROR/ {count++} END {print count}' file` | count error logs |
| `awk '/ERROR/ {print NR,$0}' file` | show errors with line numbers |
