/* Capitulo 1 - Subconsultas.pdf - pag. 24 */

--1
-- exemplo a)
SELECT last_name, hire_date
FROM employees
WHERE department_id in (select department_id
                       from employees
                       where last_name = 'King')
AND last_name <> 'Zlotkey';

-- exemplo b)
UNDEFINE v_ln
SELECT last_name, hire_date
FROM employees
WHERE department_id in (select department_id
                       from employees
                       where last_name = initcap('&&v_ln'))
AND last_name <> initcap('&v_ln');

--exercicio 2
SELECT employee_id, last_name,salary
FROM employees
WHERE salary > (SELECT AVG(salary)
                 FROM   employees)
ORDER BY salary ASC;

--exercicio 3
--vamos pegar o department_id
SELECT employee_id, last_name
FROM employees
WHERE department_id in (SELECT department_id
                     FROM employees
                     WHERE LOWER(last_name) LIKE '%u%');
--converto o last_name para minisculo para incluir as pessoas que começam com a letra U

--exercicio 4
--modo 1 de resolver
SELECT last_name, department_id, job_id
FROM employees
WHERE department_id IN (SELECT department_id
                     FROM departments
                     WHERE location_id = 1700);
                     
--modo 2 de resolver
SELECT last_name, d.department_id, job_id
FROM employees e JOIN departments d
ON d.department_id = e.department_id
WHERE location_id = 1700;

----no oracle o desempenho é igual, pois a oracle sabe escolher o melhor plano de execução
--porém, em geral as subqueries são menos performáticas
--em outros sgbd a performance muito provavelmente será pior
--dê preferência para junção (JOIN)

--5
SELECT last_name, salary
FROM employees
WHERE manager_id = (SELECT employee_id
                    FROM employees
                    WHERE first_name = 'Steven' and last_name = 'King');
--6

--7
SELECT employee_id, last_name
FROM employees
WHERE department_id in (SELECT department_id
                        FROM employees
                        WHERE LOWER(last_name) like '%u%')
                    and SALARY > (SELECT AVG(SALARY)
                                  FROM employees);
                                  
                                  
                                  
                                  
                                  