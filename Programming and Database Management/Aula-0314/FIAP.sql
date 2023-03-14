-- Para criar uma visão basta utilizar um comando SELECT
-- Facilita consultas complexas
-- Visão é o espelho de um ou mais tabelas, eu tb posso alterar dados de um tabela usando a visão
-- 

-- Se eu alterar um dado da tabela usando um update na tabela, os dados da visão tb vão alterar
-- Exemplo:
-- UPDATE EMPLOYEE
-- SET SALARY = 15000
-- WHERE EMPLOYEE_ID=145;

-- UPDATE EMPVU80
-- SET SALARY = 15000
-- WHERE EMPLOYEE_ID=145;


-- para inserir usando a visão todas as colunas que são NOT NULL devem ser manipuladas pela visão
-- ou seja, vc só consegue inserir se vc colocar dados em todas as colunas obrigatorias

-- eu não posso criar coluna sem dar um apelido
--CREATE VIEW salvu50
-- AS SELECT  employee_id ID_NUMBER, 
--            last_name   NAME,
--            salary*12  
--    FROM    employees
--    WHERE   department_id = 50;

-- eu preciso colocar um alias na expressao salary*12 
--CREATE VIEW 	salvu50
-- AS SELECT  employee_id ID_NUMBER, 
--            last_name   NAME,
--            salary*12   ANN_SALARY
--    FROM    employees
--    WHERE   department_id = 50;


-- em resultado de expressao eu não consigo fazer update, JUSTAMENTE POR ELE SER RESULTADO DE UM EXPRESSAO MATEMATICA
--UPDATE SALVU50
--SET ANN_SALARY = 10000000;


-- Essa é uma segunda forma de apelidar as colunas, vc pode declarar os alias antes do AS SELECT
--CREATE OR REPLACE VIEW empvu80
--  (id_number, name, sal, department_id)
--AS SELECT  employee_id,
--            first_name || ' ' || last_name, 
--			salary, 
--			department_id
--   FROM    employees
--   WHERE   department_id = 80;