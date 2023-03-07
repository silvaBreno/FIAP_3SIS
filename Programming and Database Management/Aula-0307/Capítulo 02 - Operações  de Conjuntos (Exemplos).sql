--Exemplo Slide 12
--Aqui eu tenho s� quem foi promovido, pois n�o pega a intersec��o
SELECT employee_id, job_id
FROM   employees
UNION
SELECT employee_id, job_id
FROM   job_history;

--Exemplo Slide 15
--Aqui eu tenho a uni�o mais a intersec��o, aqui eu consigo j� verificar quem foi rebaixado
--sempre colocar o order_by no final e nunca no primeiro select
-- Todos os operadores exceto o UNION ALL ordem as linhas pela primeira coluna
SELECT employee_id, job_id, department_id
FROM   employees
UNION ALL
SELECT employee_id, job_id, department_id
FROM   job_history
ORDER BY  employee_id;

--Exemplo Slide 17
--Aqui eu consigo verificar os funcion�rios que j� foram rebaixados, pois eles aparecem na intersec��o
SELECT employee_id, job_id
FROM   employees
INTERSECT
SELECT employee_id, job_id
FROM   job_history;

--Exemplo Slide 19
-- aqui eu tenho todos os funcion�rios que nunca foram promovidos, pois s� aparece quem esta na tabela de Empregados
SELECT employee_id
FROM   employees
MINUS
SELECT employee_id
FROM   job_history;


--Exemplo slide 22
-- quanto eu tenho um numero diferente de colunas eu preencho com nulo porque n�o posso ter quantidade diferente de colunas e precisam ser do mesmo tipo de dado.
SELECT department_id, 
       TO_NUMBER(null) location, hire_date
FROM   employees
UNION
SELECT department_id, location_id,  TO_DATE(null)
FROM   departments;

--Exemplo slide 23
-- o codigo abaixo n�o roda pq o salario � um numero e o '---' � varchar2, portanto o correto � converter o salario para varchar2
SELECT employee_id, job_id,salary
FROM   employees
UNION
SELECT employee_id, job_id,'---'
FROM   job_history;
--exemplo da convers�o:
SELECT employee_id, job_id,TO_CHAR(salary)
FROM   employees
UNION
SELECT employee_id, job_id,'---'
FROM   job_history;


--Exerc�cio 2 slide 25
--Preciso pegar a tabela pais e depois fazer um join entre a tabela locations e departamentos
SELECT country_id, country_name
FROM countries 
MINUS
SELECT c.country_id, country_name
FROM countries c JOIN locations l
ON c.country_id = l.country_id
JOIN departments d
ON l.location_id = d.location_id;

--Exerc�cio 4 slide 25
SELECT employee_id, job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history;



