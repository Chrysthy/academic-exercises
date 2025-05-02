--Junções externas (OUTER JOINS)

select e.ename, d.deptno, d.dname
from scott.emp e join scott.dept d
on (e.deptno=d.deptno);

-- Se não tiver correspondência, aquele funcionário ou aquele departamento não aparece no resultado. Por isso, fazemos o full outer join, para trazer tudo.

-- junção externa completa (FULL OUTER JOIN)
-- a palavra outer é opcional, se digitar apenas full join, o resultado será o mesmo mas é bom usar a palavra outer para deixar claro que é uma junção externa. Boas práticas.
select e.ename, e.sal, e.deptno,d.deptno, d.dname
from scott.emp e full outer join scott.dept d
on (e.deptno=d.deptno);
