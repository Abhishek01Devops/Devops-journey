### Objective
Learn how to use the **sed command** to replace text in files from the command line.

---

### What is sed?
`sed` stands for **Stream Editor**.

It processes text line by line and allows automated editing of file content.

Unlike editors such as `nano` or `vim`, `sed` performs **non-interactive text editing** directly from the terminal.

---

### Basic Syntax
sed ‘command’ filename

### Replace First Occurrence in a Line
sed ‘s/error/warning/’ test.log

Explanation

| Part | Meaning |
|-----|-----|
| `s` | substitution command |
| `error` | text to search |
| `warning` | replacement text |
| `test.log` | file being processed |

---

Only the **first occurrence in each line** is replaced.

---

### Replace All Occurrences (g flag)

To replace every occurrence in a line:
sed ‘s/error/warning/g’ test.log

The **g flag means global replacement**.

---

### Important Note
By default, `sed` **does not modify the original file**.
It only prints the modified output in the terminal.
To confirm
cat test.log

The file will still contain the original text.

---

### Commands Practiced

| Command | Purpose |
|--------|--------|
| `sed 's/error/warning/' file` | replace first occurrence |
| `sed 's/error/warning/g' file` | replace all occurrences |

---


### Case-Insensitive Replacement

Sometimes logs contain different text cases such as:
ERROR  
Error  
error  
To ignore case while replacing text, use the **I flag**.
Command :- sed ‘s/error/warning/I’ test.log

The **I flag makes the search case-insensitive**.

---

### Edit File Directly (-i)
# sed -i ‘’ ‘s/error/warning/g’ test.log
By default, `sed` only prints changes in the terminal.
To modify the actual file, use the **-i option**.

Explanation

| Part | Meaning |
|-----|-----|
| -i | edit file in place |
| '' | required for macOS sed |
| g | replace all matche

### Print Specific Lines
# sed -n ‘2p’ test.log
You can print specific lines using the **-n option**.
Print line 2

# sed -n ‘1,3p’ test.log
Print lines 1 to 3

Explanation

| Part | Meaning |
|-----|-----|
| -n | suppress automatic output |
| p | print selected lines |

---

### Delete Lines
# sed ‘2d’ test.log
`sed` can delete lines from the output.
Delete line 2

# sed ‘2,4d’ test.log
Delete lines 2 to 4