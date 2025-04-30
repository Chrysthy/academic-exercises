--Ordenação de consultas (cláusula ORDER BY)
-- A cláusula ORDER BY é utilizada para ordenar os resultados de uma consulta SQL. 
-- A ordenação pode ser feita em ordem crescente (ASC) ou decrescente (DESC). Por padrão, a ordenação é feita em ordem crescente.
-- A cláusula ORDER BY deve ser a última cláusula da consulta SQL.

select ename,sal from scott.emp
order by ename asc;

select ename,sal from scott.emp
order by sal desc;

-- ordernar por mais de uma coluna
select ename, deptno, sal
from scott.emp
order by deptno, sal desc;

-- ordena o departamento em ordem crescente e o salário em ordem decrescente

