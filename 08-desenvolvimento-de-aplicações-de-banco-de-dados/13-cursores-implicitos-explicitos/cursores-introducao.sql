-- Example 1

conn scott/tiger

select * from emp

set serveroutput on;

VARIABLE linhas_deletadas VARCHAR2(30)
DECLARE
    v_deptno NUMBER := 10;
BEGIN
    DELETE FROM emp 
    WHERE v_deptno = v_deptno;
    :linhas_deletadas := (SQL%ROWCOUNT || 'linhas deletadas');
END;
/

print linhas_deletadas
rollback;
