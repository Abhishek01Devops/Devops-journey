Environment variables are key-value pairs used by the operating system and applications to store configuration values.
ex:- 
- PORT=3000
- DATABASE_URL=mysql://db
- ENV=production
Instead of hardcoding configuration inside applications, we store them in environment variables.

# printenv :- 
These commands show all environment variables available in the shell.

# echo :- 
To Check a Specific Variable

Variable           |              Meaning
- HOME             |         User home directory
- USER             |          Current username
- PATH             |         Executable search paths
- SHELL            |           Default shell
- PWD              |         Current working directory

# export PROJECT=devops :- 
 Create Temporary Environment Variable
 ⚠️ Temporary variables disappear when the terminal closes.

 # unset PROJECT :-
 Removing an Environment Variable
 Verify: echo $PROJECT
 No value will be returned.

# Permanent Environment Variables
Temporary variables disappear when the terminal closes.
To make them permanent, add them to the shell configuration file.

# Important Commands
printenv
env
echo $VARIABLE
export VARIABLE=value
unset VARIABLE
nano ~/.bashrc
source ~/.bashrc

# Summary
- Environment variables store configuration for the system and applications.
- printenv and env display variables.
- export creates a variable.
- unset removes a variable.
- Permanent variables are added to ~/.bashrc.
- Widely used in DevOps for configuring applications, services, and infrastructure.

