-- *Modificadores ALL e DISTINCT

-- ALL - opção padrão
-- DISTINCT - mostra somente os valores distintos, repetições não serão mostradas

select distinct job from scott.emp   


-- *Junções naturais e totais (NATURAL e FULL JOINS)

-- Ex. no oracle live
-- EMP and DEPT (SCOTT)
-- Busca dados de tabelas diferentes 

--join
select emp.ename, dept.dname, emp.deptno, dept.deptno
from scott.emp join scott.dept
on (emp.deptno = dept.deptno);

--natural join - o oracle faz a junção automaticamente, não é necessário especificar a condição de junção
-- mas só vale usar a natural join quando as tabelas que fazem parte da junção estiverem relacionadas por uma chave primária e uma chave estrangeira, ou seja, quando houver um relacionamento entre as tabelas.
select ename, dname, deptno
from scott.emp natural join scott.dept



