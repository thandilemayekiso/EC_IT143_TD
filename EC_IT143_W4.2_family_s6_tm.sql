-- Step 6: Load table from view
-- Dataset: family

-- Write SQL code here

TRUNCATE TABLE active_employees_table;

INSERT INTO active_employees_table (Name, Job_Title, Department)
SELECT Name, Job_Title, Department
FROM vw_active_employees;