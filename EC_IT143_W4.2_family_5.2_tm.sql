-- Step 5.2: Refine table (PK, constraints)
-- Dataset: family

-- Write SQL code here
ALTER TABLE active_employees_table
ADD Employee_ID INT IDENTITY(1,1) PRIMARY KEY;