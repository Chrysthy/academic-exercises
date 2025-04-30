-- Grouo By
-- O GROUP BY é utilizado para agrupar os resultados de uma consulta com base em uma ou mais colunas. Podemos fazer grupos de dados e aplicar funções em cima desses grupos.

select ename, sal, hiredate, deptno, job, comm from scott.emp;

-- max - retorna o maior valor 
-- min - retorna o menor valor
-- sum - retorna a soma dos valores. Total.
select max(sal), min(sal), sum(sal) from scott.emp;

-- Consegue trabalhar com números e datas
select max(hiredate), min(hiredate)
from scott.emp;

-- Consegue trabalhar com caracteres
select max(ename), min(ename) from scott.emp;