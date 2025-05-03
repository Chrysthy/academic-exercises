-- Go to
-- O comando GOTO é utilizado para desvio de fluxo, porém não é a melhor estrutura para fazer desvios.

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