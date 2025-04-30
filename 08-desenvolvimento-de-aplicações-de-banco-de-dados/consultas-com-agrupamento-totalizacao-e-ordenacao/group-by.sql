-- Group By
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


-- função count - contagem de valores, elementos. Quantas linhas.

select count(*) 
from scott.emp;
-- conta todas as linhas da tabela.

select count(comm) 
from scott.emp;
-- quantos valores existem na coluna comm.


select count(*) 
from scott.emp
where deptno = 30; 
-- conta a quamtidade de linhas do departamento 30. Quantos funcionários existem no departamento 30.


select count(ename), count(comm) 
from scott.emp;
-- conta quantos nomes existem e quantos valores existem na coluna comm.



--Agrupamentos dentro da tabela.
-- formar um grupo dentro da tabela.
select deptno, sal, from scott.emp order by deptno;

select deptno, sum(sal) from scott.emp group by deptno order by deptno;


-- Podemos formar subgrupos
--Criamos um grupo do departamento e dentro do departamento o subgrupo.
select deptno, job, sal, from scott.emp order by deptno;

select deptno, job, sum(sal) from scott.emp group by deptno, job 
order by deptno, job;


-- podemos colocar parenteses
select deptno, job, sum(sal) 
from scott.emp 
group by (deptno, job)
order by deptno, job;