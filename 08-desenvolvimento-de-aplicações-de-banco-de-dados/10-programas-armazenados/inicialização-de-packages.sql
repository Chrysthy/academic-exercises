-- Tratamento de erro que são as exceptions
CREATE OR REPLACE PACKAGE pkg_dividir AS
    FUNCTION divide
    RETURN NUMBER;
END pkg_dividir;
/


CREATE OR REPLACE PACKAGE BODY pkg_dividir AS
    FUNCTION divide
    RETURN 
        NUMBER
    IS
        x number := 10;
        y number := 5;
        resultado number;
        begin
                resultado := y / x;
                return resultado;
        EXCEPTION
                WHEN ZERO_DIVIDE then
                Dbms_output.put_line ('Não é possível dividir por zero');
        END;
END pkg_dividir;
/

select (pkg_dividir.divide) from dual;