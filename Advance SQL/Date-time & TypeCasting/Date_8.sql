/*🔴 Q6. Convert Job Time to IST
👉 Convert job_posted_date into Asia/Kolkata timezone
⚠️ Use:
AT TIME ZONE*/
SELECT
    job_id,
    job_posted_date no_change,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'Asia/Kolkata' After_change
FROM
    job_postings_fact
