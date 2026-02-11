
##  find & grep

### find
- Used to search files and directories
- Common options:
  - -name, -iname
  - -type f (files)
  - -type d (directories)

## find . -name "*.log" : 
                          Find all .log files

## find . -name "error.log" : 
                              Find a specific file

## find . -iname "APP.LOG" : 
                             Case-insensitive search

## find . -type d : 
                    Find only directories

## find . -type f : 
                     Find only files


### grep
- Used to search text inside files
- Common options:
  - -i (ignore case)
  - -n (line number)

  ## grep "ERROR" logs/error.log : 
                                   Search for a word in a file

  ## grep "ERROR" logs/*.log : 
                                Search across all log files

  ## grep -i "error" logs/*.log : 
                                 Case-insensitive search 

  ## grep -n "ERROR" logs/error.log : 
                                       show line numbers

## Disk Cleanup & Outage Simulation

- Simulated disk-full using large log files
- Used df and du to identify disk usage
- Found root cause using du + sort
- Cleaned logs to recover disk space
- Learned real DevOps outage handling
- Used gzip and find for prevention



 ## df -h . : 
               It check disk space (system level) it shows total disk,used,available space.

 ## du -sh . : 
                Check the directory size.

 ## du -sh * | sort -h : 
                         Identify heavy folders in the directory in the human redable format.

 ## gzip logs/app1.log : 
                         It compresses the file app1.log to save disk space,gzip safely shrinks log files to save disk space and avoid outages.


## Log creation & simulation

 ## dd if=/dev/zero of=logs/app.log bs=1M count=50 : 
                                                     Created a 50mb log file.

