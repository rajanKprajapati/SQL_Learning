/*
1️⃣ Companies offering high salary jobs
Write a query to find company names and job titles
where the average yearly salary is greater than 100000.

Requirements:
Join job_postings_fact and company_dim

Show
company_name, job_title, salary_year_avg
Sort by salary descending
*/
SELECT
    cd.name AS company_name,
    jpf.job_title AS job_title,
    AVG(jpf.salary_year_avg) AS salary_year_avg
FROM
    job_postings_fact AS jpf
JOIN 
    company_dim AS cd
    ON jpf.company_id = cd.company_id
GROUP BY
    cd.name, jpf.job_title
HAVING 
    AVG(jpf.salary_year_avg) > 100000
ORDER BY
    salary_year_avg DESC;

/*The keyword average automatically implies
aggregation. In SQL, whenever we calculate an 
aggregate like AVG(), SUM(), COUNT(), etc., 
we usually need GROUP BY and sometimes HAVING.*/

-- If question contains words like,average,
-- total,count,maximum,minimum
-- Then think:
-- AGGREGATE FUNCTION
-- + GROUP BY<<<<<<<<<<<<v.v.imp>>>> 
-- + HAVING
/*WHERE-> cannot use aggregate functions.*/

/*4️⃣ Simple Rule to Remember
. SELECT 
1. FROM
2. WHERE   → filter rows
3. GROUP BY → make groups
4. HAVING  → filter groups
5. ORDER BY

✅ One line summary
GROUP BY → makes groups
HAVING → filters those groups*/

    
    
    
    