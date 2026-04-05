/*Find job postings where only one salary value is present.
Meaning:
salary_year_avg is NULL but salary_hour_avg is NOT NULL
OR
salary_hour_avg is NULL but salary_year_avg is NOT NULL
Return:
job_id
job_title
salary_year_avg
salary_hour_avg
Concept tested:
Logical conditions with NULL
*/
SELECT 
    job_id, 
    job_title, 
    salary_year_avg, 
    salary_hour_avg
FROM 
    job_postings_fact
WHERE 
    ((salary_year_avg IS NULL) AND (salary_hour_avg IS NOT NULL))
    OR 
    ((salary_hour_avg IS NULL) AND (salary_year_avg IS NOT NULL)) 
    
ORDER BY 
    job_title;