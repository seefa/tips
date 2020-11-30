SELECT e.employee_id, XMLELEMENT ("Emp", e.first_name ||' '|| e.last_name) AS "RESULT" 
FROM hr.employees e 
WHERE employee_id > 200;
CREATE OR REPLACE TYPE emp_t AS OBJECT ("@EMPNO" NUMBER(4), NAME VARCHAR2(10));
CREATE OR REPLACE TYPE emplist_t AS TABLE OF emp_t;
CREATE OR REPLACE TYPE dept_t AS OBJECT ("@DEPTNO" NUMBER(2),
                                       DNAME VARCHAR2(14),
                                       EMP_LIST emplist_t);
                                    
SELECT XMLElement("Department",
                  dept_t(department_id,
                        department_name,
                        cast(MULTISET
                              (SELECT employee_id, last_name
                                 FROM hr.employees e
                                 WHERE e.department_id = d.department_id)
                              AS emplist_t)))
AS deptxml
FROM hr.departments d
WHERE d.department_id = 10;