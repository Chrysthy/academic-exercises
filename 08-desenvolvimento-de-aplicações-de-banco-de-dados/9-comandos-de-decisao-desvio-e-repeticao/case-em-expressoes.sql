-- Case em expressões

-- Example 2
-- Case em expressões

SET SERVEROUTPUT ON;

DECLARE 
    dia NUMBER;
    nome VARCHAR2(100);
BEGIN
    dia := 5;
    nome := CASE dia
        WHEN 1 THEN 'Domingo'
        WHEN 2 THEN 'Segunda-feira'
        WHEN 3 THEN 'Terça-feira'
        WHEN 4 THEN 'Quarta-feira'
        WHEN 5 THEN 'Quinta-feira'
        WHEN 6 THEN 'Sexta-feira'
        WHEN 7 THEN 'Sábado'
        ELSE 'Não é um número de dia válido'
    END;
    
    DBMS_OUTPUT.PUT_LINE(nome);
END;
/