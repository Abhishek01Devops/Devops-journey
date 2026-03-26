# Day 27 — Bash Scripting Intro

### What is Bash Scripting?
Bash scripting is used to automate Linux commands by writing them in a file and executing them.

---

### Step 1 — Create Directory
mkdir day27-bash-scripting-intro
cd day27-bash-scripting-intro

---

### Step 2 — Create Script File
touch hello.sh

---

### Step 3 — Add Script Content
nano hello.sh

#!/bin/bash

echo "Hello DevOps"
echo "This is my first script"

---

### Step 4 — Make Script Executable
chmod +x hello.sh

---

### Step 5 — Run Script
./hello.sh

Output:
Hello DevOps
This is my first script

---

### Shebang
#!/bin/bash
Defines which shell should execute the script.

---

### echo Command
Used to print text to terminal.

Example:
echo "Hello"

---

### chmod +x
Adds execute permission to script.

---

### Running Script
./scriptname.sh

---

### Extended Script Example
#!/bin/bash

echo "Hello DevOps"
echo "My name is Abhishek"
echo "Today date is:"
date
echo "Current user:"
whoami

---

### Expected Output
Hello DevOps
My name is Abhishek
Today date is: <current date>
Current user: <username>

---

### What is a Variable?
A variable stores a value that can be reused in a script.

Example:
name="Abhishek"

---

### Basic Variable Example
#!/bin/bash

name="Abhishek"
role="DevOps Engineer"

echo "My name is $name"
echo "I am learning $role"

---

### Rules for Variables
- No space before or after =
Correct:
name="Abhishek"

Wrong:
name = "Abhishek"

- Use $ to access variable
echo $name

---

### User Input Variables
#!/bin/bash

echo "Enter your name:"
read name

echo "Enter your city:"
read city

echo "Hello $name"
echo "You are from $city"

---

### Example Output
Enter your name:
Abhishek
Enter your city:
Bangalore
Hello Abhishek
You are from Bangalore

---

### System Variables
#!/bin/bash

echo "User: $USER"
echo "Home: $HOME"
echo "Shell: $SHELL"

---

### Useful System Variables
$USER  -> current username
$HOME  -> home directory
$SHELL -> current shell
$PWD   -> present working directory

---

### Combined Example
#!/bin/bash

echo "Enter your name:"
read name

echo "Welcome $name"
echo "Current user: $USER"
echo "Home directory: $HOME"
echo "Today's date:"
date

---

### What is If Condition?
If condition allows script to make decisions.

Example:
If number is 10 → print message

---

### Basic Syntax
#!/bin/bash

if [ condition ]
then
  command
fi

---

### Example 1 — Simple If
#!/bin/bash

num=10

if [ $num -eq 10 ]
then
  echo "Number is 10"
fi

---

### Comparison Operators

-eq  -> equal  
-ne  -> not equal  
-gt  -> greater than  
-lt  -> less than  
-ge  -> greater or equal  
-le  -> less or equal  

---

### Example 2 — If Else
#!/bin/bash

num=5

if [ $num -gt 10 ]
then
  echo "Number is greater than 10"
else
  echo "Number is less than or equal to 10"
fi

---

### Example 3 — User Input Condition
#!/bin/bash

echo "Enter a number:"
read num

if [ $num -gt 50 ]
then
  echo "Big number"
else
  echo "Small number"
fi

---

### File Check Example
#!/bin/bash

file="test.txt"

if [ -f $file ]
then
  echo "File exists"
else
  echo "File not found"
fi

---

### File Condition Options

-f  -> file exists  
-d  -> directory exists  
-e  -> exists  
-r  -> readable  
-w  -> writable  
-x  -> executable  

---

### Directory Check Example
#!/bin/bash

if [ -d /etc ]
then
  echo "Directory exists"
else
  echo "Directory not found"
fi

---

### String Comparison Example
#!/bin/bash

echo "Enter username:"
read user

if [ "$user" = "root" ]
then
  echo "You are admin"
else
  echo "Normal user"
fi

---

### Important Rules
- spaces required inside brackets
- always close with fi
- use quotes for string comparison

Correct:
if [ $num -eq 10 ]

Wrong:
if [$num -eq 10]

---

### Key Points
- if used for decision making
- supports numeric comparison
- supports file checks
- supports string comparison
- used heavily in DevOps automation