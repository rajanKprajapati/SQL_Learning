-- -- whar are the top skills based on salary for my role?

-- SELECT 
--     -- job_title_short,
--     skills,
--     AVG(salary_year_avg)
-- FROM job_postings_fact
-- INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
-- INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
-- WHERE 
--     salary_year_avg IS NOT NULL 
--     -- AND
--     -- job_title_short='Data Analyst'
-- ORDER BY salary_year_avg DESC
-- -- LIMIT 10;


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
limit 25
/*
The analysis of top-paying skills for Data Analyst roles reveals a clear trend: higher salaries are strongly linked to technical depth and specialization. While core skills like Python, R, and SQL remain essential for entering and sustaining a career in data analytics, they are no longer sufficient to command top salaries on their own.

High-paying roles increasingly demand engineering-oriented skills such as Golang, Scala, and C, indicating a shift toward hybrid roles that combine data analysis with data engineering capabilities. Additionally, niche and less common skills like Swift and Pascal offer higher salaries due to limited talent supply, though they may come with fewer job opportunities.

Overall, the data suggests that professionals who expand beyond traditional analytics skills into programming, system design, or specialized technologies are more likely to achieve higher earning potential. Therefore, a strategic combination of core data skills + advanced technical expertise is key to standing out in the job market.*/

-- Result OUTPUT of the above sql query in the form of json 

/*
[
  {
    "skills": "swift",
    "avg_salary": "153750"
  },
  {
    "skills": "golang",
    "avg_salary": "145000"
  },
  {
    "skills": "shell",
    "avg_salary": "125000"
  },
  {
    "skills": "scala",
    "avg_salary": "117379"
  },
  {
    "skills": "go",
    "avg_salary": "116147"
  },
  {
    "skills": "crystal",
    "avg_salary": "114000"
  },
  {
    "skills": "c",
    "avg_salary": "109816"
  },
  {
    "skills": "r",
    "avg_salary": "103431"
  },
  {
    "skills": "python",
    "avg_salary": "102992"
  },
  {
    "skills": "nosql",
    "avg_salary": "102865"
  },
  {
    "skills": "javascript",
    "avg_salary": "102604"
  },
  {
    "skills": "sas",
    "avg_salary": "102161"
  },
  {
    "skills": "c++",
    "avg_salary": "101917"
  },
  {
    "skills": "t-sql",
    "avg_salary": "101214"
  },
  {
    "skills": "java",
    "avg_salary": "99881"
  },
  {
    "skills": "matlab",
    "avg_salary": "99000"
  },
  {
    "skills": "sql",
    "avg_salary": "98269"
  },
  {
    "skills": "rust",
    "avg_salary": "97500"
  },
  {
    "skills": "php",
    "avg_salary": "95000"
  },
  {
    "skills": "bash",
    "avg_salary": "93950"
  },
  {
    "skills": "pascal",
    "avg_salary": "92000"
  },
  {
    "skills": "powershell",
    "avg_salary": "90500"
  },
  {
    "skills": "html",
    "avg_salary": "90000"
  },
  {
    "skills": "vb.net",
    "avg_salary": "90000"
  },
  {
    "skills": "vba",
    "avg_salary": "88015"
  }
]
*/