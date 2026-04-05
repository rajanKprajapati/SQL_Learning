<<<<<<<<<<<<<<<<<<<<<ONE SHORT>>>>>>>>>>>>>>>>>>>>>
🧠 ✅ UNION (ONE-SHOT)
👉 UNION is used to combine results of multiple SELECT queries into one result set.

🔹 Key Points
✔ Combines rows (vertical merge)
✔ Removes duplicate rows
✔ Requires same number & type of columns

🔹 UNION ALL
👉 Same as UNION but keeps duplicates (faster)

🔹 Important Rules
✔ Column order must be same
✔ Data types must match
✔ Final column names come from first query

🔹 Example Idea
👉 Combine 2022 + 2023 jobs into one result

🔥 FINAL LINE
👉 UNION merges query results and removes duplicates, while UNION ALL keeps all rows 💯
<<<<<<<<<<<<<<COMPLETE EXPLAINTION>>>>>>>>>>>>>>>>>>>


🧠 🔴 1. What is UNION?
👉 UNION is used to combine results of two or more SELECT queries
👉 Think:
UNION = merge rows of multiple queries into one result

🔴 2. Basic Syntax
SELECT column1, column2 FROM table1
UNION
SELECT column1, column2 FROM table2;
🔍 How it works:
First SELECT runs
Second SELECT runs
Results are combined
Duplicate rows are removed automatically
🔴 3. Example (Clear Understanding)
Tables:
employees_2022
name	dept
A	IT
B	HR

employees_2023
name	dept
B	HR
C	IT
Query:
SELECT name, dept FROM employees_2022
UNION
SELECT name, dept FROM employees_2023;
🔍 Output:
name	dept
A	IT
B	HR
C	IT
👉 Duplicate (B, HR) removed automatically ✅

🔴 4. UNION ALL (Important 🔥)
👉 UNION ALL keeps duplicates
SELECT name, dept FROM employees_2022
UNION ALL
SELECT name, dept FROM employees_2023;
🔍 Output:
name	dept
A	IT
B	HR
B	HR
C	IT
👉 Duplicate kept ❗

🔴 5. Key Difference
Feature	UNION	UNION ALL
Removes duplicates	✅ Yes	❌ No
Speed	Slower	Faster
Use case	Unique data	All data

🔴 6. Rules of UNION (VERY IMPORTANT)
✔ Same number of columns
✔ Same order of columns
✔ Data types must be compatible
❌ Wrong Example:
SELECT name FROM employees
UNION
SELECT dept, salary FROM employees;
👉 Error ❌ (columns mismatch)

🔴 7. Column Names Rule
👉 Final output column names come from first SELECT
SELECT name AS emp_name FROM employees_2022
UNION
SELECT name FROM employees_2023;
👉 Output column name = emp_name

🔴 8. UNION with WHERE (Real Use)
SELECT name FROM employees_2022 WHERE dept = 'IT'
UNION
SELECT name FROM employees_2023 WHERE dept = 'IT';
👉 Combine IT employees from both years

🔴 9. UNION with ORDER BY
SELECT name FROM employees_2022
UNION
SELECT name FROM employees_2023
ORDER BY name;
👉 ORDER BY applies to final result only

🔴 10. Real Example (Job Database 🔥)
SELECT job_title, job_location
FROM job_postings_fact
WHERE EXTRACT(YEAR FROM job_posted_date) = 2022

UNION
SELECT job_title, job_location
FROM job_postings_fact
WHERE EXTRACT(YEAR FROM job_posted_date) = 2023;
🔍 Explanation:
First → fetch 2022 jobs
Second → fetch 2023 jobs
UNION → combine both
Duplicate jobs removed

🔴 11. When to Use UNION?
👉 Use when:
Combine data from multiple tables
Combine filtered results
Remove duplicates automatically
🔥 FINAL DEEP UNDERSTANDING
👉 UNION stacks results vertically (row-wise) and removes duplicates, while UNION ALL keeps all rows.
⚡ ONE-LINE MASTERY
👉 UNION = combine results of multiple queries into one unique result set