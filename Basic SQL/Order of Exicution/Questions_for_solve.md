Below are 25 well-thought questions based on SQL execution order and clause behavior in SQL.

I organized them to make revision effective:

1️⃣ Execution Order
2️⃣ Error Detection
3️⃣ Result Prediction
4️⃣ Query Writing (blank for you to solve)

For each solved question I show:

Query
Execution Order
Explanation
1️⃣ Execution Order Questions (Concept Understanding)
Q1

Query

SELECT name
FROM employees
WHERE salary > 50000;

Execution Order
FROM → WHERE → SELECT

Explanation
Load table employees
Filter rows where salary > 50000
Display name

Q2
SELECT name
FROM employees
ORDER BY name;

Execution Order
FROM → SELECT → ORDER BY

Explanation
Rows are selected first, then sorted.

Q3
SELECT dept_id, COUNT(*)
FROM employees
GROUP BY dept_id;

Execution Order
FROM → GROUP BY → SELECT

Explanation
Rows are grouped first, then COUNT(*) is calculated.

Q4
SELECT dept_id, COUNT(*)
FROM employees
GROUP BY dept_id
HAVING COUNT(*) > 3;

Execution Order
FROM → GROUP BY → HAVING → SELECT

Explanation
Groups are created, then filtered.

Q5
SELECT DISTINCT dept_id
FROM employees;

Execution Order
FROM → SELECT → DISTINCT

Explanation
Columns are selected first, duplicates removed afterward.

2️⃣ Error Identification Questions
Q6
SELECT name
FROM employees
WHERE COUNT(*) > 2;#Error

Problem
Aggregate function used in WHERE.

Correct Query
SELECT name
FROM employees
GROUP BY name
HAVING COUNT(*) > 2;

Execution Order
FROM → GROUP BY → HAVING → SELECT

Q7
SELECT salary * 12 AS yearly_salary
FROM employees
WHERE yearly_salary > 50000;

Problem
Alias used in WHERE.

Reason
WHERE runs before SELECT

Correct Approach
Use a subquery or repeat expression.

Q8
SELECT dept_id, COUNT(*)
FROM employees
HAVING COUNT(*) > 2;

Problem
HAVING used without grouping.<<<<<<<<<<<>>>>>>>>>>>

Correct Query
SELECT dept_id, COUNT(*)
FROM employees
GROUP BY dept_id
HAVING COUNT(*) > 2;


Q9
SELECT name
FROM employees
GROUP BY dept_id;

Problem
name not included in GROUP BY or    aggregate.

Q10
SELECT COUNT(*)
FROM employees
ORDER BY name;

Problem
Cannot sort by column not present after aggregation.

3️⃣ Result Prediction Questions
Table
employees

id | name  | dept
1  | Raj   | IT
2  | Aman  | HR
3  | Priya | IT
4  | Neha  | HR

Q11
SELECT dept
FROM employees;

Result
IT
HR
IT
HR

Q12
SELECT DISTINCT dept
FROM employees;

Result
IT
HR

Q13
SELECT dept, COUNT(*)
FROM employees
GROUP BY dept;

Result
IT   2
HR   2

Q14
SELECT name
FROM employees
ORDER BY name;

Result
Aman
Neha
Priya
Raj

Q15
SELECT dept, COUNT(*)
FROM employees
GROUP BY dept
HAVING COUNT(*) > 1;

Result
IT   2
HR   2
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
1️⃣ The Query
SELECT dept, COUNT(*)
FROM employees
GROUP BY dept
HAVING COUNT(*) > 1;
2️⃣ Step 1: FROM employees

We are using the employees table.

Suppose it has these columns: emp_id, name, dept, salary.

Sample data:

emp_id	name	dept	salary
1	Rajan	HR	50000
2	Ankit	IT	60000
3	Riya	HR	55000
4	Neha	Finance	52000
5	Arjun	IT	62000
3️⃣ Step 2: GROUP BY dept

Purpose: Combine rows that have the same dept value into one group.

After grouping:

dept	Rows in Group
HR	1, 3
IT	2, 5
Finance	4
4️⃣ Step 3: COUNT(*)

COUNT(*) counts all rows in each group.

Result after counting:

dept	COUNT(*)
HR	2
IT	2
Finance	1

✅ Now we know how many employees are in each department.

5️⃣ Step 4: HAVING COUNT(*) > 1

HAVING filters groups (not rows).

Only keeps groups where COUNT(*) > 1, i.e., departments with more than 1 employee.

Result:

dept	COUNT(*)
HR	2
IT	2

Finance is excluded because it has only 1 employee.

6️⃣ Why HAVING is used instead of WHERE

WHERE filters rows before grouping, so it cannot filter aggregate results.

HAVING filters after grouping, which is perfect for conditions like COUNT(*) > 1.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

4️⃣ Query Writing Practice (Solve Yourself)
Q16

Write a query to show:
department
number of employees in each department

Your Query:
_______________________
Q17
Write a query to display unique departments.

Your Query:
________________________
Q18
Write a query to:
show employee names
sort them alphabetically

Your Query:
________________________
Q19
Write a query to show:
department
number of employees
only departments with more than 2 employees

Your Query:
________________________
Q20
Write a query to display first 5 employees sorted by name.

Your Query:
________________________


5️⃣ Tricky Execution Order Questions
Q21
SELECT name, COUNT(*)
FROM employees
GROUP BY name
ORDER BY COUNT(*) DESC;

Execution Order
FROM → GROUP BY → SELECT → ORDER BY


Q22
SELECT DISTINCT dept
FROM employees
ORDER BY dept;

Execution Order
FROM → SELECT → DISTINCT → ORDER BY


Q23
SELECT dept, COUNT(*)
FROM employees
WHERE salary > 50000
GROUP BY dept;

Execution Order
FROM → WHERE → GROUP BY → SELECT


Q24
SELECT name
FROM employees
LIMIT 5;

Execution Order
FROM → SELECT → LIMIT


Q25
SELECT dept, COUNT(*)
FROM employees
GROUP BY dept
HAVING COUNT(*) > 2
ORDER BY COUNT(*) DESC;

Execution Order
FROM → GROUP BY → HAVING → SELECT → ORDER BY
