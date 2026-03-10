##  Objective
Understand how to use the find command to locate files and directories in Linux/macOS based on different conditions such as name, type, size, time, and ownership.

The find command is one of the most powerful Linux tools used by DevOps engineers for troubleshooting, automation, and system maintenance.

# What is the find Command?
find is used to search for files and directories recursively inside a specified location.
- Basic Syntax :- find <search-path> <condition>

## find ~ -name notes.md :-
Searching for a File by Name,If the file exists, find prints its full path.
- ex:-/Users/abhishekm/Devops/git-basics/Devops-Journey/Day20-Linuxfile-hierarchy/Linuxfile-hierarchy-notes.md

## find . -name "*.md" :-  
Searching Inside Current Directory,means anything before .md.
- ex:-Linuxfile-hierarchy-notes.md

## find . -type f:-
Finding Only Files,This lists all files inside the directory.

## find . -type d :-
Finding Only Directories

##  find . -name "notes.md" :-  Case-Insensitive Search

## find <directory> -size <condition>:-
Finding Files by Size

- find . -size +10M :- Find files larger than 10MB
- find . -size -1M :- Find files smaller than 1MB
- find . -size 1M :- Find files exactly 1MB

## find <directory> -mtime <condition>:-
 Finding Files by Modification Time,The -mtime option searches files based on last modification time.

- find . -mtime -1:-Find files modified within the last 1 day
- find . -mtime +7:-Find files modified more than 7 days ago

## find . -empty:-
Finding Empty Files and Directories

## find <directory> -user <username>:-
Finding Files by Owner,The -user option searches files owned by a specific user.

- find /home -user devops:-Find all files owned by the devops user.

## find . -type f -name "*.md":-
Combining Conditions,Multiple conditions can be used together.

## find <directory> <condition> -exec <command> {} \;:-
 Executing Commands on Found Files (-exec),The -exec option allows running a command on each file that find locates.
- ex :- find . -name "*.md" -exec ls -l {} \;
- finds all markdown files
- runs ls -l on each file
- displays detailed file information

## find . -name "*.sh" -exec chmod +x {} \; :-
Changing File Permissions
Example: make all shell scripts executable.

## find . -name "*.log" -delete :-
Deleting Files Using find,finds all .log files,deletes them permanently

## find . -type f -name "*.log" -mtime +7 :-
find allows multiple conditions together,search only files,log files,modified more than 7 days ago

## find /var/log -name "*.log" -mtime +30 -delete :-
automatically remove old logs,prevent disk space issues


