/*🔴 Q7. Jobs Older Than 6 Months
👉 Find jobs older than 6 months from today
⚠️ Use:
INTERVAL*/


/*Due to my databse is from 2023 and I am using 'CURRENT_DATE' so it got job_title
but according to the question and my 2023 databse the Answer should not come so:
WE WRITE ALTERNATIVE PROGRAM:*/
SELECT
    job_title,
    job_posted_date
FROM
    job_postings_fact
WHERE
    job_posted_date < Date '2023-12-31' - INTERVAL '6 months'; 


-- SELECT
--     job_title,
--     job_posted_date
-- FROM
--     job_postings_fact
-- WHERE
--     EXTRACT(YEAR FROM job_posted_date)= EXTRACT(YEAR FROM CURRENT_DATE)
--     AND job_posted_date::Date< CURRENT_DATE - INTERVAL '6 months';        


-- “Yes, date comparison in SQL works like numeric comparison
--  because dates are internally ordered. Earlier dates are
--   smaller and later dates are larger, so operators
-- like < and > behave exactly like number comparisons.” 
-- SELECT TIMESTAMP '2023-01-01 10:00' < TIMESTAMP '2023-01-01 12:00';
-- 👉 Output:
-- true   