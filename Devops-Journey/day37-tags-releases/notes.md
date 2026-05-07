# Day37 — Advanced Git Tags & Releases Notes

---

# 🎯 Goal

Practice advanced Git versioning workflow:

- Checkout old versions
- Compare releases
- Create hotfix releases
- Delete/recreate tags
- Understand rollback process
- Learn real DevOps release flow

---

# 🧠 What is a Tag?

A tag is:
👉 A permanent label attached to a specific commit.

Used for:
- Releases
- Stable versions
- Rollbacks
- Deployments

---

# 🏷️ Types of Tags

## 1️⃣ Lightweight Tag

Simple pointer to commit.

bash git tag v1.0 

---

## 2️⃣ Annotated Tag

Stores:
- Tagger name
- Date
- Message

bash git tag -a v2.0 -m "major release" 

Industry standard ✅

---

# 🚀 Viewing Tags

## List all tags
bash git tag 

---

## Show tag details
bash git show v2.0 

---

# 🚀 Pushing Tags

## Push all tags
bash git push origin --tags 

---

## Push single tag
bash git push origin v2.0 

---

# 🧠 Important Understanding

Commits and tags are different:

text Commit → code snapshot Tag → version label Release → published version 

---

# 🚀 PRACTICE 1 — Checkout Old Version

## Command
bash git checkout v1.0 

---

## Verify
bash cat app.txt 

Output:
text Version 1 App 

---

# ⚠ Detached HEAD State

When checking out a tag:

text You are not on a branch You are viewing old snapshot only 

---

## Return to main
bash git switch main 

---

# 🚀 PRACTICE 2 — Compare Versions

## Compare tags
bash git diff v1.0 v2.0 

---

## Purpose
Shows:
- Added lines
- Removed lines
- Version differences

---

# 🚀 PRACTICE 3 — Hotfix Release Workflow

## Real Scenario
Production bug found in:
text v2.0 

Need urgent fix.

---

## Step 1 — Update app
bash echo "Hotfix applied" >> app.txt 

---

## Step 2 — Commit
bash git add .  git commit -m "hotfix for production issue" 

---

## Step 3 — Create hotfix tag
bash git tag -a v2.1 -m "production hotfix release" 

---

## Step 4 — Push
bash git push  git push origin v2.1 

---

# 🧠 Industry Versioning Example

text v1.0 → first release v1.1 → small fixes v2.0 → major release v2.1 → production hotfix 

---

# 🚀 PRACTICE 4 — Delete Local Tag

## Delete tag locally
bash git tag -d v1.0 

---

## Verify
bash git tag 

---

# ⚠ Important

Only local tag deleted.

GitHub still has remote tag.

---

# 🚀 PRACTICE 5 — Delete Remote Tag

## Delete from GitHub
bash git push origin --delete v1.0 

---

# 🧠 Real Usage

Used when:
- Wrong release published
- Wrong version tagged
- Need cleanup

---

# 🚀 PRACTICE 6 — Recreate Tag

## Recreate deleted tag
bash git tag -a v1.0 -m "recreated version" 

---

## Push again
bash git push origin v1.0 

---

# 🚀 PRACTICE 7 — View Tags in Log

## Command
bash git log --oneline --decorate 

---

## Example
text abc123 (tag: v2.0) def456 (tag: v1.1) 

---

# 🚀 PRACTICE 8 — Rollback Understanding

## Real Scenario
Production issue after:
text v2.1 

Need rollback.

---

## Rollback to stable release
bash git checkout v2.0 

OR deployment pipeline deploys:
text v2.0 

---

# 🧠 Why Tags Are Important

Without tags:

❌ Hard to identify stable versions  
❌ Hard to rollback  
❌ Hard to deploy exact release  

---

# 🔥 Real DevOps Release Flow

text Developer commits code         ↓ Stable version identified         ↓ Tag created         ↓ Release published         ↓ CI/CD deploys tagged version 

---

# ⚔ Tag vs Branch

| Tag | Branch |
|---|---|
| Fixed point | Moving pointer |
| Used for releases | Used for development |
| Usually permanent | Continuously changes |

---

# 🎯 Important Interview Questions

## Q1: What is a Git tag?
A permanent label attached to a specific commit, usually for versioning/releases.

---

## Q2: Difference between lightweight and annotated tag?

| Lightweight | Annotated |
|---|---|
| Simple pointer | Stores metadata |
| No message | Has message/date |
| Less used | Industry standard |

---

## Q3: Are tags pushed automatically?

❌ No

Need:
bash git push origin --tags 

---

# 🚀 Final Understanding

text Commit → Snapshot Tag → Version Label Release → Published Version 

---
