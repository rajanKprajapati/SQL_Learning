✅ 1. Your first question
Query:
SELECT AVG(salary_year_avg)
FROM job_postings_fact
WHERE company_id = j.company_id

👉 You asked:

“Is this extracting AVG without GROUP BY using WHERE?”

✔️ Answer:

Yes — but understand why it works:

WHERE company_id = j.company_id filters rows for one company at a time
Then AVG() is applied on those filtered rows

👉 So effectively:

It behaves like grouping per company
But done row-by-row using correlation, not GROUP BY
🧠 Think like this:

For each row in outer query:

Take company_id = 101
→ find all rows with company_id = 101
→ compute AVG
→ return ONE value

👉 That’s why it works without GROUP BY