# Introduction
This project analyzes job postings to identify **top-paying Data Analyst roles**, **in-demand skills**, and **optimal skills for career growth**. Using SQL, the project explores salary trends, skill demand, and the relationship between technical expertise and compensation.

### 🎯 Goals of the Project:

- Identify which skills are most valuable 💰  
- Understand which skills are most in demand 📈  
- Learn how to choose the best skills for career growth 🚀

SQL queries?: check them out here:[project_sql folder](/Project_sql/)
# Background
With the rapid growth of data-driven industries, the role of a **Data Analyst** has evolved beyond basic reporting. Companies now expect analysts to possess both **analytical and technical skills**.

### ❓ Why This Project Matters:

- Uses **real-world job data**  
- Helps identify **market trends**  
- Provides **career guidance** for students and professionals

Data hails from [SQL DATA](https://lukeb.co/sql_jobs_db), It's packeed with insights on job titlea,salaries,locations and and essential skills.

# Tools I Used
## 🛠️ 3. Tools I Used

- **SQL** → Data extraction, joins, and aggregations  
- **PostgreSQL (or similar database)** → Query execution  
- **Visual Studio Code (VS Code)** → Writing and managing SQL queries  
- **Git & GitHub** → Version control and project hosting  
- **CSV Files** → Storing query outputs  
- **Data Visualization (PNG / Python / Excel)** → Creating charts and graphical insights(Excel not used yet but use in ferther)
# The Analysis

## 1: Top Paying Jobs

- Identified top 10 highest-paying remote Data Analyst jobs
- Used JOIN to combine company data

Filtered:
- Remote jobs (job_location = 'Anywhere')
Non-null salaries

👉 Insight:
- High-paying roles are often senior-level positions.

QUERY:
```sql
SELECT
    j.job_id,
    j.job_title,
    j.job_location,
    j.job_schedule_type,
    j.salary_year_avg,
    j.job_posted_date,
    c.name AS company_name
FROM
    job_postings_fact j 
LEFT JOIN 
    company_dim c
ON j.company_id=c.company_id      
WHERE
    j.job_title_short='Data Analyst'
    AND
    j.job_location='Anywhere'
    AND 
    salary_year_avg is NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10; 
```
#### Visual:
<img src="assets/query1_jobs.png" width="600"/>

## 2: Skills Required for Top Paying Jobs

- Used CTE to first get top-paying jobs
- Then joined with skills tables

👉 Key Findings:

- SQL → 7 times ⭐
- Python → 6 times ⭐
- R → 3 times
- Go → 2 times

👉 Insight:
Core data skills dominate even in high-paying roles.
QUERY:
```sql
WITH top_paying_jobs AS(
SELECT
    j.job_id,
    j.job_title,
    j.salary_year_avg,
    c.name AS company_name
FROM
    job_postings_fact j 
LEFT JOIN 
    company_dim c
ON j.company_id=c.company_id      
WHERE
    job_title_short='Data Analyst'
    AND
    job_location='Anywhere'
    AND 
    salary_year_avg is NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;

)

SELECT 
    top_paying_jobs.*,
    Skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
ORDER BY salary_year_avg DESC;
```

##  3: Most In-Demand Skills

- Counted frequency of skills across all job postings

👉 Insight:
- SQL and Python are the most demanded
These are must-have skills for entry

QUERY:
```sql
SELECT 
    skills,
    count(skills_job_dim.job_id) as demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE
    job_title_short='Data Analyst'
    AND job_work_from_home=TRUE
GROUP BY
    skills
ORDER BY
    2 DESC
limit 5;
```
## 🔹 Query 4: Top Paying Skills
- Calculated average salary per skill

👉 Top Skills:
- Swift, Golang, Scala, C

👉 Insight:

- Engineering and backend skills pay more
Shows shift toward hybrid roles

QUERY:
```sql
SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS AVG_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE
    job_title_short='Data Analyst' AND 
    salary_year_avg is not null
    AND job_work_from_home=TRUE
GROUP BY
    skills
ORDER BY
    AVG_salary  DESC
limit 25;
```
##  Query 5: Optimal Skills (Demand + Salary)
- Combined demand and salary
Used aggregation + filtering (HAVING)

👉 Insight:

- Best skills are those with:
- High demand 📈
- High salary 💰
QUERY:
```sql
with skills_demand as (
    SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    count(skills_job_dim.job_id) as demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE
    job_title_short='Data Analyst' 
    AND salary_year_avg is not null
    AND job_work_from_home=TRUE
GROUP BY
    skills_dim.skill_id
),
average_salary as (
    SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    ROUND(AVG(salary_year_avg),0) AS AVG_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE
    job_title_short='Data Analyst' AND 
    salary_year_avg is not null
    AND job_work_from_home=TRUE
GROUP BY
    skills_dim.skill_id
)

select
    skills_demand.skill_id,
    skills_demand.skills,
    skills_demand.demand_count,
    average_salary.AVG_salary
from skills_demand 
INNER JOIN average_salary ON skills_demand.skill_id=average_salary.skill_id
WHERE
    demand_count>10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25; 
```
Or Rewite program to reduce the line of code:
```sql
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim 
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills_dim.skill_id,
    skills_dim.skills
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;
```

👉 Example:

Python → High demand + good salary
SQL → Very high demand (baseline skill)


# What I Learned
Through this project, I learned:
- How to use SQL joins (**INNER JOIN, LEFT JOIN**)
- Writing complex queries using **CTEs (Common Table Expressions)**
- Using **GROUP BY, HAVING, and aggregation functions**
- How to analyze **real-world datasets**
- Understanding **market trends using data**
- Converting raw data into **meaningful insights**
# Conclusions
The analysis shows that:

- Core skills (**SQL, Python, R**) are essential but not enough alone  
- High-paying roles require advanced technical skills like **Golang, Scala, and C**  
- The job market is shifting toward **Data Analyst + Engineering hybrid roles**  
- **SQL is a foundational skill**, required in almost every job  

### 🚀 Final Strategy:

👉 **Core Data Skills + Advanced Technical Skills**
