--SET SERVEROUTPUT ON (versao completa e a de baixo � a versao curta/abreviado)
SET SERVEROUT ON
--DECLARE 

CL SCR
CLEAR SCREEN

BEGIN 
    dbms_output.PUT_LINE('Boa Noite');
--EXCEPTION 

END;
/
SET SERVEROUT OFF
DESC dbms_output;
-- O DECLARE � OPCIONAL
-- O EXCEPTION TAMB�M � OPCIONAL
-- dbms_output � um procedimento que est� empacotado (PROCEDURE)
-- SE EU EXECUTAR SEM UTILIZR O SET SERVEROUTPUT ON e SET SERVEROUT ON ele n�o vai mostrar no console a mensagem de Boa Noite

DECLARE
    amount INTEGER(10):= 10 ;
BEGIN
    DBMS_OUTPUT.PUT_LINE(amount);
END;
/

----------- capitulo 2 -----------

DECLARE 
    V_EMP_ID NUMBER(5):= 10;
    V_COUNT INT := 1;
    V_TAX NUMBER(3,1) NOT NULL DEFAULT 10;
    C_TAX CONSTANT INT := 23;
BEGIN
    DBMS_OUTPUT.PUT_LINE(V_EMP_ID);
    DBMS_OUTPUT.PUT_LINE(v_count);
    v_count := v_count + 1;
    DBMS_OUTPUT.PUT_LINE(v_count);
    --C_TAX := 30; 
END;
/

-- not null vc precisa atribuir um valor, ou a instru��o n�o ser� executada
-- constant vc n�o pode alterar o valor durante a execu��o do programa e vc tb precisa atribuir um valor, ou a instru��o n�o ser� executada
-- vc pode utulizar DEFAULT no lugar de := apenas dentro do bloco de instru��o DECLARE, fora disso ele d� erro
-- para trabalhar com variaveis de fora, que eu recebo, apenas para simular como daria para trabalhar:

ACCEPT P_EMP_ID PROMPT 'INFORME O N�MERO DO FUNCION�RIO'
ACCEPT P_LAST_NAME PROMPT 'INFORME O NOME DO FUNCION�RIO'
DECLARE 
    V_EMP_ID NUMBER(5):= &P_EMP_ID;
    V_LN VARCHAR(100) := initcap('&P_LAST_NAME');
    V_COUNT INT := 1;
    V_TAX NUMBER(3,1) NOT NULL DEFAULT 10;
    C_TAX CONSTANT INT := 23;
BEGIN
    DBMS_OUTPUT.PUT_LINE(V_EMP_ID);
    DBMS_OUTPUT.PUT_LINE(v_count);
    DBMS_OUTPUT.PUT_LINE('O NOME DO FUNCION�RIO �: '||V_LN);
    v_count := v_count + 1;
    DBMS_OUTPUT.PUT_LINE(v_count);
END;
/