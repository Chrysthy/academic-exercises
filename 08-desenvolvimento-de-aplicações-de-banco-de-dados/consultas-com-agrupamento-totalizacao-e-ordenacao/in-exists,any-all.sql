--Operadores IN, EXISTS, ANY e ALL

--Any - funciona como um OU ou qualquer
--Ela retorna uma lista de salários de todos os funcionários que são CLERKs.
-- E depois retorna os funcionários que têm salário menor do que qualquer um dos salários de CLERK.
--A consulta retorna os funcionários que não são CLERK e têm salário menor que pelo menos um CLERK.

select empno, ename, job
from scott.emp
where sal < any 
            (select sal 
            from scott.emp 
            where job = 'CLERK')
and job <> 'CLERK'





