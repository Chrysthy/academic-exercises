-- Loop

-- Loop é uma estrutura de repetição que executa um bloco de código enquanto uma condição for verdadeira.

conn system/manager

set serveroutput on;

DECLARE 
    FATORIAL NUMBER := 1;
    N NUMBER;
    I NUMBER := 0;
BEGIN
    N := 6;
    I := N;

    LOOP

        IF I <= 1 THEN
            EXIT;
        END IF;
        FATORIAL := FATORIAL * I;
        I := I - 1;
    END LOOP;
       DBMS_OUTPUT.PUT_LINE('Fatorial de ' || N || ' é: ' || FATORIAL);
END;
/ 
