DROP table AUDIT_EMPLOYEES;
create table AUDIT_EMPLOYEES
(AUD_WHO VARCHAR2(20),
AUD_WHEN DATE,
AUD_OPERATION VARCHAR2(1),
AUD_MODULE VARCHAR2(30),
EMPLOYEE_ID NUMBER(6),
FIRST_NAME VARCHAR2(20),
LAST_NAME VARCHAR2(25) NOT NULL,
EMAIL VARCHAR2(25),
PHONE_NUMBER VARCHAR2(20) NOT NULL,
HIRE_DATE DATE NOT NULL,
JOB_ID VARCHAR2(10) NOT NULL,
SALARY NUMBER(8,2),
COMMISSION_PCT NUMBER(2,2),
MANAGER_ID NUMBER(6),
DEPARTMENT_ID NUMBER(4),
VACATION_BALANCE NUMBER(6,2)
);
DROP  TABLE employees_trg;
CREATE TABLE employees_trg
AS SELECT *
FROM employees;

INSERT INTO employees_trg VALUES 
(200,'Jennifer','Whalen','JWHALEN','515.123.4444',TO_DATE('17-SEP-1987','dd-MON-yyyy'),'AD_ASST',4400,NULL,101,10);
COMMIT;

UPDATE employees_trg
SET phone_number = '515.123.333'
WHERE employee_id = 200;
COMMIT;

DELETE FROM employees_trg
WHERE employee_id = 200;
COMMIT;

SELECT *
FROM audit_employees;


-----------------------------------------------------

DROP TRIGGER TRG_AUDIT_EMPLOYEES;
create OR REPLACE trigger TRG_AUDIT_EMPLOYEES
BEFORE insert or update or delete on employees_trg
for each row
declare
 l_operation varchar2(1) :=
 case when updating then 'U'
 when deleting then 'D'
 else 'I' end;
begin
 if updating or inserting then
 insert into AUDIT_EMPLOYEES
 (aud_who
 ,aud_when
 ,aud_operation
 ,aud_module
 ,employee_id
 ,first_name
 ,last_name
 ,email
 ,phone_number
 ,hire_date
 ,job_id
 ,salary
 ,commission_pct
 ,manager_id
 ,department_id)
 values
 (user
 ,sysdate
 ,l_operation
 ,sys_context('USERENV','MODULE')
 ,:new.employee_id
 ,:new.first_name
 ,:new.last_name
 ,:new.email
 ,:new.phone_number
 ,:new.hire_date
 ,:new.job_id
 ,:new.salary
 ,:new.commission_pct
 ,:new.manager_id
 ,:new.department_id);
 else
 insert into AUDIT_EMPLOYEES
 (aud_who
 ,aud_when
 ,aud_operation
 ,aud_module
 ,employee_id
 ,first_name
 ,last_name
 ,email
 ,phone_number
 ,hire_date
 ,job_id
 ,salary
 ,commission_pct
 ,manager_id
 ,department_id)
 values
 (user
 ,sysdate
 ,l_operation
 ,sys_context('USERENV','MODULE')
 ,:old.employee_id
 ,:old.first_name
 ,:old.last_name
 ,:old.email
 ,:old.phone_number
 ,:old.hire_date
 ,:old.job_id
 ,:old.salary
 ,:old.commission_pct
 ,:old.manager_id
 ,:old.department_id);
 end if;
end;
/