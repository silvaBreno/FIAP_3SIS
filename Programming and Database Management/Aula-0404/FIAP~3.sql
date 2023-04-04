--a clausula if tem por objetivo tentar entregar um comando mais rapido por sele��o
--tentar, porque geralmente usamos jun��o e nem sempre ela � mais rapida
--� MAIS RAPIDO PORQUE TRABALHA COM TEMPO DE EXECU��O EM MEMORIA
-- A CLAUSULA WITH CRIA UM VIS�O TEMPORARIA EM TEMPO DE EXECU��O (GLOBAL TEMPORARY TABLE, ELA S� EXISTE EM TEMPO DE EXECU��O)
WITH 
    EMP AS (SELECT * FROM EMPLOYEES)
    --como eu ja tenho minha vis�o criada, vou consumir da minha vis�o
SELECT LAST_NAME FROM EMP;

--EU CRIO UM A VIS�O EM TEMPO DE EXECU��O E J�  CONSUMO ELA
CREATE OR REPLACE VIEW
    EMP AS (SELECT * FROM EMPLOYEES);
SELECT LAST_NAME FROM EMP;

--outro exemplo
SELECT DEPARTMENT_NAME, LAST_NAME
FROM   EMPLOYEES E JOIN DEPARTMENTS D
ON     (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
WHERE  D.DEPARTMENT_ID = 90;
--A IDEIA � TRANSFORMAR A INSTRU��O ACIMA EM WITH
WITH
    --PRIMEIRA VIS�O
    EMP AS (SELECT LAST_NAME, DEPARTMENT_ID DEPT_ID FROM EMPLOYEES),
    --SEGUNDA VIS�O PARA JUSTAMENTE PERMITIR QUE EU FA�A O JOIN
    DEPT AS (SELECT DEPARTMENT_ID DEPT_ID, DEPARTMENT_NAME FROM DEPARTMENTS)
SELECT DEPARTMENT_NAME, LAST_NAME
FROM EMP E JOIN DEPT D
ON (D.DEPT_ID = E.DEPT_ID)
WHERE D.DEPT_ID = 90;