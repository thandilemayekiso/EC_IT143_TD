-- Step 7: Create stored procedure
-- Dataset: family

-- Write SQL code here
CREATE PROCEDURE sp_load_active_employees
AS
BEGIN
    TRUNCATE TABLE active_employees_table;

    INSERT INTO active_employees_table (Name, Job_Title, Department)
    SELECT Name, Job_Title, Department
    FROM vw_active_employees;
END;