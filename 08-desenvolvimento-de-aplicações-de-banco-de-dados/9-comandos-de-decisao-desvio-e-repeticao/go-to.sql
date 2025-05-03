-- Go to
-- O comando GO TO é utilizado para desvio de fluxo, porém não é a melhor estrutura para fazer desvios.

conn system/manager

set serveroutput on;

DECLARE
    fatorial NUMBER := 1;
    n NUMBER;
    i NUMBER := 0;
BEGIN
    n := 6;
    i := n;

    <<inicio_loop>>

    IF i >= 1 THEN
        fatorial := fatorial * i;
        i := i - 1;
        GOTO inicio_loop; -- Desvio de fluxo
    END IF;
       DBMS_OUTPUT.PUT_LINE('Fatorial de ' || n || ' é: ' || fatorial);
END;
/


-- Example 2
DECLARE 
    FATORIAL NUMBER := 1;
    N NUMBER;
    I NUMBER := 0;
BEGIN
    N := 5;
    I := N;

    <<inicio_loop>>

    IF I >= 1 THEN
        FATORIAL := FATORIAL * I;
        I := I - 1;
        GOTO inicio_loop; -- Desvio de fluxo
    END IF;
       DBMS_OUTPUT.PUT_LINE('Fatorial de ' || N || ' é: ' || FATORIAL);
END;
/

-- Fatorial é 5 != 5 * 4 * 3 * 2 * 1 = 120
