/*🔴 Q4. Month-wise Average Salary
👉 Find average salary per month
⚠️ Use:
EXTRACT(MONTH)
Ignore NULL salaries*/

SELECT
    Avg(salary_year_avg),
    EXTRACT(MONTH From job_posted_date::DATE) As month_
From
    job_postings_fact
Where
    salary_year_avg is not NULL
GROUP BY
    EXTRACT(MONTH From job_posted_date::DATE);

/*We can write this program like this*/
-- SELECT
--     EXTRACT(MONTH FROM job_posted_date) AS month_,
--     ROUND(AVG(salary_year_avg), 2) AS avg_salary
-- FROM
--     job_postings_fact
-- WHERE
--     salary_year_avg IS NOT NULL
-- GROUP BY
--     1
-- ORDER BY
--     1;