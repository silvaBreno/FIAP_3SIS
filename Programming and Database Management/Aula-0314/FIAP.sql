-- Para criar uma vis�o basta utilizar um comando SELECT
-- Facilita consultas complexas
-- Vis�o � o espelho de um ou mais tabelas, eu tb posso alterar dados de um tabela usando a vis�o
-- 

-- Se eu alterar um dado da tabela usando um update na tabela, os dados da vis�o tb v�o alterar
-- Exemplo:
-- UPDATE EMPLOYEE
-- SET SALARY = 15000
-- WHERE EMPLOYEE_ID=145;

-- UPDATE EMPVU80
-- SET SALARY = 15000
-- WHERE EMPLOYEE_ID=145;


-- para inserir usando a vis�o todas as colunas que s�o NOT NULL devem ser manipuladas pela vis�o
-- ou seja, vc s� consegue inserir se vc colocar dados em todas as colunas obrigatorias

-- eu n�o posso criar coluna sem dar um apelido
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


-- em resultado de expressao eu n�o consigo fazer update, JUSTAMENTE POR ELE SER RESULTADO DE UM EXPRESSAO MATEMATICA
--UPDATE SALVU50
--SET ANN_SALARY = 10000000;


-- Essa � uma segunda forma de apelidar as colunas, vc pode declarar os alias antes do AS SELECT
--CREATE OR REPLACE VIEW empvu80
--  (id_number, name, sal, department_id)
--AS SELECT  employee_id,
--            first_name || ' ' || last_name, 
--			salary, 
--			department_id
--   FROM    employees
--   WHERE   department_id = 80;