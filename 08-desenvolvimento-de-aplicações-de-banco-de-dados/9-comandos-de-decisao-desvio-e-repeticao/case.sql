-- Case 
-- O comando CASE é utilizado para executar um bloco de código baseado em uma condição específica.

DECLARE 
    a NUMBER;
    b NUMBER;
BEGIN
    a := NULL;
    b := 0;
    
    CASE
        WHEN a = b THEN
        DBMS_OUTPUT.PUT_LINE('A é igual a B');
        WHEN a > b THEN
        DBMS_OUTPUT.PUT_LINE('A é maior que B');
        WHEN a < b THEN
        DBMS_OUTPUT.PUT_LINE('A é menor que B');
        WHEN (a IS NULL OR b IS NULL) THEN
        DBMS_OUTPUT.PUT_LINE('Pelo menos um valor é nulo');
        ELSE
        DBMS_OUTPUT.PUT_LINE('Ooooopsss"');
    END CASE;
END;