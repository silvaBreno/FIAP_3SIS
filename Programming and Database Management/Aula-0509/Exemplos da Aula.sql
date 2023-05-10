-- exemplo 1
BEGIN
    FOR v_count in 1 .. 10 LOOP
        IF MOD(v_count, 2) = 0 THEN
            dbms_output.put_line(v_count);
        END IF;
    END LOOP;
END;
/
-- exemplo 2 
DECLARE
    vi number(3,1) := 1;
    vf number(3,1) := 10;
BEGIN
    FOR v_count in vi .. vf LOOP
        dbms_output.put_line(v_count);
    END LOOP;
END;
/
-- nesse caso ele vai arredondar para inteiro os valores caso eu passe um decimal/double
DECLARE
    vi number(3,1) := 1.2;
    vf number(3,1) := 10.7;
BEGIN
    FOR v_count in vi .. vf LOOP
        dbms_output.put_line(v_count);
    END LOOP;
END;
/

-- exemplo 3

DECLARE
    vi number(3,1) := 1.2;
    vf number(3,1) := 10.7;
    v_count varchar(1) := 'X';
BEGIN
    dbms_output.put_line(v_count);
    FOR v_count IN ROUND(vi,0) .. vf LOOP
        dbms_output.put_line(v_count);
    END LOOP;
    dbms_output.put_line(v_count);
END;
/

-- exemplo 4
--nesse caso nao vai exibir nada, ele até funciona mas como o vf é maior do que vi não exibe nada
DECLARE
    vi number(3,1) := 1.2;
    vf number(3,1) := 10.7;
    -- v_count varchar(1) := 'X';
BEGIN
    FOR v_count IN vf .. vi LOOP
        dbms_output.put_line(v_count);
    END LOOP;
END;
/

-- podemos arrumar usando um reverse e trocando o vf por vi, a saida vai ser inversa
DECLARE
    vi number(3,1) := 1.2;
    vf number(3,1) := 10.7;
    -- v_count varchar(1) := 'X';
BEGIN
    FOR v_count IN REVERSE vi .. vf LOOP
        dbms_output.put_line(v_count);
    END LOOP;
END;
/