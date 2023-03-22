/* 
Por padr�o/default a sequence come�a com 1;
Por padr�o ele o cache � de 20;
MAXVALUE 1X10^27 potencia -> � o valor maximo que ele atinge;
Quando eu defino o MAXVALUE na hr de declarar a sequencia por exemplo MAXVALUE 99 a hora que ele atingir esse valor e se estiver declarado que faz ciclo ele, a sequencia volta para o valor minimo
SEQUENCE trabalha com sequencia negativa;

SEQUENCIA ENTREGA N�MERO INTEIROS; ---> vai cair na CPK




-------------------- dual---------
a tabela dual � 
SELECT 3*2
FROM EMPLOYEES;

SELECT 3*2
FROM DUAL;

*/

--SEQUENCE
CREATE SEQUENCE dept_deptid_seq;

DROP SEQUENCE dept_deptid_seq;

CREATE SEQUENCE dept_deptid_seq
                INCREMENT BY 10
                START WITH 1000
                MINVALUE 1000
                MAXVALUE 1040
                NOCACHE
                CYCLE;
                
INSERT INTO departments(department_id, department_name, location_id)
VALUES       (dept_deptid_seq.NEXTVAL, 'Support', 2500);

SELECT MAX(department_id)
FROM departments;

SELECT dept_deptid_seq.CURRVAL
FROM DUAL;

SELECT dept_deptid_seq.NEXTVAL
FROM DUAL;

--SEQUENCIA QUE O PROFESSOR NA HR PARA EXEMPLIFICAR A CRIA��O DE SHORTNAME DE SEQUENCIAS
SELECT PF0645.SIS3_SEQ.NEXTVAL FROM DUAL;

CREATE SYNONYM SEQ
FOR PF0645.SIS3_SEQ;

SELECT SEQ.NEXTVAL FROM DUAL;




