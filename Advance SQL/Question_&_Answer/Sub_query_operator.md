........................................
 Final One-Line Memory Trick
👉 IN → list matching
👉 ANY → one match enough
👉 ALL → all must match
👉 EXISTS → just check existence
........................................
🎯 Subquery Operators (or Multi-row Operators)
👉 They are used when a subquery returns multiple values (rows)

✅ 1. IN operator
🔹 Meaning:

👉 Checks if a value exists in a list

💻 Example:
SELECT *
FROM job_postings_fact
WHERE company_id IN (
    SELECT company_id
    FROM job_postings_fact
    WHERE job_location = 'Anywhere'
);

👉 Meaning:

Give me rows where company_id is in this list

🧠 Simple Thinking:

👉 IN = “Is this value present in the list?”

✅ 2. ANY operator
🔹 Meaning:

👉 Condition should be true for at least ONE value

💻 Example:
SELECT *
FROM job_postings_fact
WHERE salary_year_avg > ANY (
    SELECT salary_year_avg
    FROM job_postings_fact
);

👉 Meaning:

Salary > at least one salary from list

🧠 Simple Thinking:

👉 ANY = “Compare with ANY one value (minimum match needed)”

✅ 3. ALL operator
🔹 Meaning:

👉 Condition must be true for ALL values

💻 Example:
SELECT *
FROM job_postings_fact
WHERE salary_year_avg > ALL (
    SELECT salary_year_avg
    FROM job_postings_fact
);

👉 Meaning:

Salary > every salary in list
👉 Basically = greater than maximum value

🧠 Simple Thinking:

👉 ALL = “Must satisfy condition for every value”

⚡ Difference: ANY vs ALL
Operator	Meaning	Equivalent
> ANY	greater than at least one	> MIN
> ALL	greater than all values	> MAX
< ANY	less than at least one	< MAX
< ALL	less than all	< MIN
✅ 4. EXISTS operator
🔹 Meaning:

👉 Checks if subquery returns any row (true/false)

💻 Example:
SELECT *
FROM job_postings_fact j
WHERE EXISTS (
    SELECT 1
    FROM job_postings_fact
    WHERE company_id = j.company_id
);

👉 Meaning:

If at least one matching row exists → include it

🧠 Simple Thinking:

👉 EXISTS = “Does something exist?”

🔥 5. NOT IN and NOT EXISTS
✔️ NOT IN
WHERE company_id NOT IN (subquery)

👉 Not in the list

✔️ NOT EXISTS
WHERE NOT EXISTS (subquery)

👉 No matching row exists

🚀 Final Summary
Operator	Use case
IN	Match value in list
ANY	Condition true for at least one
ALL	Condition true for all
EXISTS	Check existence (true/false)
🎯 Final One-Line Memory Trick

👉 IN → list matching
👉 ANY → one match enough
👉 ALL → all must match
👉 EXISTS → just check existence