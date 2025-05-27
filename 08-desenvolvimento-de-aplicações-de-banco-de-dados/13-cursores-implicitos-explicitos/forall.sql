conn scott/tiger
set serveroutput on;

CREATE OR REPLACE PROCEDURE PR_EXEMPLO_mostra IS
        CURSOR func_prod IS
        SELECT empno, ename, sal
        FROM emp
        ORDER BY ename;

TYPE empno_func IS TABELE OF emp.empno%TYPE
INDEX BY BINARY_INTEGER;

TYPE ename_func IS TABELE OF emp.ename%TYPE
INDEX BY BINARY_INTEGER;

TYPE sal_func IS TABELE OF emp.sal%TYPE
INDEX BY BINARY_INTEGER;

v_CODIGO_func empno_func;
v_NOME_func ename_func;
v_sal_func sal_func;

v_INDICE BINARY_INTEGER;

BEGIN       
        OPEN func_prod;
        FETCH func_prod BULK COLLECT INTO v_CODIGO_func, v_NOME_func, v_sal_func;
        CLOSE func_prod;

        FOR v_INDICE IN 1.. v_CODIGO_func.count LOOP
                DBMS_OUTPUT.PUT_LINE (v_CODIGO_func(v_INDICE) || '-' || v_NOME_func(v_INDICE) || 'Salário:' || v_sal_func(v_INDICE));
                                END LOOP;
END;
/

execute PR_EXEMPLO_mostra;



conn scott/tiger
set serveroutput on;

CREATE OR REPLACE PROCEDURE PR_EXEMPLO_atualiza IS
        CURSOR func_prod IS
        SELECT empno, ename, sal
        FROM emp
        ORDER BY ename;

TYPE empno_func IS TABELE OF emp.empno%TYPE
INDEX BY BINARY_INTEGER;

TYPE ename_func IS TABELE OF emp.ename%TYPE
INDEX BY BINARY_INTEGER;

TYPE sal_func IS TABELE OF emp.sal%TYPE
INDEX BY BINARY_INTEGER;

v_CODIGO_func empno_func;
v_NOME_func ename_func;
v_sal_func sal_func;

v_INDICE BINARY_INTEGER;

BEGIN       
        OPEN func_prod;
        FETCH func_prod BULK COLLECT INTO v_CODIGO_func, v_NOME_func, v_sal_func;
        CLOSE func_prod;

        FORall v_INDICE IN 1.. v_CODIGO_func.count
        update emp
        set sal =((v_sal_func(v_INDICE)*10/100) + v_sal_func(v_INDICE))
        where empno=v_CODIGO_func(v_INDICE).
                DBMS_OUTPUT.PUT_LINE ('----Atualizando Registros----');
END;
/

execute PR_EXEMPLO_mostra;
execute PR_EXEMPLO_atualiza;
execute PR_EXEMPLO_mostra;