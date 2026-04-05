/*🔴 Q1. Daily Job Posting Trend
👉 Find number of jobs posted per day in 2023.
⚠️ Condition:
Ignore time (use casting)*/   

SELECT
    job_posted_date:: DATE,
    count(*)
FROM
    job_postings_fact
GROUP BY
    job_posted_date:: DATE 
Order BY
    COUNT(*)  DESC;    