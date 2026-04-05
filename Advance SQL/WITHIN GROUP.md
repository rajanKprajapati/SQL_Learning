WITHIN GROUP is used together with special aggregate functions to define how the data should be ordered before aggregation.

👉 It is commonly used with:

PERCENTILE_CONT
PERCENTILE_DISC
LISTAGG (in some databases)
🔸 1. Why WITHIN GROUP is needed?

Normally, aggregate functions like AVG(), SUM() don’t care about order.

But some functions depend on order, like:

Finding percentile
Concatenating values in order

👉 That’s where WITHIN GROUP comes in — it tells SQL:

"First sort the data like this, then apply the function"

🔸 2. Syntax
FUNCTION_NAME(value)
WITHIN GROUP (ORDER BY column_name)
🔸 3. Example 1: PERCENTILE_CONT
🎯 Problem: Find 75th percentile salary
SELECT 
    PERCENTILE_CONT(0.75) 
    WITHIN GROUP (ORDER BY salary) AS percentile_75
FROM employees;
💡 How it works:
Sort salaries in ascending order
Find the value at 75% position
Return that value