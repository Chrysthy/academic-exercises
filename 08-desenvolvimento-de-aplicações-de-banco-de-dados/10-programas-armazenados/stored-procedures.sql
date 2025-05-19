conn scott/tiger

select empno, ename, sal from emp where empno=7934;

CREATE OR REPLACE PROCEDURE reajuste
(v_codigo_emp IN emp.empno%type,
 v_porcentagem IN number)

 IS
 BEGIN
        UPDATE emp
            SET sal = sal +  (sal * (v_porcentagem / 100))
            where empno = v_codigo_emp;
            COMMIT;
END reajuste;
/

execute reajuste(7934,10);

select empno, ename, sal from emp where empno=7934;