/*🔴 Q2. Peak Hiring Hour
👉 Find the hour of the day when most jobs are posted.
⚠️ Use:
EXTRACT(HOUR)
Grouping*/

SELECT
    EXTRACT(HOUR FROM job_posted_date) AS hour,
    COUNT(*) AS total_jobs
FROM
    job_postings_fact
GROUP BY
    hour
ORDER BY
    total_jobs DESC
LIMIT 1;