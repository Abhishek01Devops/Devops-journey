
### chmod
    - Used to change file permissions
    - chmod +x makes a script executable
    - Command spelling must be exact

 ### Permission examples
    - 755 → executable scripts
    - 644 → config/secret files

### Day 2 Summary – Linux Permissions

- `rwx` defines who can read, write, and execute a file  
- `permission denied` occurs when execute permission is missing  
- `chmod +x` makes a script executable  
- Numeric permissions:
    - 755 → executable scripts (rwx r-x r-x)
    - 644 → config/secret files (rw- r-- r--)
- `ls -l` is used to view permissions and ownership
- Permissions are critical in DevOps for running scripts, CI/CD jobs, and protecting secrets

### Shell scripting note
    - Shell scripts execute commands line by line
    - Plain text must be printed using echo
    - Invalid commands cause script failure

<!-- Day 2 notes completed -->
