SELECT *
from 
    job_postings_fact
GROUP BY
    EXTRACT(MONTH from job_posted_date)
    