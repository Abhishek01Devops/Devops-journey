# Day 4 – sudo, Processes & Security

## sudo
- sudo gives temporary root privileges
- All sudo actions are logged
- Executes a command as root
- Requires user password
- Used for system-level operations

“Executing secrets with sudo is dangerous because attackers can inject commands into files that run as root. Best practice is 600 permissions and never using sudo on non-script files.”

“Privilege escalation happens when a normal user gains root access through misconfigured permissions or sudo. DevOps prevents it using least privilege, strict file ownership, and non-executable secrets.”

## sudo -l : 
- Lists what commands the current user can run with sudo
- Prevents users from running unrestricted root commands

### Processes
  ## sleep 300 & : 
- runs process in background
- & sends job to background

  ## View running processes
  ps aux : lists running processes
           Monitoring applications
           Debugging stuck or high-CPU processes

  ## Killing a process
    ## kill <PID>  (cmd) :
                          - kill stops processes

   ## Force kill: kill -9 <PID> :
                                 - Stopping misbehaving services

## Security Lessons
- Secrets must have 600 permission
- Executable secrets are dangerous
- sudo misuse can lead to full system compromise

## DevOps Practice
- Least privilege principle
- Secure permissions
- Monitor and control processes

