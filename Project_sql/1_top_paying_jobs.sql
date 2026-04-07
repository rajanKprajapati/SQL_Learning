-- This is the QUERY-1
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
-- for update