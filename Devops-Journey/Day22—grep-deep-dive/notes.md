## What is grep?
grep stands for Global Regular Expression Print.
It searches for a pattern (word or text) inside a file and prints the matching lines

## grep "error" app.log:-
This searches for the word error inside app.log.

## grep "error" test.log:-
Searching Text in a File,This means the line containing error is displayed.

## grep -i "error" test.log :-
Case-Insensitive Search,Use -i to ignore case.

## grep -n "error" test.log :-
Showing Line Numbers,display the line number where the match occurs.

## grep "error" *.log :-
Searching Multiple Files,grep can search multiple files at once.
Meaning:
- search the word error
- inside all .log files in the current directory.

## grep -r "error" :-
Recursive Search in Directories,You can search inside all files within a directory.

## grep -v "error" test.log:-
Invert Match (-v),The -v option displays lines that do NOT match the given pattern.
Meaning:
- display all lines
- except those containing the word error


## grep -c "error" test.log :-  Counting Matches (-c)
The -c option counts the number of matching lines.

## grep -w "error" test.log :-  Match Exact Words (-w)
The -w option searches for whole words only.With -w, it matches only:error

## grep -o "error" test.log :-  Show Only Matched Text (-o)
The -o option prints only the matched part of the line,Each occurrence of the word is displayed separately.

## grep -in "error" test.log :- Combining Options
Multiple options can be used together,This command searches for error ignoring case and shows the line numbers.

##  Using grep with Other Commands
grep is commonly combined with other Linux commands using a pipe (|).
Pipe sends the output of one command to another.

## ps aux | grep nginx :- Process Monitoring with ps for nginx

## ls -l | grep ".md" :- Filtering File Listings
Meaning:
- list all files
- display only .md files

## grep --color "error" test.log :- Highlighting Matches
Matches will appear highlighted in the terminal, making logs easier to read.

## grep "Failed password" /var/log/auth.log :- 
Meaning:
- search system authentication logs
- display failed login attempts
- This is commonly used for security monitoring.

## tail -f app.log | grep "ERROR" :- Live Log Monitoring
grep can be used with tail to watch logs in real time.


## Key Commands Summary

| Command | Purpose |
|-------|--------|
| `grep "error" file` | search text in a file |
| `grep -i "error" file` | ignore case while searching |
| `grep -n "error" file` | show line numbers of matches |
| `grep "error" *.log` | search in multiple `.log` files |
| `grep -r "error" .` | recursive search in a directory |
| `grep -v "error" file` | exclude lines containing "error" |
| `grep -c "error" file` | count how many lines contain "error" |
| `grep -w "error" file` | match the exact word "error" |
| `grep -o "error" file` | show only the matched word |
| `grep -in "error" file` | ignore case and show line numbers |
| `grep "ERROR" app.log` | search errors in logs |
| `ps aux \| grep nginx` | check if nginx process is running |
| `ls -l \| grep ".md"` | filter markdown files |
| `grep --color "error" file` | highlight matched text |
| `tail -f app.log \| grep "ERROR"` | monitor logs in real time |