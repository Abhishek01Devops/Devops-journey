

# 1️⃣ Understanding git log

## What is git log?

git log shows the history of commits in your repository.

### Command:
bash git log 

### Output includes:
- Commit ID (SHA)
- Author
- Date
- Commit message

---

## Simplified View:

bash git log --oneline 

Example:
c65cc17 bug introduced 597809a log v3 b4550f4 log v2

---

## Graph View (Best for visualization):

bash git log --oneline --graph --decorate 

---

# 2️⃣ Understanding Changes with git log -p

## Command:
bash git log -p 

👉 Shows what changed in each commit

---

## Example Output:

diff +BUG 

### Meaning:
- + → line added
- - → line removed

---

## Interpretation:

diff -ERROR +SUCCESS 

👉 Means:
- ERROR was removed
- SUCCESS was added

---

# 3️⃣ Understanding git blame

## Command:
bash git blame file.txt 

👉 Shows:
- Who wrote each line
- Which commit added it
- When it was added

---

## Example:

c65cc17 BUG

👉 Means:
- Line "BUG" was added in commit c65cc17

---

# 4️⃣ Finding Bugs (Manual Method)

## Steps:

1. View commit history:
bash git log --oneline 

2. Check changes:
bash git log -p 

3. Identify suspicious commit

4. Use blame:
bash git blame file.txt 

---

# 5️⃣ Undo Changes using git revert

## Command:
bash git revert <commit-id> 

👉 Creates a new commit that undoes changes

---

## Example:

bash git revert c65cc17 

👉 Result:
- BUG removed
- New commit created:
Revert "bug introduced"

---

## Important:

- Does NOT delete history
- Safe for shared branches

---

# 6️⃣ Powerful Debugging with git bisect

## What is git bisect?

👉 Finds the commit that introduced a bug using binary search

---

## Steps:

### 1. Start:
bash git bisect start 

### 2. Mark current as bad:
bash git bisect bad 

### 3. Mark known good commit:
bash git bisect good <commit-id> 

---

## 4. Git checks middle commit

You test manually:

bash cat file.txt 

---

### If bug exists:
bash git bisect bad 

### If no bug:
bash git bisect good 

---

## 5. Repeat until result:

text <commit-id> is the first bad commit 

---

## 6. Exit bisect:
bash git bisect reset 

---

# ⚠️ Important Rules for Bisect

| State | Meaning |
|------|--------|
| GOOD | No bug present |
| BAD | Bug present |

---

## Example from practice:

- GOOD → 597809a
- BAD → c65cc17

Final result:
c65cc17 is the first bad commit

---

# 🧠 Key Concepts Summary

- git log → history
- git log -p → changes
- git blame → who changed line
- git revert → undo safely
- git bisect → find bug automatically

---

# 📌 Real DevOps Use Case

- Debug production issues
- Track breaking changes
- Identify faulty deployments
- Audit code changes

---

# 🔥 Final Understanding

diff -old +new 

👉 Means:
- old line removed
- new line added

---

