CREATE OR REPLACE FUNCTION validar_rg(p_rg IN VARCHAR2) RETURN BOOLEAN IS
  v_rg VARCHAR2(9);
  v_soma NUMBER := 0;
  v_digito NUMBER;
BEGIN
  -- Remove os caracteres especiais do RG (se houver)
  v_rg := REGEXP_REPLACE(p_rg, '[^0-9]', '');

  -- Verifica se o RG possui exatamente 9 d�gitos
  IF LENGTH(v_rg) <> 9 THEN
    RETURN FALSE;
  END IF;

  -- Calcula a soma dos d�gitos conforme as regras espec�ficas
  FOR i IN 1..8 LOOP
    v_soma := v_soma + TO_NUMBER(SUBSTR(v_rg, i, 1)) * (10 - i);
  END LOOP;

  -- Calcula o d�gito verificador esperado
  v_digito := MOD(v_soma, 11);

  -- Verifica se o d�gito verificador coincide
  IF v_digito = 10 THEN
    -- Caso o resto seja 10, o d�gito verificador deve ser 'X'
    IF SUBSTR(v_rg, 9, 1) = 'X' THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  ELSE
    IF v_digito = TO_NUMBER(SUBSTR(v_rg, 9, 1)) THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  END IF;
END;
/

DECLARE
  v_resultado BOOLEAN;
  v_meu_rg VARCHAR2(9) := '379223090'; -- Substitua pelo RG
BEGIN
  v_resultado := validar_rg(v_meu_rg);

  IF v_resultado THEN
    DBMS_OUTPUT.PUT_LINE('O RG � v�lido!');
  ELSE
    DBMS_OUTPUT.PUT_LINE('O RG � inv�lido!');
  END IF;
END;



DECLARE
  v_resultado BOOLEAN;
  v_meu_cpf VARCHAR2(11) := '44176313870'; -- Substitua pelo seu CPF
BEGIN
  v_resultado := validar_cpf(v_meu_cpf);

  IF v_resultado THEN
    DBMS_OUTPUT.PUT_LINE('O CPF � v�lido!');
  ELSE
    DBMS_OUTPUT.PUT_LINE('O CPF � inv�lido!');
  END IF;
END;










