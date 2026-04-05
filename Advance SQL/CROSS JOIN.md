🔥 Why We Use CROSS JOIN (Important)
✅ 1. Attach a Single Value to All Rows

👉 This is most common use (your case)

Example:

CROSS JOIN avg_jobs

👉 If avg_jobs has:

avg_job
20

👉 Then every row gets:

company	jobs	avg_job
A	10	20
B	30	20

✔ Now you can compare easily

✅ 2. Generate All Combinations

👉 Used in:

test data
combinations (colors × sizes)
scheduling problems