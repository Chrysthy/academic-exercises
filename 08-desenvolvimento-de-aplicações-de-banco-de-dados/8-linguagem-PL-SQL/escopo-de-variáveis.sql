-- Escopo de variáveis

SET SERVEROUTPUT ON
DECLARE --bloco 1
    valor1 number(2) :=7;
    valor2 number(2) :=13;
BEGIN --bloco 1
    DECLARE --bloco 2
        valor1 varchar2(30) := 'Valor 1 do bloco 2';
    BEGIN --bloco 2
        DECLARE --bloco 3
           valor1 date := sysdate;
        BEGIN --bloco 3
         dbms_output.put_line('Valor 1 do bloco 2... ' || valor1); -- 7
        END; --bloco 3
        dbms_output.put_line('Valor 1 do bloco 2... ' || valor1); -- Valor 1 do bloco 2
        END; --bloco 2
    dbms_output.put_line('Valor 1 do bloco 1... ' || valor1); -- bloco 1
    END
    /