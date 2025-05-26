conn scott/tiger
set serveroutput on;

CREATE OR REPLACE PROCEDURE PR_EXEMPLO_05 IS
        CURSOR func_prod IS
        SELECT empno, ename
        FROM emp
        ORDER BY ename;

TYPE empno_func IS TABELE OF emp.empno%TYPE
INDEX BY BINARY_INTEGER;

TYPE ename_func IS TABELE OF emp.ename%TYPE
INDEX BY BINARY_INTEGER;

v_CODIGO_func empno_func;
v_NOME_func ename_func;

v_INDICE BINARY_INTEGER;

BEGIN       
        OPEN func_prod;
        FETCH func_prod BULK COLLECT INTO v_CODIGO_func, v_NOME_func;
        CLOSE func_prod;

        FOR v_INDICE IN 1.. v_CODIGO_func.count LOOP
                DBMS_OUTPUT.PUT_LINE (v_CODIGO_func(v_INDICE) || '-' || v_NOME_func(v_INDICE));
                                END LOOP;
END;
/

execute PR_EXEMPLO_05;