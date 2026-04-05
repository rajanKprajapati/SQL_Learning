
/*6.
Find jobs where salary is:
above avg of country
and below max of company
💡 Hint:
Two subqueries:
avg salary by job_country
max salary by company_id*/

-- How to Choose the Best Approach
-- ✅ 1. If you are in Interview → Choose CLARITY

-- 👉 Best choice:
-- CTE + Window Function
-- ✔️ Easy to explain
-- ✔️ Shows advanced knowledge
-- ✔️ Cleaner logic

SELECT    j.company_id,j.job_title,j.job_country,a.Avg_country_salary,b.max_salary_of_com
FROM
    job_postings_fact j
 join (
    select job_country,avg(salary_year_avg) as AVG_country_salary
    FROM job_postings_fact 
    where salary_year_avg is not NULL 
    GROUP BY job_country) a
on j.job_country=a.job_country
join (
    select company_id,max(salary_year_avg) as max_salary_of_com
    FROM job_postings_fact 
    where salary_year_avg is not NULL 
    GROUP BY company_id) b
on j.company_id=b.company_id 
WHERE
    salary_year_avg> a.Avg_country_salary
    AND salary_year_avg<b.max_salary_of_com
ORDER BY company_id ASC 

/*SELECT *
FROM (
    SELECT
        company_id,
        job_title,
        job_country,
        salary_year_avg,
        AVG(salary_year_avg) OVER (PARTITION BY job_country) AS avg_country_salary,
        MAX(salary_year_avg) OVER (PARTITION BY company_id) AS max_company_salary
    FROM job_postings_fact
    WHERE salary_year_avg IS NOT NULL
) t
WHERE 
    salary_year_avg > avg_country_salary
    AND salary_year_avg < max_company_salary
ORDER BY company_id;*/

