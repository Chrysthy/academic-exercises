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


-- para simplificar a digitação do comando, principalmente na hora de identificar o campo, damos apelidos para as tabelas
-- o uso dos apelido não é obrigatório, mas é uma boa prática de programação, para facilitar a nossa vida quando digitamos o comando e principalmente quando as tabelas são grandes e possuem muitos campos

select e.ename, d.dname, e.deptno
from scott.emp e join scott.dept d
on (e.deptno = d.deptno);
