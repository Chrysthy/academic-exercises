-- For
SET SERVEROUTPUT ON;

DECLARE
    fatorial NUMBER := 1;
    n NUMBER;
BEGIN
    n := 6;
    FOR i IN 1..n LOOP
        fatorial := fatorial * i;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Fatorial de ' || n || ' é ' || fatorial);
END;
/


--Example 2  com tabela
create table item (ordid number(5), itemd number(5));

DECLARE
    v_ordid NUMBER := 601;
BEGIN
    FOR i IN 1..10 LOOP
        INSERT INTO item (ordid, itemd) 
        VALUES (v_ordid, i);
    END LOOP;
END;
/

select * from item;


-- Example 3 reversivo
create table item2 (ordid number(5), itemd number(5));

DECLARE
    v_ordid NUMBER := 602;
BEGIN
    FOR i IN REVERSE 1..10 LOOP
        INSERT INTO item2 (ordid, itemd) 
        VALUES (v_ordid, i);
    END LOOP;
END;
/

select * from item2;