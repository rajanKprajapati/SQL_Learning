SELECT 
    hours_spent, 
    hours_rate,
    hours_spent + hours_rate as prioritize_tasks,
    (hours_spent + hours_rate) % 5 as modulo_filter_tasks
FROM
    invoices_fact    
where 
    (prioritize_tasks BETWEEN 500 and 1000 ) and 
    (modulo_filter_tasks > 0)

    