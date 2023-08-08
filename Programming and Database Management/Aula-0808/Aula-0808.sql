/* 
Crie um bloco PL/SQL que insira um departamento na tabela de departments.
Solicite ao usu�rio que informe o nome do departamento.

Utilizando um sequ�ncia a seguir , insira o c�digo do departamento.

create sequence seq_dept
start with 290
increment by 10;

Para as colunas c�digo da localidade e c�digo do gerente, informe null.
*/

SELECT * FROM DEPARTMENTS;

DESC DEPARTMENTS;

-- 1)

create sequence seq_dept
start with 280
increment by 10;

DECLARE
    deptname VARCHAR2(30):= INITCAP('&deptname');
BEGIN
    INSERT INTO departments(
        department_id, 
        department_name,
        manager_id, 
        location_id)
    VALUES(
        seq_dept.NEXTVAL,
        deptname,
        NULL,
        NULL
    );  
    COMMIT;
END;
/

-- resolucao do professor

drop sequence seq_dept;
create sequence seq_dept
start with 280
increment by 10;

delete departments where  department_id > 270;

set serverout on

accept p_dn prompt 'Informe o nome do departamento'
declare
   v_dn departments.department_name%type := initcap('&p_dn');
begin
   insert into departments
   values (seq_dept.nextval,v_dn,null,null);
   
   dbms_output.put_line(sql%rowcount || ' linha inserida');
   commit; 
end;
/
select * from departments;


--2)
/* 
Crie um bloco PL/SQL que solicite ao usu�rio o c�digo do funcion�rio. 

Para cada funcion�rio dever� ser exibida as seguintes informa��es:
LAST_NAME	SALARY		STAR
KING		9000		*********
MEG		    2100		**
PETTER		3700		****

Para exibir a coluna STAR voc� deve considerar que, a cada US$ 1000 do sal�rio do empregado ele ir� receber um *.
*/

SET SERVEROUT ON

ACCEPT func_id prompt 'Informe o n�mero do funcion�rio:'
DECLARE
    
BEGIN

       
    COMMIT;
END;
/

-- resposta do professor 

set verify off
set feed off
cl scr
accept p_ei prompt 'Informe o c�digo do funcion�rio'
declare
    v_ei  employees.employee_id%type := &p_ei;
    v_ln  employees.last_name%type;
    v_sal employees.salary%type;
    v_ast varchar(100);
    v_count number := 1;
begin
   select last_name,salary/1000
   into   v_ln, v_sal
   from   employees
   where  employee_id = v_ei;
 /*    
   for i in 1..v_sal loop
       v_ast := v_ast || '*';
   end loop;
*/
/*
  while v_count <= round(v_sal) loop
      v_count := v_count + 1;
      v_ast := v_ast || '*';      
   end loop;
*/
  loop
       v_ast := v_ast || '*';  
       exit when v_count >= round(v_sal); 
       v_count := v_count + 1;
  end loop;

   dbms_output.put_line(v_ei ||' '||v_ln||' '||v_sal*1000||' '||v_ast);
   dbms_output.put_line('Conferido a quantidade de *: '|| length(v_ast));
end;
/



