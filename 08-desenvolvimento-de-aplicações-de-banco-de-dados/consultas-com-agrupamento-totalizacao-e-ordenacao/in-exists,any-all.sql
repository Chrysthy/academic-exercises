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




--All - vai fazer a mesma coisa, serve para o retorno de subconsultas com várias linhas
-- A leitura é de E e todos
--Tem que ser menor que todos os salários de CLERK

select empno, ename, job
from scott.emp
where sal < all
            (select sal 
            from scott.emp 
            where job = 'CLERK')


--Exists - verifica a existência, se existe ou não, a comparação a igualdade de um valor com o outro

select distinct deptno
from scott.emp
where exists (select deptno
              from scott.dept d)
order by deptno;
