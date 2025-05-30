-- Determina qual registro queremos que faça, que tenha, que sofra a operação DML

select JOB, SAL from emp;

DECLARE

cursor cursor_ex_atual is
    select ename, job, sal from emp
        for update of sal nowait.

reg_ex_atual cursor_ex_atual%rowtype;

BEGIN

    for reg_ex_atual in cursor_ex_atual loop
        if reg_ex_atual.job = 'CLERK' then
            update emp set sal = sal * 1.10
            where current of cursor_ex_atual;
        elseif reg_ex_atual.job = 'PRESIDENT' then
            update emp set sal = sal + sal
            where current of cursor_ex_atual;
        else 
            delet from emp
            where current of cursor_ex_atual;
        end if;
    end loop;
end;
/

select JOB, SAL from emp;