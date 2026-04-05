<<<<<<<<<<<<<<<<<<<<<<<<ONE SHORT>>>>>>>>>>>>>>>>>>>>>>>>
🧠 ✅ SUBQUERY COMPLETE SHORT NOTES
👉 A Subquery is a query inside another query used to get data for the main query.

🔹 Basic Types
Single-row (Scalar) → returns one value
👉 salary > (SELECT AVG(salary) FROM employees)
Multi-row (IN / NOT IN)
👉 IN → matches any value
👉 NOT IN → excludes values
ANY / ALL
👉 ANY → greater than at least one value
👉 ALL → greater than all values

🔹 Subquery in Different Clauses
SELECT → return computed value
👉 (SELECT COUNT(*) FROM employees)
WHERE → filter rows
👉 compare with subquery result
FROM (Derived Table)
👉 subquery acts like a temporary table

🔹 Special Types
Correlated Subquery 🔥
👉 Runs for each row of outer query
👉 Used for row-wise comparison
EXISTS / NOT EXISTS
👉 Checks if subquery returns any row
👉 EXISTS → true if data exists
👉 NOT EXISTS → true if no data

🔹 Use in Operations
INSERT → insert filtered data
UPDATE → update based on condition
DELETE → delete based on subquery

🔹 Important Rules
✔ Always inside ( )
✔ Can return single or multiple values
✔ Types:

Non-correlated → runs once
Correlated → runs per row

🔹 Quick Use Table
Clause	Purpose
SELECT	computed value
WHERE	filtering
FROM	temporary table
EXISTS	check existence
ANY/ALL	compare multiple values
Correlated	row-wise logic

🔥 FINAL MASTER LINE
👉 Subquery is a query inside another query used to filter, compare, or generate data, and it can run once or for each row depending on type.
<<<<<<<<<<<<<<<<Complete Explaination>>>>>>>>>>>>>>>>>>>>

🔷 1. Subquery in SELECT clause
Used to return a single value for each row
SELECT name,
       (SELECT AVG(salary) FROM employees) AS avg_salary
FROM employees;
👉 Here subquery runs once and shows average salary for every row.

🔷 2. Subquery in WHERE clause (MOST COMMON)
✅ (a) Single-row subquery
Returns one value
SELECT name
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
👉 Finds employees earning more than average.

✅ (b) Multi-row subquery using IN
SELECT name
FROM employees
WHERE department_id IN (SELECT department_id FROM departments WHERE location = 'Delhi');

✅ (c) Using NOT IN
SELECT name
FROM employees
WHERE department_id NOT IN (SELECT department_id FROM departments);

✅ (d) Using ANY
SELECT name
FROM employees
WHERE salary > ANY (SELECT salary FROM employees WHERE department_id = 2);
👉 Greater than at least one value

✅ (e) Using ALL
SELECT name
FROM employees
WHERE salary > ALL (SELECT salary FROM employees WHERE department_id = 2);
👉 Greater than all values

🔷 3. Subquery in FROM clause (Derived Table)
SELECT dept_id, avg_sal
FROM (
    SELECT department_id AS dept_id, AVG(salary) AS avg_sal
    FROM employees
    GROUP BY department_id
) AS dept_avg;
👉 Treat subquery as a table

🔷 4. Correlated Subquery (IMPORTANT 🔥)
👉 Runs once for each row of outer query
SELECT name
FROM employees e1
WHERE salary > (
    SELECT AVG(salary)
    FROM employees e2
    WHERE e1.department_id = e2.department_id
);
👉 Finds employees earning more than their department average

🔷 5. EXISTS Subquery
👉 Checks if subquery returns any row
SELECT name
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM departments d
    WHERE e.department_id = d.department_id
);

🔷 6. NOT EXISTS
SELECT name
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM departments d
    WHERE e.department_id = d.department_id
);

🔷 7. Subquery in INSERT
INSERT INTO high_salary_employees
SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

🔷 8. Subquery in UPDATE
UPDATE employees
SET salary = salary + 1000
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location = 'Delhi'
);

🔷 9. Subquery in DELETE
DELETE FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location = 'Delhi'
);

🔷 10. Scalar Subquery (Single Value)
SELECT (SELECT COUNT(*) FROM employees) AS total_employees;

🔥 Important Tips
✔ Subquery must be inside parentheses
✔ Can return:
    • Single value 
    • Multiple rows 
    • Multiple columns 
✔ Types:
    • Non-correlated (runs once) 
    • Correlated (runs per row) 

🚀 Quick Summary Table
Type	Use
SELECT	Add computed column
WHERE	Filtering
FROM	Temporary table
EXISTS	Check existence
ANY/ALL	Compare multiple values
Correlated	Row-wise logic