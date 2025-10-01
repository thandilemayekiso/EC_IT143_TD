-- Step 4: Turn query into a view
-- Dataset: family

-- Write SQL code here
-- Create a view for active employees
CREATE VIEW vw_active_employees AS
SELECT Name, Job_Title, Department
FROM family_data
WHERE Status = 'Active';
