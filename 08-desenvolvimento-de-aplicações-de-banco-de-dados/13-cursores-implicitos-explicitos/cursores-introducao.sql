-- Example 1 - cursor implícito

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


-- Example 2 - cursor explícito

ACCEPT p_cargo_func PROMPT 'Digite o CARGO do funcionário '
VARIABLE g_n_ocorrencias NUMBER;
drop table sal_tot;
create table sal_tot (ename VARCHAR2(50), sal_mes number (7,2), sal_tot number (7,2));

DECLARE 
    v_cargo_func emp.job%TYPE := upper ('&p_cargo_func')/
    v_nome_func emp.ename%TYPE;
    v_sal_mes emp.sal%TYPE;
    v_sal_ano number(9,2);

        CURSOR sal_func_cursor IS
                SELECT ename, sal, sal * 12
                FROM emp
                WHERE job = v_cargo_func;
BEGIN
OPEN sal_func_cursor;
            LOOP
FETCH sal_func_cursor INTO v_nome_func, v_sal_mes, v_sal_ano;
EXIT WHEN sal_func_cursor%NOTFOUND;
INSERT INTO sal_tot(ename, sal_mes, sal_tot) VALUES (v_nome_func, v_sal_mes, v_sal_ano);
END LOOP;
    :g_n_ocorrencias := sal_func_cursor%ROWCOUNT;
    CLOSE sal_func_cursor;
END;
/