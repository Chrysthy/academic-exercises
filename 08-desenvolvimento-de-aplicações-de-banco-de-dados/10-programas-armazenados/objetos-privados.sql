-- É um são declarados no corpo do pacote, chamadas de variáveis locais.

CREATE OR REPLACE PACKAGE pkg_string_func AS 
    FUNCTION get_cont_localiza
    RETURN NUMBER;
END pkg_string_func;
/

CREATE OR REPLACE PACKAGE BODY pkg_string_func AS 
    -- Esta variável é local
    chamadas_localiza NUMBER := 0;

    FUNCTION get_cont_localiza
    RETURN  
        NUMBER
    IS
    BEGIN
        chamadas_localiza:=chamadas_localiza+1;
        RETURN chamadas_localiza;
        END;
END pkg_string_func;
/

-- bloco anônimo para saber quantas vezes a function foi chamada.

SET SERVEROUTPUT ON;
declare
v_recebe number;
BEGIN   
    select (pkg_string_func.get_cont_localiza) into v_recebe from dual;
    dbms_output.put_line('O valor da variável local é: ' || v_recebe);
END;
/