/*🔴 Q5. Jobs Posted Today (Timezone Safe)
👉 Get jobs posted today (based on system timezone)
⚠️ Must handle:
TIMESTAMP vs DATE issue*/
SELECT 
    job_title,
    CURRENT_DATE AS Today 
FROM 
    job_postings_fact
WHERE
    job_posted_date::Date = CURRENT_DATE;    

/*
same Answer can be written as:
SELECT 
    job_title,
    job_posted_date
FROM 
    job_postings_fact
WHERE
    job_posted_date >= CURRENT_DATE
    AND job_posted_date < CURRENT_DATE + INTERVAL '1 day';*/        
