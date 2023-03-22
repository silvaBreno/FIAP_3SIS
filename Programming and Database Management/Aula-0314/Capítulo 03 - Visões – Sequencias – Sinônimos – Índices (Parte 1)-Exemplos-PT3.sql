--VIEWS
DROP VIEW empvu80;
CREATE VIEW 	empvu80
 AS SELECT  employee_id, last_name, salary
    FROM    employees
    WHERE   department_id = 80;

	
DESCRIBE empvu80;

SELECT * FROM EMPVU80;

UPDATE EMPVU80
SET SALARY=15000
WHERE EMPLOYEE_ID=145;

DELETE EMPVU80
WHERE EMPLOYEE_ID=179;

INSERT INTO EMPVU80
VALUES (12345,'Xiuderico',10000);

DESCRIBE EMPLOYEES;

ROLLBACK;

DROP VIEW salvu50 ;
CREATE VIEW 	salvu50
 AS SELECT  employee_id ID_NUMBER, 
            last_name   NAME,
            salary*12   ANN_SALARY --SEM A ATRIBUIÇÃO DO NOME, DARÁ ERRO
    FROM    employees
    WHERE   department_id = 50;


SELECT *
FROM   salvu50;

UPDATE SALVU50
SET ANN_SALARY = 10000000;

DELETE SALVU50
WHERE ID_NUMBER = 199;


CREATE OR REPLACE VIEW empvu80
  (id_number, name, sal, department_id)
AS SELECT  employee_id,
            first_name || ' ' || last_name, 
			salary, 
			department_id
   FROM    employees
   WHERE   department_id = 80;
   


DROP VIEW dept_sum_vu;

CREATE VIEW	dept_sum_vu
  (name, minsal, maxsal, avgsal)
AS SELECT	 d.department_name, MIN(e.salary), 
             MAX(e.salary),AVG(e.salary)
   FROM      employees e, departments d
   WHERE     e.department_id = d.department_id 
   GROUP BY  d.department_name;

CREATE OR REPLACE VIEW empvu20
AS SELECT	*
   FROM     employees
   WHERE    department_id = 20
   WITH CHECK OPTION CONSTRAINT empvu20_ck ;

SELECT * FROM empvu20;
INSERT INTO empvu20
VALUES (2051,'Shelley','Higgins',
'SHIGGINS@XPTO1',123,SYSDATE,'AC_MGR',12000,NULL,101,20);

SELECT * FROM empvu20;

CREATE OR REPLACE VIEW empvu10
    (employee_number, employee_name, job_title)
AS SELECT	employee_id, last_name, job_id
   FROM     employees
   WHERE    department_id = 10
   WITH READ ONLY CONSTRAINT EMPVU10_RO;
   
SELECT * FROM empvu10;


DROP VIEW empvu80;

--Exercícios

--4
CREATE OR REPLACE VIEW DEPT50 AS
    SELECT employee_id EMPNO,
           last_name EMPLOYEE,
           department_id DEPTNO
    FROM   employees
    WHERE  department_id = 50
    WITH CHECK OPTION CONSTRAINT DEPT50_CK;
--5
DESCRIBE DEPT50;
SELECT * FROM DEPT50;
--6
UPDATE DEPT50
SET    deptno = 80
WHERE  employee = 'Matos';


--1 
CREATE OR REPLACE VIEW EMPLOYEES_VU AS
    SELECT employee_id, last_name EMPLOYEE, department_id
    FROM employees;
    
-- 2
SELECT * FROM EMPLOYEES_VU;

-- 3
SELECT employee, department_id
    FROM EMPLOYEES_VU;