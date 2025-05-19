CREATE OR REPLACE FUNCTION fatorial_func_rec (
    n IN NUMBER
)
RETURN NUMBER
IS
BEGIN
    IF n = 2 THEN
        RETURN 2;
    ELSE
        RETURN n * fatorial_func_rec(n - 1);
    END IF;
END;
/

select fatorial_func_rec(5) from dual;