-- Subconsulta na cláusula FROM


select a.ename, a.sal, a.deptno, trunc(b.salavg)
from scott.emp a, (select deptno, avg(sal) salavg
                    from scott.emp
                    group by deptno) b
where a.deptno = b.deptno
and a.sal > b.salavg
order by deptno;