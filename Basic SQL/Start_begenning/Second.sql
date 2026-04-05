/* 
In the job postings fact table get the columns
job_id, job_title_short, job_location, and job via columns.
And order it in ascending order by job location.
*/
select 
    job_id,
    job_title_short,
    job_location, 
    job_via
from    
    job_postings_fact
order by
    job_location
    
    
    