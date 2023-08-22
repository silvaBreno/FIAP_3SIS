--Exercícios pagina 11

--1. a)

CREATE TABLE top_dogs
(name VARCHAR2(25),
salary NUMBER(11,2));

--1
/*DROP TABLE top_dogs;
CREATE TABLE top_dogs (
    name   VARCHAR2(25),
    salary NUMBER(11, 2));*/
TRUNCATE TABLE top_dogs;
ACCEPT p_num PROMPT 'Informe o número de maiores salários '
DECLARE
    v_num   NUMBER(3) := &p_num;
BEGIN
    FOR  reg_emp in (SELECT last_name, salary
                     FROM employees
                     ORDER BY 2 DESC
                     FETCH FIRST 10 ROWS ONLY) LOOP
        INSERT INTO top_dogs 
        VALUES (reg_emp.last_name,reg_emp.salary);
    END LOOP;
    COMMIT;
END;
/

SELECT *
FROM top_dogs;


-- Exercicios pagina 13

--2
--TRUNCATE TABLE messages;
SET VERIFY OFF
DEFINE p_sal = 100000
DECLARE
    v_last_name employees.last_name%TYPE;
    v_salary    employees.salary%TYPE := &p_sal;
BEGIN
    SELECT last_name
    INTO   v_last_name
    FROM   employees
    WHERE   salary = v_salary;

    INSERT INTO messages  
    VALUES ( v_last_name|| ' - '|| v_salary );
    
    COMMIT;
EXCEPTION
    WHEN no_data_found THEN
        INSERT INTO messages
        VALUES ( 'No employee with a salary of ' || v_salary);
    WHEN too_many_rows THEN
        INSERT INTO messages 
        VALUES ( 'More than one employee with a salary of ' || v_salary );
    WHEN OTHERS THEN
        INSERT INTO messages 
        VALUES ( 'Some other error occurred.' );
END;
/

SELECT *
FROM messages;


-- Checkpoint --> capito 1 ao 6