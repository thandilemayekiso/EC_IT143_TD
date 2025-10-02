/*
------------------------------------------------------------
EC_IT143_W5.2_Adult_TM.sql
Author: Thandile Mayekiso
Date: 2025-10-01
Dataset: adult.csv
Description: Four SQL analysis queries with answers
------------------------------------------------------------
*/

-- Question 1 (Author: Me)
-- How does education level relate to salary categories across different occupations?
SELECT education, occupation, income, COUNT(*) AS PeopleCount
FROM adult
GROUP BY education, occupation, income
ORDER BY education, occupation;

-- Question 2 (Author: Me)
-- What is the average number of hours worked per week by gender and marital status?
SELECT sex, marital_status, AVG(hours_per_week) AS AvgHoursWorked
FROM adult
GROUP BY sex, marital_status;

-- Question 3 (Author: Me)
-- Are certain racial groups more likely to hold specific types of occupations?
SELECT race, occupation, COUNT(*) AS CountByGroup
FROM adult
GROUP BY race, occupation
ORDER BY race, CountByGroup DESC;

-- Question 4 (Author: Desire Egadu)
-- What is the average purchase amount for customers who have used a discount code at least once?
-- Adapted to adult dataset → using "capital_gain" as proxy for purchase value.
SELECT AVG(capital_gain) AS AvgCapitalGain
FROM adult
WHERE capital_gain > 0;
