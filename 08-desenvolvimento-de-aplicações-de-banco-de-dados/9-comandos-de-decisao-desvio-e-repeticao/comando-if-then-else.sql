-- Comandos de Decisão, Desvio e Repetição

-- Comando IF THEN ELSE

DECLARE 
    a NUMBER;
    b NUMBER;
BEGIN
    a := 10;
    b := 20;
    
    IF a = b THEN
        DBMS_OUTPUT.PUT_LINE('A é igual a B');
    ELSIF a > b THEN
        DBMS_OUTPUT.PUT_LINE('A é maior que B');
    ELSIF a < b THEN
        DBMS_OUTPUT.PUT_LINE('A é menor que B');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Ooooopsss"');
    END IF;
END;