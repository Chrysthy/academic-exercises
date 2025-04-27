-- Junções internas - inner joins

select ename, sal, deptno
from scott.emp;

select deptno, dname, loc
from scott.emp;


-- construção da inner join
-- junções idênticas, que são junções internas, são feitas com o operador JOIN

select e.ename,d.dname, e.sal
from scott.emp e join scott.dept d
on(e.deptno = d.deptno);

-- Para fazer uma identificação, podemos adicionar inner mas é uma palavra opcional. Inner é só para identificar que é uma junção interna, não é uma palavra obrigatória.
-- Obrigatório é o join e estabelecer a condição de junção.
select e.ename,d.dname, e.sal, d.loc
from scott.emp e inner join scott.dept d
on(e.deptno = d.deptno);


--Combinando INNER JOIN com WHERE e Apelidos
-- salário maior que 2000 
select e.ename,d.dname, e.sal, d.loc
from scott.emp e inner join scott.dept d
on(e.deptno = d.deptno);
where e.sal> 2000;

-- Colocando apelidos para as colunas
-- Nome, Departamento, Salário e Local
select e.ename NOME, d.dname DEPARTAMENTO, e.sal SALÁRIO, d.loc LOCAL
from scott.emp e inner join scott.dept d
on(e.deptno = d.deptno);
where e.sal> 2000;