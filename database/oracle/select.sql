SELECT * FROM employees;

SELECT first_name,last_name FROM employees;

SELECT e.first_name,e.last_name,(e.salary * 12) "Yearly_Salary" FROM employees e;

SELECT e.first_name || ' ' ||e.last_name "FULL_NAME" FROM employees e;

SELECT e.first_name,e.last_name,(e.salary * 12 * NVL(e.commission_pct,1)) "Yearly_Salary" FROM employees e;

SELECT * FROM departments;

SELECT DISTINCT e.department_id FROM employees e;

SELECT DISTINCT e.department_id,e.job_id FROM employees e;

SELECT e.hire_date, e.hire_date + 5 AS hire_date_plus_5, sysdate, (sysdate + 1/24/60) FROM employees e;

SELECT * FROM dual; -- Dummay Table
SELECT 'Sami' AS title FROM dual; -- Dummay value
SELECT sysdate || q'[ is mother's day.]' AS output FROM dual; -- Dummay expression
SELECT sysdate || q'! is mother's day.!' AS output FROM dual; -- Dummay expression
SELECT 1 + '2' AS title FROM dual; -- Dummay expression
SELECT 1 || 2 AS title FROM dual; -- Dummay expression
SELECT 1 || '2' AS title FROM dual; -- Dummay expression
SELECT 1 + '2a' AS title FROM dual; -- Error implicit casting - ORA-01722: invalid number
SELECT 1 || null FROM dual;

SELECT * FROM employees e WHERE e.salary > 12000;

SELECT * FROM employees e WHERE e.hire_date between date '2005-10-05' and date '2006-03-05';

SELECT * FROM employees e WHERE e.hire_date not between date '2005-10-05' and date '2006-03-05';

SELECT * FROM employees e WHERE e.department_id in (30,50,80);

SELECT * FROM employees e WHERE not e.salary > 12000;

SELECT * FROM employees e WHERE e.salary > 9000 AND e.salary < 12000;

SELECT * FROM employees e WHERE e.salary > 9000 and e.salary < 12000 or e.manager_id = 100;

SELECT * FROM employees e WHERE e.first_name LIKE 'A%' or e.last_name LIKE 'A%';

SELECT * FROM employees e WHERE e.first_name LIKE '%ar%';

SELECT * FROM employees e WHERE e.first_name LIKE '__a%';

SELECT * FROM employees e WHERE e.job_id LIKE '__/_%' ESCAPE '/';

SELECT * FROM employees e WHERE e.salary > &MIN_SALARY AND e.salary < &MAX_SALARY;

SELECT * FROM employees e WHERE e.commission_pct IS NULL;

SELECT * FROM employees e WHERE e.commission_pct IS NOT NULL;

SELECT * FROM employees e WHERE e.salary <> 9000;

SELECT * FROM employees e WHERE e.salary = 9000;

SELECT * FROM employees e WHERE e.salary >= 9000;

SELECT * FROM employees e WHERE e.salary <= 9000;

SELECT e.employee_id,e.first_name,e.salary * 12 annsal FROM employees e ORDER BY annsal;

SELECT e.employee_id,e.first_name,e.salary * 12 annsal FROM employees e ORDER BY annsal asc;

SELECT e.employee_id,e.first_name,e.salary * 12 annsal FROM employees e ORDER BY annsal desc;

SELECT e.employee_id,e.first_name,e.salary * 12 annsal FROM employees e ORDER BY 2;

SELECT * FROM employees e WHERE e.employee_id = &employee_num;

SELECT * FROM employees e WHERE e.job_id = '&JOB_TITLE';

SELECT e.employee_id,e.last_name,&COLUMN_NAME FROM employees e WHERE &CONDITION ORDER BY &ORDER_COLUMN;

SELECT e.employee_id, e.last_name, e.job_id, &&column_name FROM employees e ORDER BY &column_name;

SELECT * FROM &Table_Name;

UNDEFINE Dep_Id_Param;
SELECT * FROM employees e WHERE &&Dep_Id_Param is not null and e.department_id = &Dep_Id_Param;

SET VERIFY ON;
DEFINE Dep_Id_Param = 10;
SELECT * FROM employees e WHERE &&Dep_Id_Param is not null and e.department_id = &Dep_Id_Param;
UNDEFINE Dep_Id_Param;


