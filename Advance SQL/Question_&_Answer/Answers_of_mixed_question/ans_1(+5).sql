/*1.
Find jobs where:
salary is above company average
OR job is remote
Use UNION and label results as 'HIGH_PAY' or 'REMOTE'.
💡 Hint:
Use subquery to get avg salary per company_id
First query → high salary
Second → job_work_from_home = 1
Add label using SELECT 'HIGH_PAY' AS type*/


SELECT * from skills_dim;