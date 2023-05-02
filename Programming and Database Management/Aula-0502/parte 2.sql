select last_name
from employees
where employee_id = 100;

select last_name
from employees
where employee_id = 102;

select last_name
from employees
where employee_id =:b1; --> b1 bind variable

set serverout on
set autoprint on -- para printar todas as binds que eu tenha 
variable b_ln varchar2(100);
declare 
    v_ei integer := 100;
    v_sal employees.salary%type not null := 10;
    v_ln employees.last_name%type;
    c_tax constant int := 0;
    v_sal_comm v_sal%type := 10;
    c_tax2 c_tax%type;
begin
    c_tax2 := 1;
    c_tax2 :=2;
    dbms_output.put_line(v_ei);
    select last_name, salary
    into :b_ln, v_sal
    from employees
    where employee_id = v_ei;
    dbms_output.put_line(v_ln);
end;
/
print b_ln

select *
from v$sqlarea;