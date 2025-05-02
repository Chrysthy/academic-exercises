--Rollup
-- Calcula os subtotais daquela coluna e o total geral.
-- Faz a totalização dos valores.

select deptno, job, sum(sal) from scott.emp 
group by rollup (deptno, job)
order by deptno, job;
