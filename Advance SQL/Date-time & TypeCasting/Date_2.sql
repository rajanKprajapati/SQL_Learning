SELECT
    COUNT(job_id),
    EXTRACT(MONTH from job_posted_date) AS Month
FROM 
    job_postings_fact
GROUP BY
    EXTRACT(MONTH from job_posted_date)
    