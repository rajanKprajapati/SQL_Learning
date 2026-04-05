select 
    hours_spent, 
    hours_rate,
    (hours_spent / hours_rate) as devided_data,
    activity_id
from 
    invoices_fact
    
    