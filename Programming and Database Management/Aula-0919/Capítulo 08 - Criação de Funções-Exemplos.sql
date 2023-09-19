-- Exemplo 1
SET SERVEROUTPUT ON 
CREATE OR REPLACE FUNCTION get_sal
 (id employees.employee_id%TYPE) 
 RETURN NUMBER 
 IS
  sal employees.salary%TYPE := 0;
BEGIN
  SELECT salary
  INTO   sal
  FROM   employees         
  WHERE  employee_id = id;
  RETURN sal;
END get_sal;
/
SELECT  employee_id, salary, get_sal(employee_id)
from employees;

SELECT get_sal(101) FROM dual;
EXECUTE dbms_output.put_line(get_sal(101));

--caso eu coloque um funcionario n�o existe preciso arrumar o erro do execute da linha 20 portanto preciso corrigir a PROCEDURE, conforme abaixo:
CREATE OR REPLACE FUNCTION get_sal
 (id employees.employee_id%TYPE) 
 RETURN NUMBER 
 IS
  sal employees.salary%TYPE := 0;
BEGIN
  SELECT salary
  INTO   sal
  FROM   employees         
  WHERE  employee_id = id;
  RETURN sal;
EXCEPTION
WHEN no_data_found THEN
  dbms_output.put_line('Erro');
  RETURN null;
END get_sal;
/
EXECUTE dbms_output.put_line(get_sal(1010));

-- Exemplo 2
CREATE OR REPLACE FUNCTION tax(value IN NUMBER, taxa NUMBER)
 RETURN NUMBER IS
BEGIN
   RETURN (value * taxa);
END tax;
/
SELECT employee_id, last_name, salary, tax(salary,.275), salary-tax(salary,.275) sal_liq
FROM   employees
WHERE  department_id = 100;

-- Exemplo 3 do professor (apostila)
DECLARE 
    v_sal NUMBER(8,2);
BEGIN
    v_sal := get_sal(100);
    dbms_output.put_line(v_sal);
END;
/

-- OU

DECLARE 
    v_sal NUMBER(8,2) := get_sal(100);
BEGIN
    dbms_output.put_line(v_sal);
END;
/


--Exerc�cios Propostos 
/* 
2) Crie uma fun��o chamada GET_ANNUAL_COMP para retornar o sal�rio anual 
calculado a partir do sal�rio mensal de um empregado. Utilize a tabela EMPLOYEES.
a. A fun��o deve aceitar como par�metros de entrada o c�digo do funcion�rio.
b. A fun��o deve retornar o valor do sal�rio taxado
OBSERVA��O: O valor da comiss�o pode ser nulo pois existem 
funcion�rios que n�o s�o comissionados. A fun��o deve retornar um sal�rio 
anual n�o nulo. 

Use a f�rmula a seguir para calcular o sal�rio anual: 

(salary*12) + (commission_pct*salary*12)*/
DESC EMPLOYEES;

CREATE OR REPLACE FUNCTION GET_ANNUAL_COMP
 (id employees.employee_id%TYPE) 
 RETURN NUMBER 
 IS
  sal_anual employees.salary%TYPE := 0;
BEGIN
  SELECT (salary*12) + (nvl(commission_pct, 0)*salary*12)
  INTO   sal_anual
  FROM   employees         
  WHERE  employee_id = id;
  RETURN sal_anual;
EXCEPTION
WHEN no_data_found THEN
  dbms_output.put_line('ID NAO EXISTE');
  RETURN null;
END GET_ANNUAL_COMP;
/

EXECUTE dbms_output.put_line(GET_ANNUAL_COMP(100));   



-- PELO PROFESSOR

create or replace function get_annual_comp 
(p_ei employees.employee_id%type)
return number
is
   v_ann_sal employees.salary%type;
begin
  select (salary*12) + (nvl(commission_pct,0)*salary*12)
  into   v_ann_sal
  from   employees
  where  employee_id = p_ei;
  
  return v_ann_sal;
exception
when no_data_found then
    dbms_output.put_line('ID n�o existe!');
    return null;
when others then
    dbms_output.put_line('Erro!');
    return null;
end get_annual_comp;
/
exec dbms_output.put_line(get_annual_comp(1010));
select last_name,salary,commission_pct,get_annual_comp(employee_id) ann_comp
from employees
where department_id in (80,90);
