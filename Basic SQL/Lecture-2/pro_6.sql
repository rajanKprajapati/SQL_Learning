SELECT 
   job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM 
    job_postings_fact
WHERE 
    (
      (salary_year_avg > 100000 AND job_title_short='Data Analyst')OR
      (salary_year_avg > 70000 AND job_title_short='Business Analyst')
    ) and job_location in ('Boston, MA','Anywhere')
ORDER BY
    job_id 



    
    
    