 # Day 32 — Git Branching Strategy

## What is Branching?
Branch = separate line of development.  
Used to work on features without affecting main code.  
Default branch = main.

---

## Standard Team Workflow
main → production  
develop → integration branch  
feature/* → new feature work  

Flow:
feature → develop → main

---

## Create Branch
git switch -c develop

Create feature branch:
git switch -c feature/login

---

## Check Branches
git branch

---

## Switch Branch
git switch main

---

## Merge Branch

Feature → develop
git switch develop
git merge feature/login

Develop → main
git switch main
git merge develop

---

## Push Branch
git push -u origin develop

---

## Merge Conflict
Occurs when same file edited in two branches.

Git shows:
<<<<<<< HEAD
code from current branch
=======
code from feature branch
>>>>>>> feature/login

Steps to resolve:
1. Open file
2. Remove markers
3. Keep correct content
4. Save file

Then:
git add .
git commit -m "resolve conflict"

---

## Conflict Resolution Workflow
1. Merge branch
2. Edit conflicting file
3. Remove markers
4. Save
5. git add .
6. git commit

---

## Restore Deleted File
git checkout HEAD1 -- filename

---

## .gitignore
Used to ignore files.

Example:
*.log
node_modules/

---

## Stop Tracking but Keep File
git rm --cached filename

---

## VI Editor Shortcuts

Delete line
dd

Undo
u

Save
:w

Save and exit
:wq

Exit without saving
:q!

---

## Full Workflow Practiced
create develop branch
create feature branch
commit in feature
merge feature → develop
resolve conflict
merge develop → main
push main

---

## Best Practices
- Never commit directly to main
- Use feature branches
- Merge feature into develop
- Merge develop into main
- Resolve conflicts carefully
- Push after merge

---

## Commands Summary
git switch -c branch-name
git branch
git switch branch-name
git merge branch-name
git push -u origin branch-name
git add .
git commit -m "message"
git checkout HEAD1 -- file
git rm --cached file

---

You completed:
✔ Branching  
✔ Feature workflow  
✔ Merge conflicts  
✔ Conflict resolution  
✔ .gitignore handling  
✔ File restore  
✔ vi basics