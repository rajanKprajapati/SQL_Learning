🔟 Your Mistakes (and Fixes)
❌ Mistake 1:
Using multi-row subquery in scalar place
✔️ Fix → use correlated subquery or remove GROUP BY

❌ Mistake 2:
Using CASE in WHERE
✔️ Fix → use direct condition

❌ Mistake 3:
Using skills as label
✔️ Fix → create type column

❌ Mistake 4:
Returning extra columns
✔️ Fix → match SELECT with question
🧠 FINAL THINKING FRAMEWORK (VERY IMPORTANT)
Whenever you solve SQL:
Step 1:
👉 What does question ask?
Rows?
Jobs?
Skills?
Step 2:

👉 What columns should I SELECT?
Step 3:
👉 How to filter?
WHERE / subquery

Step 4:
👉 Do I need labeling?
YES → CASE / 'text' AS type
NO → simple SELECT
🚀 ONE-LINE MASTER RULE

👉 “SELECT decides output, WHERE filters data, CASE explains logic”
