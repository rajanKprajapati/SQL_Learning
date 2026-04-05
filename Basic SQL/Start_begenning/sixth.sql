select 
    hours_spent, 
    hours_rate,
    (hours_spent - hours_rate) as remaining_budgut,
    activity_id
from 
    invoices_fact
where 
    activity_id == 100000
