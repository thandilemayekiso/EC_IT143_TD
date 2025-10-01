-- Step 3: Create an ad hoc SQL query
-- Dataset: family

-- Write SQL code here
-- Find employees hired before 1990
SELECT Name, Hire_Date, Department
FROM family_data
WHERE Hire_Date < '1990-01-01';