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


--Examplo 2
-- Criando uma tabela de exemplo para o loop
conn system/manager

create table teste_loop (
    id number, nome varchar2(50)
);

DECLARE
    v_counter number := 1;
    v_nome varchar2(10):= 'Teste Loop';
BEGIN
    LOOP
        INSERT INTO teste_loop (id, nome) VALUES (v_counter, v_nome);
        v_counter := v_counter + 1;
        
    EXIT WHEN v_counter > 5; -- Condição de saída do loop

    END LOOP;
END;
/

select * from teste_loop;
