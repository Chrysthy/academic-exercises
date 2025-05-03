-- Loop

-- No Loop ao menos uma vez será executado, independete da condição ser falta ou veraddeira 

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


--Examplo 3
-- Criando uma tabela loop aninhado

conn system/manager

create table loop_aninhados (
    contador number, nome varchar2(100)
);

DECLARE
    v_cont1 number := 1;
    v_nome1 varchar2(100):= 'Loop 1';
    v_cont2 number := 7;
    v_nome2 varchar2(100):= 'Loop 2';
       
BEGIN
    LOOP
        INSERT INTO loop_aninhados (contador, nome) 
        VALUES (v_cont1, v_nome1);
        v_cont1 := v_cont1 + 1;
        EXIT WHEN v_cont1 > 5;  -- condição de saída do loop externo
    END LOOP;

       
        LOOP
            INSERT INTO loop_aninhados (contador, nome) 
            VALUES (v_cont2, v_nome2);
            v_cont2 := v_cont2 + 1;
            EXIT WHEN v_cont2 > 9;     --Condição de saída do loop externo     
        END LOOP;

END;
/

set linsize 200;

select * from loop_aninhados;