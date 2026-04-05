SELECT 
    job_title_short as title,
    job_location As location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EAST' as Date ,
    -- Two time 'AT TIME ZONE' is use due to the job_posted_date have
    --  not the "time zone" so first detect the current 
    -- 'time zone' and the convert the time zone with the help of 'AT TIME ZONE' 
    -- thIS IS THE LINK OF THE ALL time Zone :https://www.postgresql.org/docs/7.2/timezones.html
    EXTRACT(MONTH FROM job_posted_date) As Month,
    EXTRACT(SECOND FROM job_posted_date) As minute
FROM job_postings_fact
Limit 5;   