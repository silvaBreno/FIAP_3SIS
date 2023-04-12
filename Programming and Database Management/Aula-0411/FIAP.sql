--1
DROP TABLE sal_history;

CREATE TABLE sal_history (
    employee_id NUMBER(6),
    hire_date   DATE,
    salary      NUMBER(8, 2)
);

--2
DESC SAL_HISTORY;

--3
DROP TABLE mgr_history;

CREATE TABLE mgr_history (
    employee_id NUMBER(6),
    manager_id  NUMBER(6),
    salary      NUMBER(8, 2)
);

--4
DESC mgr_history;

--5
DROP TABLE special_sal;

CREATE TABLE special_sal (
    employee_id NUMBER(6),
    salary      NUMBER(8, 2)
);

--6
DESC SPECIAL_SAL;

--7
TRUNCATE TABLE SAL_HISTORY;
TRUNCATE TABLE mgr_history;
TRUNCATE TABLE special_sal;

--a)
SELECT employee_id, hire_date, salary, manager_id
FROM employees
WHERE employee_id < 125;


INSERT ALL
    WHEN salary > 20000 THEN
        INTO SPECIAL_SAL VALUES(employee_id,salary)
    ELSE
        INTO SAL_HISTORY VALUES (employee_id,hire_date,salary)
        INTO MGR_HISTORY VALUES (employee_id,manager_id,salary)
SELECT employee_id, hire_date, salary, manager_id
FROM employees
WHERE employee_id < 125;

ROLLBACK;

SELECT * FROM SAL_HISTORY;
SELECT * FROM MGR_HISTORY;
SELECT * FROM SPECIAL_SAL;



--exercicio pagina 46

SELECT manager_id, job_id, sum(salary)
FROM employees
WHERE manager_id < 120
GROUP BY manager_id, job_id
ORDER BY 1;



