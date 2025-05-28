select * from emp;
select * from emp order by deptno;

CREATE table dept10 as (select empo, ename, deptno, job from emp);
Truncate table dept10;

ACCEPT p_cargo PROMPT 'Digite o cargo do funcionário ...'

ACCEPT p_deptno PROMPT 'Digite o código do departamento ...'

DECLARE
_empno emp.empno%type;
_ename emp.ename%type;
_deptno emp.deptno%type;
_job emp.job%type;

    CURSOR emp_cursor
    (p_deptno NUMBER, p_job VARCHAR2) IS
        SELECT         empno, ename, deptno, job
        FROM           emp
        WHERE          deptno = p_deptno
        AND            job = p_job;
BEGIN

If not emp_cursor%isopen then
    OPEN emp_cursor(&p_deptno, upper('&p_cargo'));
end if;

        LOOP
    FETCH emp_cursor INTO v_empno, v_ename, v_deptno, v_job;
    EXIT WHEN emp_cursor%NOTFOUND;
INSERT INTO dept10(empno, ename, deptno, job) VALUES (v_empno, v_ename, v_deptno, v_job);
END LOOP;
Close emp_cursor;
END;
/

