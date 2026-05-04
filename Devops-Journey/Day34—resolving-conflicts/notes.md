 Day 34 — Resolving Git Conflicts (Full Notes)

 1. What is a Merge Conflict?

A merge conflict happens when Git cannot automatically decide how to combine changes from two branches.

 This occurs when:
- Same file is changed in both branches
- Same file is created in both branches
- One branch deletes a file, another modifies it

---

#  2. Types of Conflicts

## Content Conflict
Same file, different changes

Example:
bash main → "Hello from main" feature → "Hello from feature" 

Git shows:
text <<<<<<< HEAD Hello from main ======= Hello from feature >>>>>>> feature 

---

##  Add/Add Conflict
Same file created in both branches

Example:
bash main → file.txt created feature → file.txt created 

 Git doesn’t know which one to keep

---

## Delete/Modify Conflict
One branch deletes, other modifies

---

# 3. How Conflict Looks

text <<<<<<< HEAD (main branch content) ======= (feature branch content) >>>>>>> branch-name 

| Marker | Meaning |
|------|--------|
| <<<<<<< HEAD | Current branch |
| ======= | Separator |
| >>>>>>> branch | Incoming branch |

---

# 4. Steps to Resolve Conflict

## Step 1: Open file
bash nano file.txt 

## Step 2: Remove markers
Delete:
<<<<<<< ======= >>>>>>>

## Step 3: Choose final content
Example:
text Final combined content 

## Step 4: Mark as resolved
bash git add file.txt 

## Step 5: Complete merge
bash git commit -m "resolved conflict" 

---

# 5. Full Workflow

bash git merge feature-branch # conflict happens  nano file.txt # edit file  git add file.txt git commit -m "resolved conflict" 

---

#  6. Git Graph Understanding

Before merge:
main      A---B feature       C

After merge:
main      A---B------M              \      / feature       C----

👉 M = merge commit (has 2 parents)

---

# 7. Important Concepts

## 🔹 git add during conflict
👉 Means:
"I have resolved the conflict"

---

## 🔹 git commit after conflict
👉 Completes the merge

---

## 🔹 git status
Shows:
bash unmerged paths → conflict exists clean → resolved 

---

# ⚠️ 8. Common Mistakes

❌ Opening wrong file path  
❌ Not removing conflict markers  
❌ Forgetting git add  
❌ Trying merge again before resolving  

---

# 🔥 9. Add/Add Conflict Example

bash # feature branch echo "Initial content" > file.txt  # main branch echo "File content" > file.txt 

Merge result:
text <<<<<<< HEAD File content ======= Initial content >>>>>>> feature 

---

