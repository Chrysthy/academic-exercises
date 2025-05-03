-- While
-- Só entra no loop se a primeira condição for verdadeira
conn system/manager

set serveroutput on;

DECLARE 
    n NUMBER;
    i NUMBER;
    fatorial NUMBER := 1;
BEGIN   
    n := 6;
    i := n;
    WHILE i > 1 LOOP
        fatorial := fatorial * i;
        i := i - 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Fatorial de ' || n || ' é ' || fatorial);
END;
/


--Example2

-- Primeiro comando no executar linha de comando SQL
set serveroutput on;

ACCEPT p_voltas PROMPT 'Digite o número de voltas do laço: '

-- Segundo comando no executar linha de comando SQL
DECLARE 
    v_count NUMBER(10) := 1;
BEGIN
    WHILE v_count <= &P_VOLTAS LOOP
        DBMS_OUTPUT.PUT_LINE('Valor do contador... ' || v_count);
        v_count := v_count + 1;
    END LOOP;
END;
/


-- Example 3 - condição sem falsa
-- Se a condição for falsa, o loop não é executado
-- Colocando o valor 0, o loop não é executado