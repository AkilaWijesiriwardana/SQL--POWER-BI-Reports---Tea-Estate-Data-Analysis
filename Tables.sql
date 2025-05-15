-- TABLES CREATION

-- Employee Table

CREATE TABLE Employee AS (
WITH Employees AS (
    SELECT DISTINCT name  AS Employee_Name
    FROM
        teaestatedata
    UNION
    SELECT distinct tea_plucker
    FROM teaestatedata
),
employeeswithids AS (
    SELECT
        Row_Number() OVER (ORDER BY Employee_Name) AS Employee_ID,
        Employee_Name
    FROM 
        Employees
    WHERE
        Employee_Name IS NOT NULL
)

SELECT * 
FROM
    employeeswithids
)

--ALTER TABLE Employee
--ADD PRIMARY KEY (Employee_ID)

SELECT * FROM Employee

-- Hard way
/* SELECT 
    CASE
    WHEN Employee_Name = 'Ranjana' THEN 1
    WHEN Employee_Name = 'Alweera' THEN 2
    WHEN Employee_Name = 'Sarath' THEN  3
    WHEN Employee_Name = 'Vignesh' THEN 4
    WHEN Employee_Name = 'Jayasinghe' THEN 5
    WHEN Employee_Name = 'Abhi' THEN 6
    WHEN Employee_Name = 'Nimal' THEN 7
    WHEN Employee_Name = 'Sinnartha' THEN 8
    END AS Employee_ID,
    Employee_Name
FROM
    Employees
WHERE   
    Employee_Name IS NOT NULL
ORDER BY
    Employee_ID */

-- Salary table

CREATE TABLE Salary AS (
SELECT 
    Employee.Employee_ID,
    teaestatedata.Name AS Employee_Name,
    teaestatedata.salary AS Salary,
    teaestatedata.date_employee AS Date
FROM
    teaestatedata
INNER JOIN Employee ON TeaEstateData.name = Employee.Employee_Name
ORDER BY Employee_ID )

-- Expenses table & Extra_Expenses

/*CREATE TABLE Extra AS (  --created CTEs to gather data and assign ID for PK
WITH Extra_Ex AS (
    SELECT DISTINCT
        teaestatedata.extra_expenses AS Expense
    FROM
        TeaEstateData
    WHERE
        extra_expenses IS NOT NULL
)
SELECT
    Row_Number() OVER (ORDER BY Expense) AS Expense_ID,
    Expense
FROM
    Extra_Ex
) */
--ALTER TABLE Extra
--RENAME TO Extra_Expenses

--ALTER TABLE Extra_Expenses
--ADD PRIMARY KEY (Expense_ID)

CREATE TABLE Expenses AS (
SELECT 
    Expense_ID,
    teaestatedata.extra_expenses AS Expense,
    teaestatedata.payment AS Payment,
    TeaEstateData.Date_Extra
FROM
    Extra
INNER JOIN teaestatedata ON Extra.Expense = TeaEstateData.extra_expenses
)

-- Tea Plants Table

CREATE TABLE Tea_Plants AS (
    SELECT 
        teaestatedata.date_tea_plants AS Date,
        teaestatedata.number_of_plants AS Plants,
        teaestatedata.payment_tea_plants AS Payment
    FROM
        teaestatedata
    WHERE
        teaestatedata.date_tea_plants IS NOT NULL AND
        teaestatedata.number_of_plants IS NOT NULL AND
        teaestatedata.payment_tea_plants IS NOT NULL
)

-- Tea Plucking Table

CREATE TABLE Tea_Plucking AS (
    SELECT
        Employee.Employee_ID AS Employee_ID,
        teaestatedata.tea_plucker AS Employee_Name,
        teaestatedata.salary_plucker AS Salary,
        teaestatedata.date_plucking AS Date
    FROM
        teaestatedata
    INNER JOIN Employee ON teaestatedata.tea_plucker = Employee.Employee_Name
)

-- Revenue Table

CREATE TABLE Revenue AS (
    SELECT
        TeaEstateData.Month,
        2024 AS Year,
        teaestatedata.tea_leaves Tea_Leaves,
        teaestatedata.income AS Revenue
    FROM    
        teaestatedata
    WHERE
        Month IS NOT NULL
)

-- DROP TABLE teaestatedata


--ALTER TABLE Salary
--DROP COLUMN Employee_Name

ALTER TABLE Revenue
ADD COLUMN Date DATE

UPDATE Revenue
SET Date = CASE
    WHEN Month = 'January' THEN '2024-01-01'::date
    WHEN Month = 'February' THEN '2024-02-01'::date
    WHEN Month = 'March' THEN '2024-03-01'::date
    WHEN Month = 'April' THEN '2024-04-01'::date
    WHEN Month = 'May' THEN '2024-05-01'::date
    WHEN Month = 'June' THEN '2024-06-01'::date
    WHEN Month = 'July' THEN '2024-07-01'::date
    WHEN Month = 'August' THEN '2024-08-01'::date
    WHEN Month = 'September' THEN '2024-09-01'::date
    WHEN Month = 'October' THEN '2024-10-01'::date
    WHEN Month = 'November' THEN '2024-11-01'::date
    WHEN Month = 'December' THEN '2024-12-01'::date
    ELSE NULL
    END;

ALTER TABLE revenue
DROP Column Year