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
INNER JOIN skills_job_dim
ON top_paying_jobs.job_id=skills_job_dim.job_id
INNER JOIN skills_dim
ON skills_job_dim.skill_id=skills_dim.skill_id
ORDER BY salary_year_avg DESC


