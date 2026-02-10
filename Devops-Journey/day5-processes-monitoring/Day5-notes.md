# Processes Monitoring

## What is a Process?
A process is a running program in memory
Every process has:
PID (Process ID)
Owner (user)
Parent process (PPID)
Priority

## ps : 
        Shows processes running only in your current terminal.

## ps -ef : 
            Lists all running processes in the system.
            -e - every process
            -f - full details (PID, PPID, user, command) 

## ps aux : 
            Shows all processes with CPU & memory usage.

## top : 
         Shows live process activity,Monitor CPU spikes,Detect hung or attacking processes

## jobs : 
          Shows background jobs started by you,To manage sleep, scripts, or long commands.

## bg : 
           Resumes job in background,Continue work without blocking terminal

## fg : 
         Interact with process again

## pkill sleep : 
                 Kills all running processes whose name is sleep


### Process types
- Foreground: blocks terminal
- Background: runs with &

### Core commands
- ps -ef → list processes
- top → live monitoring
- jobs → shell jobs

### Job control
- Ctrl + Z → suspend
- bg → resume in background
- fg → resume in foreground

### Signals
- kill PID → graceful stop
- kill -9 PID → force stop
- pkill name → kill by name

### DevOps use case
- Stop hung deployments
- Monitor CPU/memory usage
- Kill misbehaving services safely
