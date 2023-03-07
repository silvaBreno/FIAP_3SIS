--Exemplo Slide 12
--Aqui eu tenho só quem foi promovido, pois não pega a intersecção
SELECT employee_id, job_id
FROM   employees
UNION
SELECT employee_id, job_id
FROM   job_history;

--Exemplo Slide 15
--Aqui eu tenho a união mais a intersecção, aqui eu consigo já verificar quem foi rebaixado
--sempre colocar o order_by no final e nunca no primeiro select
-- Todos os operadores exceto o UNION ALL ordem as linhas pela primeira coluna
SELECT employee_id, job_id, department_id
FROM   employees
UNION ALL
SELECT employee_id, job_id, department_id
FROM   job_history
ORDER BY  employee_id;

--Exemplo Slide 17
--Aqui eu consigo verificar os funcionários que já foram rebaixados, pois eles aparecem na intersecção
SELECT employee_id, job_id
FROM   employees
INTERSECT
SELECT employee_id, job_id
FROM   job_history;

--Exemplo Slide 19
-- aqui eu tenho todos os funcionários que nunca foram promovidos, pois só aparece quem esta na tabela de Empregados
SELECT employee_id
FROM   employees
MINUS
SELECT employee_id
FROM   job_history;


--Exemplo slide 22
-- quanto eu tenho um numero diferente de colunas eu preencho com nulo porque não posso ter quantidade diferente de colunas e precisam ser do mesmo tipo de dado.
SELECT department_id, 
       TO_NUMBER(null) location, hire_date
FROM   employees
UNION
SELECT department_id, location_id,  TO_DATE(null)
FROM   departments;

--Exemplo slide 23
-- o codigo abaixo não roda pq o salario é um numero e o '---' é varchar2, portanto o correto é converter o salario para varchar2
SELECT employee_id, job_id,salary
FROM   employees
UNION
SELECT employee_id, job_id,'---'
FROM   job_history;
--exemplo da conversão:
SELECT employee_id, job_id,TO_CHAR(salary)
FROM   employees
UNION
SELECT employee_id, job_id,'---'
FROM   job_history;


--Exercício 2 slide 25
--Preciso pegar a tabela pais e depois fazer um join entre a tabela locations e departamentos
SELECT country_id, country_name
FROM countries 
MINUS
SELECT c.country_id, country_name
FROM countries c JOIN locations l
ON c.country_id = l.country_id
JOIN departments d
ON l.location_id = d.location_id;

--Exercício 4 slide 25
SELECT employee_id, job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history;



