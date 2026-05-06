

# 1️⃣ What is a Pull Request (PR)?

A Pull Request (PR) is a way to:

👉 Propose changes from one branch to another  
👉 Get code reviewed before merging  

---

## Simple Meaning:

👉 “I made changes in my branch, please review and merge into main”

---

# 2️⃣ Why Pull Requests are Important

- Code review (team checks your work)
- Avoid breaking production
- Collaboration between developers
- Maintain clean and stable codebase

---

# 3️⃣ Basic PR Workflow (Real Industry Flow)

text main branch (stable code)         ↑    Pull Request         ↑ feature branch (your changes) 

---

# 4️⃣ Step-by-Step Practical Workflow

## 🔹 Step 1: Create Feature Branch

bash git switch -c feature-practice 

---

## 🔹 Step 2: Make Changes

bash echo "PR practice" > pr.txt git add . git commit -m "added PR practice file" 

---

## 🔹 Step 3: Push Branch to GitHub

bash git push origin feature-practice 

👉 This creates branch on GitHub

---

## 🔹 Step 4: Create Pull Request (GitHub UI)

Go to GitHub → your repo

👉 Click:
“Compare & pull request”

---

## 🔹 Step 5: Add PR Details

- Title: “Add PR practice file”
- Description:
text Added pr.txt file for learning pull request workflow 

👉 Click: Create Pull Request

---

## 🔹 Step 6: Review & Merge

Options:

- Merge commit
- Squash & merge
- Rebase & merge

👉 Click:
Merge Pull Request → Confirm

---

## 🔹 Step 7: Delete Branch (Optional)

bash git branch -d feature-practice git push origin --delete feature-practice 

---

# 5️⃣ Types of Merge in PR

## 1. Merge Commit

text Creates a new merge commit 

✔ Keeps full history  
❌ History becomes complex  

---

## 2. Squash Merge

text All commits → 1 single commit 

✔ Clean history  
✔ Most commonly used  

---

## 3. Rebase Merge

text Rewrites history (linear) 

✔ Clean and linear  
❌ Changes commit IDs  

---

# 6️⃣ PR vs Direct Push

| Direct Push | Pull Request |
|------------|-------------|
| Fast | Safe |
| No review | Code reviewed |
| Risky | Stable |
| Not used in teams | Used in companies |

---

# 7️⃣ Real DevOps Scenario

👉 Developer creates feature branch  
👉 Pushes code  
👉 Creates PR  
👉 Reviewer checks:
- Code quality
- Security issues
- Performance  

👉 Approved → merged to main  
👉 CI/CD pipeline runs  

---

# 8️⃣ Important Commands Summary

bash # create branch git switch -c feature-pr  # push branch git push origin feature-pr  # delete branch git branch -d feature-pr git push origin --delete feature-pr 

---

# 9️⃣ Best Practices

- Always use feature branches
- Keep PR small (easy to review)
- Write clear commit messages
- Add proper description
- Never push directly to main

---

# 🔟 Common Mistakes

❌ Working directly on main  
❌ Big PRs (hard to review)  
❌ No description  
❌ Not testing before PR  

---

# 🧠 Key Understanding

👉 PR is NOT a Git command  
👉 It is a GitHub feature for collaboration

---

# 📈 Confidence Check

If you understand:

✔ Branch → Commit → Push → PR → Merge  
✔ Types of merge  
✔ Why PR is used  

👉 You are now industry-ready for Git workflow

---

