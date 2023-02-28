SELECT LAST_NAME 
FROM EMPLOYEES
WHERE SALARY > 5000;

/* QUERO UMA LISTA DE SALARIO QUE TEM O SALARIO MAIOR DO QUE O SALARIO DO ABEL
O servidor executa primeiro a subquery e manda a info para query anterior */ 

SELECT LAST_NAME
FROM EMPLOYEES
WHERE SALARY > (SELECT SALARY
                FROM EMPLOYEES
                WHERE LAST_NAME = 'King');
                
/* */                
SELECT COUNT(*)
FROM EMPLOYEES;

/* EU QUERO EXIBIR A QUANTIDADE DE FUNCIONARIOS AGREGADO POR DEPARTAMENTO-ID*/

SELECT DEPARTMENT_id, COUNT(*)
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (10,20, 30, 40, 80, 90)
GROUP BY DEPARTMENT_ID;

/* WHERE (ONDE) VOCE USA PARA COLUNA */
/* HAVING (TENDO) FUNÇÃO, AGREGAÇÃO */ 
/* SEMPRE FILTRAR ANTES E DPS USO O HAVING PARA AGREGAR*/ 

SELECT DEPARTMENT_id, COUNT(*)
FROM EMPLOYEES
--WHERE DEPARTMENT_ID IN (10,20, 30, 40, 80, 90)
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) > 5;

/* QUERO UMA LISTA DE SALARIO QUE TEM O SALARIO MAIOR DO QUE O SALARIO DO ABEL
O servidor executa primeiro a subquery e manda a info para query anterior */ 
SELECT last_name
FROM   employees
WHERE  salary >
               (SELECT salary
                FROM   employees
                WHERE  last_name = 'Abel');

-------------------------------------------------
/* A query principal executa apenas uma vez */ 
SELECT last_name, job_id, salary
FROM   employees
WHERE  job_id =  
                (SELECT job_id
                 FROM   employees
                 WHERE  employee_id = 141)
AND    salary >
                (SELECT salary
                 FROM   employees
                 WHERE  employee_id = 143);

-------------------------------------------------
SELECT last_name, job_id, salary
FROM   employees
WHERE  salary = 
                (SELECT MIN(salary)
                 FROM   employees);
                 
SELECT last_name, job_id, salary
FROM   employees
WHERE  salary = 
                (SELECT MAX(salary)
                 FROM   employees);
                 
SELECT last_name, job_id, salary
FROM   employees
WHERE  salary > 
                (SELECT AVG(salary)
                 FROM   employees);

-------------------------------------------------
SELECT   department_id, MIN(salary)
FROM     employees
GROUP BY department_id
HAVING   MIN(salary) >
                       (SELECT MIN(salary)
                        FROM   employees
                        WHERE  department_id = 50);

------------------------------------------------- 
/* nao funciona porque a subquery retorna uma lista e não apenas uma informação*/ 

SELECT employee_id, last_name
FROM   employees
WHERE  salary =
                (SELECT   MIN(salary)
                 FROM     employees
                 GROUP BY department_id);
                 
/* para funcionar precisamos usar um operador de lista*/  
SELECT employee_id, last_name
FROM   employees
WHERE  salary IN
                (SELECT   MIN(salary)
                 FROM     employees
                 GROUP BY department_id);
-------------------------------------------------

/* Se um subquery nao retornar nenhum valor, ou seja, que retorna nulo, a query dá nula*/ 
/* Neste caso, portanto, não existe um funcionário com o last_name Haas*/  
SELECT last_name, job_id
FROM   employees
WHERE  job_id =
                (SELECT job_id
                 FROM   employees
                 WHERE  last_name = 'Haas');

-------------------------------------------------
/* aqui ele puxa para qualquer um, repare que todos sao menores do que 9000 */  
SELECT employee_id, last_name, job_id, salary
FROM   employees
WHERE  salary < ANY
                    (SELECT salary
                     FROM   employees
                     WHERE  job_id = 'IT_PROG')
AND    job_id <> 'IT_PROG';
-----------------------------------------------

SELECT employee_id, last_name, job_id, salary
FROM   employees
WHERE  salary < ALL
                    (SELECT salary
                     FROM   employees
                     WHERE  job_id = 'IT_PROG')
AND    job_id <> 'IT_PROG';

-------------------------------------------------
SELECT employee_id, last_name, job_id, salary
FROM   employees
WHERE  salary < ANY
                    (SELECT salary
                     FROM   employees
                     WHERE  job_id = 'IT_PROG')
AND    job_id <> 'IT_PROG';

                
/* pegar o exemplo de cima e pega o maior da lista e separa do restante */
SELECT employee_id, last_name, job_id, salary
FROM   employees
WHERE  salary <
                    (SELECT MAX(SALARY)
                    FROM EMPLOYEES
                    WHERE JOB_ID = 'IT_PROG')
AND    job_id <> 'IT_PROG';
-------------------------------------------------
SELECT emp.last_name
FROM   employees emp
WHERE  emp.employee_id NOT IN
                           (SELECT mgr.manager_id
                            FROM   employees mgr
                            where mgr.manager_id is not null);
-------------------------------------------------

select last_name, job_id
from employees
where manager_id is null;
