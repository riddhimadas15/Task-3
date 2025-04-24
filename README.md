# Task-3
A manually constructed dataset simulating an e-commerce user system was created:
- `users` table: Stores user credentials and demographic info
- `login_records` table: Logs user login events
Basic Queries
- Used `SELECT`, `WHERE`, `ORDER BY`, `GROUP BY` to filter and organize data
- `INNER JOIN` used to relate login data with user profiles
- Subquery used to select users with IDs above the average
- `COUNT()` and `AVG()` applied to summarize gender and names
- Created a view `active_males` for filtered reusable queries
- Created index on the `sex` column to enhance performance
> Screenshots of output for each query are included in the task3.pdf
> The code is present in task_3.sql 
