/*Find job postings where both salary fields are missing.
Return:
job_id
job_title
salary_year_avg
salary_hour_avg
Table: job_postings_fact
Concept tested:
Multiple NULL conditions
*/
SELECT 
    job_id, 
    job_title, 
    salary_year_avg, 
    salary_hour_avg 
FROM
    job_postings_fact
WHERE
    (salary_year_avg IS NULL) AND (salary_hour_avg is NULL)
    


