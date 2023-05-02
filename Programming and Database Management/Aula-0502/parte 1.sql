set serverout on

-- primeiro exemplo
declare 
    v_ei integer := 10;
    v_ln varchar(50) not null := 'Z';
    c_tax constant int := 0;
begin
    c_tax:=1; --> isso aqu ivai dar erro porque nao podemos alterar o valor de um constante
    dbms_output.put_line(v_ei);
    sele
end;
/

-- segundo exemplo 
-- um cursor tem a mesma ideia de vetor em java
declare 
    v_ei integer := 100;
    v_ln varchar(50) not null := 'Z';
    c_tax constant int := 0;
begin
    dbms_output.put_line(v_ei);
    select last_name
    into v_ln
    from employees
    where employee_id = v_ei;
    dbms_output.put_line(v_ln);
end;
/

--terceiro exemplo
-- dou um desc employees para conseguir entender qual o salario especificado, eu não posso usar um v_sal number (5) pq nesse caso o salario é um nuber (8,2)
declare 
    v_ei integer := 100;
    v_sal number(8,2);
    v_ln varchar(50);
    c_tax constant int := 0;
begin
    dbms_output.put_line(v_ei);
    select last_name, salary
    into v_ln, v_sal
    from employees
    where employee_id = v_ei;
    dbms_output.put_line(v_ln);
end;
/
desc employees;
alter table employees
modify last_name varchar(100);

-- no caso de cima é melhor eu falar para o oracle ir buscar o tipo na tabela direto em tempo de execução com o comando abaixo:
declare 
    v_ei integer := 100;
    v_sal number(8,2);
    v_ln employees.last_name%type;
    c_tax constant int := 0;
begin
    dbms_output.put_line(v_ei);
    select last_name, salary
    into v_ln, v_sal
    from employees
    where employee_id = v_ei;
    dbms_output.put_line(v_ln);
end;
/

-- quarto exemplo
declare 
    v_ei integer := 100;
    v_sal employees.salary%type not null;
    v_ln employees.last_name%type;
    c_tax constant int := 0;
    v_sal_comm v_sal%type; --> ele não vai funcionar pq ele tb pega o not null e o tipo, ou seja, ele não iniciou a variavel declarada
begin
    dbms_output.put_line(v_ei);
    select last_name, salary
    into v_ln, v_sal
    from employees
    where employee_id = v_ei;
    dbms_output.put_line(v_ln);
end;
/

-- ou seja preciso declarar
declare 
    v_ei integer := 100;
    v_sal employees.salary%type not null := 10;
    v_ln employees.last_name%type;
    c_tax constant int := 0;
    v_sal_comm v_sal%type := 10; --> ele não vai funcionar pq ele tb pega o not null e o tipo, ou seja, ele não iniciou a variavel declarada
begin
    dbms_output.put_line(v_ei);
    select last_name, salary
    into v_ln, v_sal
    from employees
    where employee_id = v_ei;
    dbms_output.put_line(v_ln);
end;
/

--
declare 
    v_ei integer := 100;
    v_sal employees.salary%type not null := 10;
    v_ln employees.last_name%type;
    c_tax constant int := 0;
    v_sal_comm v_sal%type := 10; --> ele não vai funcionar pq ele tb pega o not null e o tipo, ou seja, ele não iniciou a variavel declarada
    c_tax2 c_tax%type;
begin
    c_tax2 := 1;
    c_tax2 :=2;
    dbms_output.put_line(v_ei);
    select last_name, salary
    into v_ln, v_sal
    from employees
    where employee_id = v_ei;
    dbms_output.put_line(v_ln);
end;
/