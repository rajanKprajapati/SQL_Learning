/*In the job postings fact table get 
the columns job_id, job_title_short, job_location,
job via, and salary_year_avg
columns. And only look at rows where job title_short is
'Data Engineer'
*/ 
select
    job_id,
    job_title_short,
    job_location, 
    job_via,
    salary_year_avg 
from 
    job_postings_fact
where 
    job_title_short='Data Engineer'
    
