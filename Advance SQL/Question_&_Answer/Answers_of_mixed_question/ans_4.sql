/*4.
Return job titles where:
salary > average salary of that job title
Use correlated subquery + classify as 'HIGH' or 'LOW'.
💡 Hint:
Correlated subquery with job_title
Compare each row’s salary with avg of same title*/



SELECT
    j.job_title,
    case
        when  j.salary_year_avg> (select
            avg(salary_year_avg) AS avg_job_salary
            FROM job_postings_fact
            WHERE
            job_title=j.job_title AND 
            salary_year_avg is not NULL
            ) Then  'HIGH'
        when j.salary_year_avg< (select
            avg(salary_year_avg) AS avg_job_salary
            FROM job_postings_fact
            WHERE
            job_title=j.job_title AND 
            salary_year_avg is not NULL
            ) Then 'LOW'
        ELSE 'equal'
    End AS salary_category
from job_postings_fact j
  
WHERE
    salary_year_avg is not NULL
limit 100;





/*🔷 Correlated Subquery (Summary)

👉 A correlated subquery is a subquery that:

uses a column from the outer query
runs once for each row
🔥 Key Line (Important)
WHERE job_title = j.job_title

✔ Inner query depends on outer query → makes it correlated

⚙️ How it Executes
Outer query picks one row
Subquery runs using that row’s value
Result is compared (HIGH / LOW)
Repeat for every row 🔁
💡 Output Logic
Salary > average → HIGH
Salary < average → LOW
Equal → EQUAL
⚠️ Important Points
Runs many times (row by row)
Slower than normal subquery
Used when comparison is different for each row
🧠 One-Line Memory Trick

👉 “Uses outer column + runs per row = Correlated Subquery”
...........................................

🔥 1. First Identify the Pattern (Most Important)
Before writing query, ask:
👉 “Is comparison row-by-row or overall?”
Situation                      	Use
Compare with same row group  	Correlated subquery
Compare with full table once	Normal subquery
Need performance / ranking  	Window function
................................................*/;

