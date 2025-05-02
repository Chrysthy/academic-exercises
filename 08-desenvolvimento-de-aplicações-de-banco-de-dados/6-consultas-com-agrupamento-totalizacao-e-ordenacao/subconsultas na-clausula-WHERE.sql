-- Subconsultas na cláusula WHERE

--Saber qual é o cargo do funcionário cujo número é 7566.
-- Consulta de dentro
select job 
from scott.emp
where empno = 7566;


select ename, sal, job
from scott.emp
where job = (select job
             from scott.emp
             where empno = 7566)