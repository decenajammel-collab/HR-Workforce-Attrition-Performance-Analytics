CREATE DATABASE hr_workforce_db;
CREATE TABLE employee_workforce (
    employee_id INT PRIMARY KEY,
    age INT,
    department VARCHAR(50),
    job_role VARCHAR(50),
    monthly_income NUMERIC(10, 2),
    overtime VARCHAR(3),
    job_satisfaction INT,
    years_at_company INT,
    attrition VARCHAR(3)
);

SELECT * FROM employee_workforce LIMIT 5;

SELECT 
    COUNT(*) AS total_employees,
    COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS employees_left,
    ROUND(COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) * 100.0 / NULLIF(COUNT(*), 0), 2) AS overall_attrition_rate_pct
FROM employee_workforce;

SELECT COUNT(*) FROM employee_workforce;

SELECT 
    department,
    overtime,
    COUNT(*) AS total_employees,
    COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS left_employees,
    ROUND(COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2) AS department_attrition_rate
FROM employee_workforce
GROUP BY department, overtime
ORDER BY department_attrition_rate DESC;

SELECT 
    job_role,
    attrition,
    ROUND(AVG(monthly_income), 2) AS avg_monthly_income,
    ROUND(AVG(job_satisfaction), 2) AS avg_job_satisfaction
FROM employee_workforce
GROUP BY job_role, attrition
ORDER BY job_role, attrition;