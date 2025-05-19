-- Nós podemos criar procedures e functions com o mesmo nome e pode ter significados e instruções diferentes. Então tendo o mesmo nome
-- chama-se overload de procedures e functions

CREATE OR REPLACE PACKAGE soma_tudo instruções
    FUNCTION soma (
        x IN NUMBER,
        y IN NUMBER
    )
    RETURN NUMBER;


    FUNCTION soma (
        x IN VARCHAR2,
        y IN VARCHAR2
    )
    RETURN VARCHAR2;


    FUNCTION soma (
        x IN NUMBER,
        y IN VARCHAR2
    )
    RETURN VARCHAR2;


    FUNCTION soma (
        x IN VARCHAR2,
        y IN NUMBER
    )
    RETURN VARCHAR2;
END soma_tudo;
/

-- corpo
CREATE OR REPLACE PACKAGE BODY soma_tudo instruções IS 
    FUNCTION soma (
        x IN NUMBER,
        y IN NUMBER
    )
    RETURN NUMBER IS 
    BEGIN
        RETURN x + y;
    END;


   FUNCTION soma (
        x IN VARCHAR2,
        y IN VARCHAR2
    )
    RETURN VARCHAR2 IS
    BEGIN
        RETURN x || y;
    END;


    FUNCTION soma (
       x IN NUMBER,
       y IN VARCHAR2
    )
    RETURN VARCHAR2 IS
    BEGIN
        RETURN soma(TO_CHAR(x), y);
    END;


    FUNCTION soma (
        x IN VARCHAR2,
        y IN NUMBER
    )
    RETURN VARCHAR2 IS
    BEGIN
        RETURN soma(x, TO_CHAR(y));
    END;
END soma_tudo;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE('3 + 4' || soma_tudo.soma(3,4));
    DBMS_OUTPUT.PUT_LINE('''3'' + ''4'' = '|| soma_tudo.soma('3','4'));
    DBMS_OUTPUT.PUT_LINE('3 + ''4'' = ' || soma_tudo.soma('3','4'));
    DBMS_OUTPUT.PUT_LINE('''3'' + 4 = ' || soma_tudo.soma('3','4'));
END;
/
