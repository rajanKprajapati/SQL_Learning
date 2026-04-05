🧠 Section 1: UNION + SUBQUERY + CASE
1.
Find jobs where:
salary is above company average
OR job is remote
Use UNION and label results as 'HIGH_PAY' or 'REMOTE'.
💡 Hint:
Use subquery to get avg salary per company_id
First query → high salary
Second → job_work_from_home = 1
Add label using SELECT 'HIGH_PAY' AS type

2.
Get companies that:
posted jobs in 2023
OR have jobs requiring no degree
Use UNION and classify using CASE.
💡 Hint:
Use EXTRACT(YEAR FROM job_posted_date)
Join with company_dim
Use CASE WHEN job_no_degree_mention = 1

3.
Find jobs that:
require Python skill
OR have salary > overall average salary
Use subquery + UNION.
💡 Hint:
Join skills_dim + skills_job_dim
Subquery for avg salary
Use skills = 'Python'

4.
Return job titles where:
salary > average salary of that job title
Use correlated subquery + classify as 'HIGH' or 'LOW'.
💡 Hint:
Correlated subquery with job_title
Compare each row’s salary with avg of same title

5.
List companies where:
total jobs > average jobs per company
Use subquery + CASE.
💡 Hint:
First count jobs per company
Then compare with overall avg using subquery
Use GROUP BY company_id



🔥 Section 2: Nested Subqueries + CASE

6.
Find jobs where salary is:
above avg of country
and below max of company
💡 Hint:
Two subqueries:
avg salary by job_country
max salary by company_id

7.
Classify jobs:
HIGH if salary > 75th percentile
MEDIUM if between avg and 75th
LOW otherwise
💡 Hint:
Use PERCENTILE_CONT(0.75) (if supported)
Else simulate using ranking

8.
Find companies where:
at least 2 jobs require same skill
💡 Hint:
Join skills_job_dim
GROUP BY company_id, skill_id
Use HAVING COUNT(job_id) >= 2

9.
Find jobs that:
have more skills than average skills per job
💡 Hint:
Count skills per job
Compare with overall avg using subquery

10.
Return jobs where:
salary is greater than ALL jobs in same location
💡 Hint:
Use > ALL (subquery)
Filter by same job_location



⚡ Section 3: UNION with Complex Filters

11.
Combine:
Remote jobs
High salary jobs (> avg)
Remove duplicates and label source.
💡 Hint:
Use UNION (not UNION ALL)
Add label column manually

12.
Union jobs:
posted in January
posted in February
Add column 'MONTH_TYPE'.
💡 Hint:
Use EXTRACT(MONTH)
Label 'JAN', 'FEB'

13.
Union:
companies with >5 jobs
companies with avg salary > overall avg
💡 Hint:
First query → count jobs
Second → avg salary
Combine using UNION

14.
Find jobs:
with health insurance
without health insurance
Use UNION and CASE.
💡 Hint:
job_health_insurance = 1 / 0
Label 'INSURED', 'NOT_INSURED'

15.
Union:
jobs requiring degree
jobs NOT requiring degree
💡 Hint:
Use job_no_degree_mention
Invert logic carefully



🧩 Section 4: CASE + Aggregation + Subquery

16.
For each company:
classify as 'HIGH_PAYING' if avg salary > overall avg
💡 Hint:
Subquery → overall avg
Compare with AVG(salary_year_avg)

17.
Count jobs per company:
classify companies into SMALL, MEDIUM, LARGE
💡 Hint:
Use CASE WHEN COUNT(*) ranges
Example: <5, 5–10, >10

18.
For each job:
classify salary vs company avg
💡 Hint:
Correlated subquery using company_id

19.
Find companies where:
max salary > 2× avg salary
💡 Hint:
Use HAVING MAX(salary) > 2 * AVG(salary)

20.
Classify jobs:
REMOTE_HIGH
REMOTE_LOW
ONSITE_HIGH
ONSITE_LOW
💡 Hint:
Combine 2 conditions inside CASE
job_work_from_home + salary comparison



🚀 Section 5: Skills + Advanced Joins

21.
Find jobs requiring more skills than average job skills
💡 Hint:
Count skills per job
Compare with avg

22.
Find most common skill per company
💡 Hint:
Count skill frequency per company
Use ORDER BY COUNT DESC LIMIT 1 (or window function)

23.
Find jobs where:
skill count > avg skill count of that company
💡 Hint:
Nested aggregation needed
First avg per company, then compare

24.
List companies where:
all jobs require at least 1 skill
💡 Hint:
Use NOT EXISTS
Check jobs with zero skills

25.
Find skills that:
appear in more jobs than average skill frequency
💡 Hint:
Count jobs per skill
Compare with avg count



🧨 Section 6: Ultra Hard

26.
Find jobs where:
salary > avg salary of jobs having same skill
💡 Hint:
Join skills → group by skill
Compare per job

27.
Find companies where:
avg salary of remote jobs > avg salary of onsite jobs
💡 Hint:
Use CASE inside AVG
OR separate subqueries

28.
Return jobs where:
salary is in top 3 per company
💡 Hint:
Use RANK() or DENSE_RANK() partition by company

29.
Find jobs that:
share at least one skill with highest paying job
💡 Hint:
First find highest salary job
Get its skills
Match using IN

30.
Find companies where:
no job has salary below company avg
💡 Hint:
Use NOT EXISTS
Compare each job with company avg