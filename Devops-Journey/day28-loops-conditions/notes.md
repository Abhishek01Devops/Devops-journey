## Day 28 — Loops & Conditions

### What is a Loop?
A loop runs the same command multiple times automatically.

Without loop:
- echo 1
- echo 2
- echo 3
- echo 4
- echo 5
With loop → automation

---

### What is For Loop?
A for loop runs commands for each value in a list.

# Basic Syntax:
for variable in list
do
  command
done

- for → start loop
- variable → temporary variable
- in → values list
- do → start commands
- done → end loop

# Rules
- must end with done
- variable can be anything
- use $ to print variable
- no syntax mistakes

### What is While Loop?
- A while loop runs as long as a condition is true.
- It keeps repeating commands until the condition becomes false.

---
## Why We Use While Loop
Used when:
- number of repetitions is unknown
- condition-based execution
- monitoring scripts
- waiting for events
- automation tasks

# while loop ex - practice.sh

## Comparison — For vs While

#### For Loop:
- fixed number of iterations

#### While Loop:
- condition based

⸻

### Conditions Used
- -le → less than or equal
- -ge → greater than or equal
- -lt → less than
- -gt → greater than
- -eq → equal
- -ne → not equal

---

### What is If Condition?
If condition allows a script to make decisions based on conditions.

#### Example:
If disk usage is high → show warning

# Why We Use If Condition

#### Used for:
- decision making
- automation logic
- monitoring alerts
- file checks
- user input validation

# Basic Syntax
if [ condition ]
then
  command
fi

## if ex = if.sh

### File Condition Options

- -f → file exists
- -d → directory exists
- -e → exists
- -r → readable
- -w → writable
- -x → executable
