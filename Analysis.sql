SELECT   -- total salaries
    employee.employee_name,
    SUM(salary)
FROM employee
INNER JOIN salary ON salary.employee_id = employee.employee_id
GROUP BY employee.employee_name


SELECT -- total tea plucking salaries
    employee.employee_name,
    SUM(salary)
FROM    
    employee
INNER JOIN tea_plucking ON tea_plucking.employee_id = employee.employee_id
GROUP BY
    employee.employee_name

SELECT  -- Total Extra expenses
    expenses.expense,
    SUM(expenses.payment)
FROM
    expenses
INNER JOIN extra_expenses ON extra_expenses.expense_id = expenses.expense_id
GROUP BY
    expenses.expense

SELECT -- SALARY AND TEA PLUCKING
    combined.employee_name,
    SUM(salary) AS Total_salary
FROM
    (
        SELECT employee_name, salary FROM salary
        UNION all
        SELECT employee_name, Salary FROM tea_plucking
    ) AS Combined
GROUP BY
    combined.employee_name

