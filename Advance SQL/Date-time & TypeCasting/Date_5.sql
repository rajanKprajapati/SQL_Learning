/*🔴 Q3. Jobs Posted in Last 7 Days
👉 Get all jobs posted in the last 7 days from current time
⚠️ Use:
NOW()
INTERVAL*/
-- SELECT
-- job_posted_date,
--     job_title
-- from
--     job_postings_fact
-- WHERE
--     job_posted_date BETWEEN  now() -INTERVAL '7 days'And NOW();   

SELECT
    job_posted_date,
    job_title
FROM
    job_postings_fact
WHERE
    job_posted_date >= NOW() - INTERVAL '7 days'
ORDER BY
    job_posted_date DESC;