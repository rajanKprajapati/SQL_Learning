/* 
Practice Problem 1
Question:
Get the unique (distinct) job locations in the job 
postings fact table. Order in alphabetical order 
(ascending order).company_dim

*/
select distinct 
    job_location
from 
    job_postings_fact
order by
     job_location; 
     
     --this is the way of writing data in assending order
     
