-- Example 1
-- A trigger não é um objeto que mandamos executar. Quando vc gera, ela começa a monitorar a ocorrencia do evento
-- Uma das desvantagens é a queda de performace no banco, quanto mais triggers menos performace vai ter.

conn scott/tiger

CREATE OR REPLACE TRIGGER restringe_salario
BEFORE Insert or Update OF sal ON emp 
FOR EACH ROW
BEGIN
If not (:new.job in ('PRESIDENT', 'SALES')) And :new.sal > 15000 Then
                RAISE_APPLICATION_ERROR(-20202, 'O funcionário não pode ter ese aumento de salário');
END IF;
    END;
/


-- Testando gatilho
insert into emp (empno, ename, job, sal, deptno) values (135, 'MARCOS', 'CLERK', 15010, 10); -- ativa a trigger
insert into emp (empno, ename, job, sal, deptno) values (135, 'MARCOS', 'SALES', 15010, 10); -- não ativa a trigger

select * from emp where empno=135;

update emp
set sal = 20000
where empno=7788;

select job from emp where empno=7788; 

alter session set nls_date_format - 'DY HH24:MI';

-- Example 2

CREATE OR REPLACE TRIGGER seguro_emp
BEFORE Insert ON SCOTT.emp
BEGIN   
    if(TO_CHAR(SYSDATE, 'DY') IN ('SAB', 'DOM')) OR (TO_CHAR(SYSDATE, 'HH24:MI')
    BETWEEN '08:00' AND '17:00') Then
RAISE_APPLICATION_ERROR(-20500, 'Inscrições de funcionários somente dora do horário comercial');
    end if;
    end;

/

--para ver que dia e horas
select TO_CHAR(SYSDATE, 'dd/mm/yyyy-hh24:mi:ss') from dual;


insert into SCOTT.emp(empno, ename, sal, deptno) values (7935, 'SANDRA', 1203, 10);; -- ativa a trigger
