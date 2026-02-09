# Day 3 – Linux Users, Groups & Security (DevOps Basics)

## Ownership in Linux
Every file has:
- **Owner (user)**
- **Group**
- **Others**

Check ownership:
```bash
ls -l
#example :  
  -rw------- 1 abhishekm staff secret.env

#File Permissions :
                    r → read
                    w → write
                    x → execute
#Permission format:
                   -rwxr-xr--  user group others

#chmod (Permission Control) : 
                              chmod 600 secret.env   # secure secrets
                              chmod 755 script.sh   # executable scripts
                              chmod -x app.log      # remove execute permission

# Why Permission Denied Happens?
Execute permission missing
Wrong file owner
Script is not executable
# Examples :
             bash : ./deploy.sh
             output : permission denied
             bash : chmod +x deploy.sh #now this will have permission to execute.

## Security Scenario – Secret Protection
  Creating a secret : echo "DB_PASSWORD=supersecret123" > secret.env
  chmod 600 secret.env #secure it
  ## now only owner can read the file





