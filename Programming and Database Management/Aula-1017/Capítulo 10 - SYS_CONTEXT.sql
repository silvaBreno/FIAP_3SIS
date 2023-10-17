--nome do servidor
SELECT SYS_CONTEXT ('USERENV', 'SERVER_HOST') 
FROM DUAL;
--nome do user
SELECT SYS_CONTEXT ('USERENV', 'SESSION_USER') 
FROM DUAL;
--o nome do host que estou
SELECT SYS_CONTEXT ('USERENV', 'HOST') 
FROM DUAL;
--IP da maquina q ta executando
SELECT SYS_CONTEXT ('USERENV', 'IP_ADDRESS') 
FROM DUAL;
--usuario do sistema operacional
SELECT SYS_CONTEXT ('USERENV', 'OS_USER') 
FROM DUAL;
-- programa que está executando
SELECT SYS_CONTEXT ('USERENV', 'MODULE') 
FROM DUAL;
--nome do software que está executando
SELECT SYS_CONTEXT ('USERENV', 'CLIENT_PROGRAM_NAME') 
FROM DUAL;
--para saber onde o oracle esta instalado
SELECT SYS_CONTEXT ('USERENV', 'ORACLE_HOME') 
FROM DUAL;

SELECT * FROM v$session
WHERE MACHINE LIKE ''; 