-- DQL (Projeção)
SELECT last_name from EMPLOYEES;

-- DQL (Seleção)
SELECT last_name from EMPLOYEES WHERE DEPARTMENT_ID = 90;

-- preciso selecionar o nome do departamento e do funcionario (PK = FK)
SELECT last_name, department_name 
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D 
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID 
WHERE D.DEPARTMENT_ID = 90;

-- Tb quero o street address
SELECT last_name, department_name, street_address 
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
JOIN LOCATIONS L
ON L.LOCATION_ID = D.LOCATION_ID
WHERE D.DEPARTMENT_ID = 90;
