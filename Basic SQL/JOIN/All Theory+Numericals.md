1. What is JOIN in SQL
.....................................................................
FROM table1
JOIN table2
ON table1.column = table2.column
.....................................................................

A JOIN is used to combine rows from two or more tables based on a related column.

In real databases, data is stored in multiple tables to avoid duplication.

Example tables:

Customers Table
customer_id	name	city
1	Raj	Delhi
2	Amit	Mumbai
3	Sara	Pune
Orders Table
order_id	customer_id	amount
101	1	500
102	2	800
103	1	200

If you want:

Customer name + order amount

You must join both tables.

SELECT customers.name, orders.amount
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id;

..............................................................................
LEFT JOIN Rule
Return ALL rows from the LEFT table

Left table = employees

Even if there is no matching department, the employee will still appear.

Example departments table:

dept_id	dept_name
101	HR
102	IT

Result will include all employees.

4️⃣ Fourth Line (Most Important)
ON e.dept_id = d.dept_id

This line tells SQL how the two tables are connected.

Meaning

Match rows where:

employees.dept_id = departments.dept_id

In simple words:

Employee department id = Department table department id

This is the joining condition.


SELECT → What to show
FROM → First table
JOIN → Second table
ON → How tables are connected
..............................................................................
Result

name	amount
Raj	500
Amit	800
Raj	200
2. Types of JOINs

There are 4 main joins.

1️⃣ INNER JOIN
2️⃣ LEFT JOIN
3️⃣ RIGHT JOIN
4️⃣ FULL JOIN

3. INNER JOIN

Returns only matching rows from both tables.

Diagram concept:

Table A ∩ Table B

Example

Employees

id	name	dept_id
1	Raj	10
2	Amit	20
3	Sara	30

Departments

dept_id	dept_name
10	HR
20	IT

Query

SELECT e.name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

Result

name	dept_name
Raj	HR
Amit	IT

Sara is removed because dept_id 30 not present.

4. LEFT JOIN

Returns:

all rows from left table

matching rows from right table

if no match → NULL

All A + matching B

Query

SELECT e.name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

Result

name	dept_name
Raj	HR
Amit	IT
Sara	NULL
5. RIGHT JOIN

Opposite of LEFT JOIN.

Returns:

all rows from right table

matching rows from left table

SELECT e.name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;
6. FULL JOIN

Returns all rows from both tables.

If match exists → combine
If not → NULL

A + B
SELECT *
FROM employees
FULL JOIN departments
ON employees.dept_id = departments.dept_id;

(Not supported in MySQL directly.)

7. CROSS JOIN

Produces Cartesian product.

Every row of table A combines with every row of table B.

SELECT *
FROM A
CROSS JOIN B;

If

A = 3 rows
B = 4 rows

Result = 12 rows

8. SELF JOIN

Joining a table with itself.

Example: employee and manager.

SELECT a.name AS employee,
       b.name AS manager
FROM employees a
JOIN employees b
ON a.manager_id = b.id;
9. Important JOIN Concepts
1️⃣ Table Alias (AS)
SELECT e.name
FROM employees AS e
JOIN departments AS d
ON e.dept_id = d.dept_id;

Used to shorten query.

2️⃣ Multiple Joins
SELECT o.order_id, c.name, p.product_name
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
JOIN products p
ON o.product_id = p.product_id;
3️⃣ JOIN + WHERE
SELECT c.name, o.amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.amount > 500;

Uses comparison operators.

4️⃣ JOIN + Aggregation
SELECT c.name, SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.name;
5️⃣ JOIN + Wildcards
SELECT c.name
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE c.name LIKE 'R%';
...................................................................
Other LIKE patterns
Pattern	Meaning
'R%'	start with R
'%R'	end with R
'%R%'	contains R
'R__'	exactly 3 letters starting with R
...................................................................
6️⃣ JOIN + NULL
SELECT c.name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

Finds customers with no orders.


10 SQL JOIN Practice Questions

1️⃣ Companies offering high salary jobs
Write a query to find company names and job titles where the average yearly salary is greater than 100000.

Requirements:
Join job_postings_fact and company_dim

Show
company_name, job_title, salary_year_avg
Sort by salary descending
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
SELECT name, salary
FROM employees
ORDER BY salary DESC
LIMIT 5;

✅ Tip (important for interviews):
Order	                    Keyword
Ascending (1 → 10, A → Z)	ASC
Descending (10 → 1, Z → A)	DESC
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
2️⃣ Top companies hiring for most jobs
Find top 5 companies that posted the highest number of jobs in 2023.

Requirements:
Join company_dim and job_postings_fact

Show
company_name, total_jobs

Use GROUP BY
Sort descending

3️⃣ Remote jobs with skills
Find job titles and required skills for jobs that are work from home.

Requirements:
Join
job_postings_fact
skills_job_dim
skills_dim

Display:
job_title
skills

4️⃣ Most demanded skills
Find the top 10 most required skills across all jobs.

Requirements:
Join
skills_job_dim
skills_dim

Display:
skill
number_of_jobs

Use
COUNT()
GROUP BY
ORDER BY

5️⃣ Average salary by skill
Find the average yearly salary for each skill.

Requirements:
Join
job_postings_fact
skills_job_dim
skills_dim

Display
skill
avg_salary
Sort by highest salary skills

6️⃣ Jobs posted by each company
Find how many jobs each company posted.

Requirements:
Join
company_dim
job_postings_fact

Display
company_name
job_count
Only show companies with more than 10 jobs.
(Hint: use HAVING)

7️⃣ Highest paying job with company name
Find the highest paying job in the dataset.

Requirements:
Join
job_postings_fact
company_dim

Display
company_name
job_title
salary_year_avg

8️⃣ Skills required for Data Analyst jobs
Find skills required for jobs with title containing 'Data Analyst'.

Requirements:
Join
job_postings_fact
skills_job_dim
skills_dim
Use
LIKE '%Data Analyst%'

Display
job_title
skill

9️⃣ Companies hiring remote jobs
Find companies offering remote jobs with salary greater than 80000.

Requirements
Join
job_postings_fact
company_dim

Display
company_name
job_title
salary_year_avg
Filter
job_work_from_home = TRUE

🔟 Job with maximum number of skills
Find jobs that require the highest number of skills.

Requirements:
Join
job_postings_fact
skills_job_dim

Display
job_title
number_of_skills
Sort by highest skill count

✅ These questions train:
Multi-table joins
Aggregations
Analytical thinking
Real Data Analyst SQL interview problems




[def]: <Screenshot 2026-04-05 184353.png>